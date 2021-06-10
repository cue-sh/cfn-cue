package main

import (
	"context"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"path"
	"reflect"
	"sort"
	"strings"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
	"github.com/google/go-github/v35/github"
)

func mergeMaps(a, b map[string]bool) map[string]bool {
	for str := range b {
		a[str] = true
	}
	return a
}

func propertyCustomizations(name string, parentName string, prop Property) (changed bool, p Property) {
	if parentName == "AWS::AppSync::GraphQLApi" && name == "AdditionalAuthenticationProviders" {
		p = Property{ItemType: "AdditionalAuthenticationProvider", Type: "List", Required: false}
	}
	if parentName == "AWS::AppSync::GraphQLApi" && name == "Tags" {
		p = Property{ItemType: "Tag", Type: "List", Required: false}
	}
	if parentName == "AWS::CodeBuild::Project" && name == "FilterGroups" {
		p = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
	}
	// AWS::EC2::Instance.NoDevice
	if name == "NoDevice" && prop.Type == "NoDevice" {
		p = Property{PrimitiveType: "String", Required: false}
	}
	// AWS::Glue::SecurityConfiguration.S3Encryptions
	// if name == "S3Encryptions" && prop.Type == "S3Encryption" {
	if parentName == "EncryptionConfiguration" && name == "S3Encryptions" {
		p = Property{ItemType: "S3Encryption", Type: "List", Required: false}
	}
	// AWS::IoTAnalytics::Channel.ServiceManagedS3 -- Skipped
	// AWS::IoTAnalytics::Datastore.ServiceManagedS3 -- Skipped
	// AWS::LakeFormation::DataLakeSettings.Admins
	if parentName == "AWS::LakeFormation::DataLakeSettings" && name == "Admins" {
		p = Property{ItemType: "DataLakePrincipal", Type: "List", Required: false}
	}
	// AWS::MediaLive::Channel.AribSourceSettings -- Skipped
	// AWS::Transfer::User.SshPublicKey
	if parentName == "AWS::Transfer::User" && name == "SshPublicKeys" {
		p = Property{PrimitiveItemType: "String", Type: "List", Required: false}
	}

	changed = !reflect.ValueOf(p).IsZero()

	return changed, p
}

func createExprFromProperty(name string, prop Property, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType, parentName string, parentResource Resource) (node *ast.Expr, imports map[string]bool) {
	// TODO: Need to capture Map Types, and put the PrimitiveItemType or ItemType properly into a struct
	var value ast.Expr
	custom := false

	changed, tmpProp := propertyCustomizations(name, parentName, prop)

	if changed {
		prop = tmpProp
	}

	if name == "FilterGroups" && prop.ItemType == "FilterGroup" {
		var v ast.StructLit
		v, imports = createStructFromResource(name, resourceSubproperties["WebhookFilter"], resourceSubproperties, valueTypes)
		value = ast.NewList(&ast.Ellipsis{Type: &v})
		prop = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
		custom = true
	}

	if prop.IsPrimitive() || prop.IsMapOfPrimitives() || prop.IsListOfPrimitives() {
		var constraints []ast.Expr
		value = prop.getCUEPrimitiveType()
		if name == "PolicyDocument" || name == "AssumeRolePolicyDocument" {
			jsonStruct, ok := value.(*ast.StructLit)
			if ok {
				value = &ast.StructLit{
					Elts: []ast.Decl{
						jsonStruct,
						newField("Version", ast.NewBinExpr(token.OR, ast.NewIdent("string"), &ast.BasicLit{Value: `*"2012-10-17"`})),
					},
				}
			}
		}
		constraints, imports = getPrimitiveConstraints(prop, valueTypes[prop.Value.ValueType])
		if convertTypeToCUE(prop.getPrimitiveTypeString()) == "time.Time" {
			imports["time"] = true
		}

		if len(constraints) > 0 {
			value = constraints[0]
			for _, constraint := range constraints[1:] {
				val := ast.NewBinExpr(token.AND, value, &ast.ParenExpr{X: constraint})
				value = val
			}

			value = &ast.ParenExpr{
				X: value,
			}
		}
		if *intrinsicsFlag {
			value = ast.NewBinExpr(token.OR, &ast.UnaryExpr{Op: token.MUL, X: value}, ast.NewSel(ast.NewIdent("fn"), "#Fn"))
		}

		if prop.IsList() {
			value = &ast.ParenExpr{X: value}
		}
	} else if !custom {
		var typeName string
		if prop.IsList() || prop.IsMap() {
			typeName = prop.ItemType
		} else {
			typeName = prop.Type
		}
		resource := resourceSubproperties[typeName]

		if resource.Recursive {
			value = ast.NewIdent("_#" + typeName)
		} else {
			var v ast.StructLit
			v, imports = createStructFromResource(name, resourceSubproperties[typeName], resourceSubproperties, valueTypes)
			value = &v
		}
	}

	if prop.IsList() {
		value2 := value
		value = ast.NewList(&ast.Ellipsis{Type: value})
		if prop.IsListOfPrimitives() {
			value = ast.NewBinExpr(token.OR, value, value2)
		}
	}

	if prop.IsMap() {
		value = ast.NewStruct(ast.NewList(&ast.BasicLit{Value: "string"}), value)
	}

	if *intrinsicsFlag && (prop.IsMap() || (prop.IsList() && !prop.IsListOfPrimitives()) || prop.IsCustomType()) {
		value = ast.NewBinExpr(token.OR, &ast.UnaryExpr{Op: token.MUL, X: value}, ast.NewSel(ast.NewIdent("fn"), "#If"))
	}

	return &value, imports
}

func createStructFromResource(resourceName string, resource Resource, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType) (s ast.StructLit, imports map[string]bool) {
	properties := resource.Properties
	propertyNames := propertyNames(resource.Properties)
	sort.Strings(propertyNames)
	imports = map[string]bool{}

	propertyDecls := make([]ast.Decl, 0)

	for _, propertyName := range propertyNames {
		propertyResource := properties[propertyName]

		expr, propImports := createExprFromProperty(propertyName, propertyResource, resourceSubproperties, valueTypes, resourceName, resource)

		var optional token.Pos
		switch propertyResource.Required {
		case true:
			optional = token.NoRelPos.Pos()
		case false:
			optional = token.Elided.Pos()
		}
		node := &ast.Field{
			Label:    ast.NewIdent(propertyName),
			Value:    *expr,
			Optional: optional,
		}

		if len(propImports) > 0 {
			imports = mergeMaps(imports, propImports)
		}
		propertyDecls = append(propertyDecls, node)

	}

	if resourceName == "AWS::CloudFormation::CustomResource" {
		propertyDecls = append(propertyDecls, &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label: ast.NewList(&ast.BasicLit{Value: "string"}),
					Value: &ast.BasicLit{Value: "_"},
				},
			},
		})
	}

	s = ast.StructLit{
		Elts: propertyDecls,
	}
	return s, imports
}

func templateParameters() *ast.Field {
	baseParameterTypes := []string{
		"String",
		"Number",
		"List<Number>",
		"CommaDelimitedList",
	}

	awsParameterTypesMap := map[string]bool{
		"AWS::EC2::AvailabilityZone::Name":   true,
		"AWS::EC2::Image::Id":                true,
		"AWS::EC2::Instance::Id":             true,
		"AWS::EC2::KeyPair::KeyName":         false,
		"AWS::EC2::SecurityGroup::GroupName": true,
		"AWS::EC2::SecurityGroup::Id":        true,
		"AWS::EC2::Subnet::Id":               true,
		"AWS::EC2::Volume::Id":               true,
		"AWS::EC2::VPC::Id":                  true,
		"AWS::Route53::HostedZone::Id":       true,
	}

	awsParameterTypes := []string{}
	for param := range awsParameterTypesMap {
		awsParameterTypes = append(awsParameterTypes, param)
	}

	awsListParameterTypes := []string{}
	for param, listType := range awsParameterTypesMap {
		if listType {
			awsListParameterTypes = append(awsListParameterTypes, "List<"+param+">")
		}
	}
	ssmParameterTypes := []string{
		"AWS::SSM::Parameter::Name",
		"AWS::SSM::Parameter::Value<String>",
		"AWS::SSM::Parameter::Value<List<String>>",
		"AWS::SSM::Parameter::Value<CommaDelimitedList>",
	}
	for _, param := range awsParameterTypes {
		ssmParameterTypes = append(ssmParameterTypes, "AWS::SSM::Parameter::Value<"+param+">")
		ssmParameterTypes = append(ssmParameterTypes, "AWS::SSM::Parameter::Value<List<"+param+">>")
	}

	parameterTypes := []string{}
	parameterTypes = append(parameterTypes, baseParameterTypes...)
	parameterTypes = append(parameterTypes, awsParameterTypes...)
	parameterTypes = append(parameterTypes, awsListParameterTypes...)
	parameterTypes = append(parameterTypes, ssmParameterTypes...)
	sort.Strings(parameterTypes)

	parameterTypesExpr := make([]ast.Expr, 0, len(parameterTypes))

	for _, param := range parameterTypes {
		parameterTypesExpr = append(parameterTypesExpr, ast.NewString(param))
	}

	var parameterDisjunction ast.Expr

	parameterDisjunction = parameterTypesExpr[0]

	for _, param := range parameterTypesExpr[1:] {
		parameterDisjunction = &ast.BinaryExpr{X: parameterDisjunction, Op: token.OR, Y: param}
	}

	parameterProperties := [][]string{
		{"AllowedPattern", "string"},
		{"AllowedValues", "[...(string | number | bool)]"},
		{"ConstraintDescription", "string"},
		{"Default", "string | number | bool"},
		{"Description", "string"},
		{"MaxLength", `int | =~"^[0-9]+$"`},
		{"MaxValue", `int | =~"^[0-9]+$"`},
		{"MinLength", `int | =~"^[0-9]+$"`},
		{"MinValue", `int | =~"^[0-9]+$"`},
		{"NoEcho", `bool | =~"^(true|false)$"`},
	}
	parameterPropertiesFields := []ast.Decl{newField("Type", parameterDisjunction)}

	for _, arr := range parameterProperties {
		prop := arr[0]
		propType := arr[1]
		parameterPropertiesFields = append(parameterPropertiesFields, newOptionalField(prop, &ast.BasicLit{Value: propType}))
	}

	templateParameters := newOptionalField("Parameters", ast.NewStruct(
		ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}), &ast.StructLit{Elts: parameterPropertiesFields}),
	)

	return templateParameters
}

// func writeServiceFile(serviceName string, resources map[string]Resource, shortRegion string) error {

// 	return nil
// }

// func templateResources() *ast.Field {
// 	propertiesByResource := map[string]map[string]Resource{}

// 	return nil
// }

func tryParse(str string) ast.Expr {
	expr, _ := parser.ParseExpr("", str)
	return expr
}

func newField(name string, value ast.Expr) *ast.Field {
	return &ast.Field{
		Label: ast.NewIdent(name),
		Value: value,
	}
}

func newOptionalField(name string, value ast.Expr) *ast.Field {
	return &ast.Field{
		Label:    ast.NewIdent(name),
		Optional: token.Elided.Pos(),
		Value:    value,
	}
}

func top() *ast.BasicLit {
	return &ast.BasicLit{Value: "_"}
}

func bulkOptionalLabel() *ast.ListLit {
	return ast.NewList(&ast.BasicLit{Value: "string"})
}

func resourceCreationPolicy() *ast.Field {
	return &ast.Field{
		Label:    ast.NewIdent("CreationPolicy"),
		Optional: token.Elided.Pos(),
		Value: &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label:    ast.NewIdent("AutoScalingCreationPolicy"),
					Optional: token.Elided.Pos(),
					Value: &ast.StructLit{
						Elts: []ast.Decl{
							&ast.Field{
								Label:    ast.NewIdent("MinSuccessfulInstancesPercent"),
								Optional: token.Elided.Pos(),
								Value:    &ast.BasicLit{Value: "int"},
							},
						},
					},
				},
				&ast.Field{
					Label:    ast.NewIdent("ResourceSignal"),
					Optional: token.Elided.Pos(),
					Value: &ast.StructLit{
						Elts: []ast.Decl{
							&ast.Field{
								Label:    ast.NewIdent("Count"),
								Optional: token.Elided.Pos(),
								Value:    &ast.BasicLit{Value: "int"},
							},
							&ast.Field{
								Label:    ast.NewIdent("Timeout"),
								Optional: token.Elided.Pos(),
								Value:    &ast.BasicLit{Value: "string"},
							},
						},
					},
				},
			},
		},
	}
}

func resourcePolicies(resourceName string) []*ast.Field {
	policies := make([]*ast.Field, 0, 3)
	switch resourceName {
	case "AWS::AutoScaling::AutoScalingGroup", "AWS::EC2::Instance", "AWS::CloudFormation::WaitCondition":
		policies = append(policies, resourceCreationPolicy())
	}
	deletionPolicyStrings := []string{"Delete", "Retain"}
	switch resourceName {
	case "AWS::EC2::Volume",
		"AWS::ElastiCache::CacheCluster",
		"AWS::ElastiCache::ReplicationGroup",
		"AWS::Neptune::DBCluster",
		"AWS::RDS::DBCluster",
		"AWS::RDS::DBInstance",
		"AWS::Redshift::Cluster":
		deletionPolicyStrings = append(deletionPolicyStrings, "Snapshot")
	}
	var deletionPolicies ast.Expr
	deletionPolicies = ast.NewString(deletionPolicyStrings[0])

	for _, deletionPolicy := range deletionPolicyStrings[1:] {
		deletionPolicies = &ast.BinaryExpr{X: deletionPolicies, Op: token.OR, Y: ast.NewString(deletionPolicy)}
	}
	policies = append(policies, newOptionalField("DeletionPolicy", deletionPolicies))
	policies = append(policies, newOptionalField("UpdateReplacePolicy", deletionPolicies))

	switch resourceName {
	case "AWS::AutoScaling::AutoScalingGroup",
		"AWS::ElastiCache::ReplicationGroup",
		"AWS::Elasticsearch::Domain",
		"AWS::Lambda::Alias":
		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatepolicy.html
		// TODO: Flesh out UpdatePolicy
		policies = append(policies, &ast.Field{
			Label:    ast.NewIdent("UpdatePolicy"),
			Optional: token.Elided.Pos(),
			Value:    ast.NewStruct(bulkOptionalLabel(), top()),
		})
		deletionPolicyStrings = append(deletionPolicyStrings, "Snapshot")
	}
	return policies
}

func resourceMetadata() *ast.Field {
	return &ast.Field{
		Label:    ast.NewIdent("Metadata"),
		Optional: token.Elided.Pos(),
		Value:    ast.NewStruct(bulkOptionalLabel(), top()),
	}
}

func resourceType(resourceName string) *ast.Field {
	resourceType := ast.Field{
		Label: ast.NewIdent("Type"),
		Value: ast.NewString(resourceName),
	}
	if resourceName == "AWS::CloudFormation::CustomResource" {
		resourceType.Value = &ast.BinaryExpr{
			X:  resourceType.Value,
			Op: token.OR,
			Y: &ast.UnaryExpr{
				Op: token.MAT,
				X:  &ast.BasicLit{Kind: token.STRING, Value: "#\"^Custom::[a-zA-Z0-9_@-]{1,60}$\"#"},
			},
		}
	}
	return &resourceType
}

type Parents struct {
	arr []string
}

func (p *Parents) Push(el string) {
	p.arr = append(p.arr, el)
}

func (p *Parents) Pop() {
	n := len(p.arr) - 1
	p.arr[n] = ""
	p.arr = p.arr[:n]
}

func (p *Parents) Len() int {
	return len(p.arr)
}

func (p *Parents) Contains(str string) bool {
	for _, el := range p.arr {
		if el == str {
			return true
		}
	}
	return false
}

func findRecursiveProperties(resource Resource, properties map[string]Resource, parents *Parents) {
	for _, property := range resource.Properties {
		var propertyType string
		switch {
		case property.ItemType != "":
			propertyType = property.ItemType
		case property.PrimitiveItemType != "":
			propertyType = property.PrimitiveItemType
		case property.Type != "":
			propertyType = property.Type
		default:
			propertyType = property.PrimitiveType
		}

		if parents.Contains(propertyType) {
			propResource := properties[propertyType]
			propResource.Recursive = true
			properties[propertyType] = propResource
			return
		}

		if ((property.ItemType != "") || (property.Type != "")) && !parents.Contains(propertyType) {
			parents.Push(propertyType)
			findRecursiveProperties(properties[propertyType], properties, parents)
			parents.Pop()
		}
	}
}

func findRecursive(resourcesByService map[string]map[string]Resource, propertiesByResource map[string]map[string]Resource) {
	for _, resources := range resourcesByService {
		for resourceName, resource := range resources {
			parents := &Parents{}
			findRecursiveProperties(resource, propertiesByResource[resourceName], parents)
		}
	}
}

func processRegion(region, cloudformationSpec string) {
	shortRegion := strings.ReplaceAll(region, "-", "")

	// cloudformationSpec := "https://github.com/aws-cloudformation/cfn-python-lint/raw/master/src/cfnlint/data/CloudSpecs/" + region + ".json"
	// fmt.Println(cloudformationSpec)
	fmt.Println("Generating " + region)
	data, _ := downloadSpec(cloudformationSpec)

	spec, specErr := processSpec("cfn", data)
	if specErr != nil {
		fmt.Println(specErr)
		return
	}

	propertiesByResource := *propertiesByResource(spec)

	serviceNames := serviceNames(spec)

	resourcesByService := *resourcesByService(spec, serviceNames)

	findRecursive(resourcesByService, propertiesByResource)

	// os.Exit(0)

	resourceTypes := make([]ast.Expr, 0)
	// resourceTypesFields := []ast.Decl{}

	for _, serviceName := range serviceNames {
		if *serviceFlag != "" && !strings.Contains(*serviceFlag, serviceName) {
			continue
		}
		resources := resourcesByService[serviceName]
		// fmt.Println(serviceName)
		ff := &ast.File{
			Filename: serviceName,
			Decls: []ast.Decl{
				&ast.Package{
					Name: ast.NewIdent(shortRegion),
				},
			},
		}
		importStrings := map[string]bool{}
		imports := &ast.ImportDecl{
			Specs: []*ast.ImportSpec{{
				Path: ast.NewString("github.com/cue-sh/cfn-cue/aws/fn"),
			}},
		}

		serviceResources := make([]ast.Decl, 0)

		resourceNames := resourceNamesSlice(resources)
		sort.Strings(resourceNames)

		for _, resourceName := range resourceNames {
			if *resourceFlag != "" && resourceName != *resourceFlag {
				continue
			}
			resource := resources[resourceName]

			splits := strings.Split(resourceName, "::")
			resourceSubproperties := propertiesByResource[resourceName]

			resourceStr := splits[2]

			properties, resourceImports := createStructFromResource(resourceName, resource, resourceSubproperties, spec.ValueTypes)
			for propertyName, propertyResource := range resourceSubproperties {
				if propertyResource.Recursive {
					propertyStruct, propertyImports := createStructFromResource(propertyName, propertyResource, resourceSubproperties, spec.ValueTypes)
					properties.Elts = append(properties.Elts, newField("_#"+propertyName, &propertyStruct))
					importStrings = mergeMaps(importStrings, propertyImports)
				}
			}
			importStrings = mergeMaps(importStrings, resourceImports)
			propertiesStruct := newField("Properties", &properties)

			resourceType := resourceType(resourceName)
			resourceElts := []ast.Decl{
				resourceType,
				propertiesStruct,
				newOptionalField("DependsOn", ast.NewBinExpr(token.OR, ast.NewIdent("string"), ast.NewList(&ast.Ellipsis{Type: ast.NewIdent("string")}))),
			}

			for _, policy := range resourcePolicies(resourceName) {
				resourceElts = append(resourceElts, policy)
			}

			resourceElts = append(resourceElts, resourceMetadata())
			resourceElts = append(resourceElts, newOptionalField("Condition", ast.NewIdent("string")))

			serviceResources = append(serviceResources, newField("#"+resourceStr, &ast.StructLit{Elts: resourceElts}))

			resourceTypes = append(resourceTypes, ast.NewSel(ast.NewIdent("#"+serviceName), "#"+resourceStr))
		}

		builtInImports := []string{}

		for importString := range importStrings {
			builtInImports = append(builtInImports, importString)
		}
		sort.Strings(builtInImports)
		for _, importString := range builtInImports {
			imports.Specs = append(imports.Specs, &ast.ImportSpec{Path: ast.NewString(importString)})
		}

		ff.Decls = append(ff.Decls, imports)

		serviceField := newField("#"+serviceName, &ast.StructLit{Elts: serviceResources})

		ff.Decls = append(ff.Decls, serviceField)
		b, formatErr := format.Node(ff, format.Simplify())

		if formatErr != nil {
			fmt.Println("Error formatting " + serviceName)
			continue
		}

		// servicePackage := path.Join("/aws/", shortRegion)

		folder := path.Join("aws", *prefix, shortRegion)

		os.MkdirAll(folder, os.ModePerm)

		cuefile, err := os.Create(path.Join(folder, serviceName+".cue"))
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = cuefile.Write(b)
		if err != nil {
			fmt.Println(err)
			cuefile.Close()
			return
		}
		err = cuefile.Close()
		if err != nil {
			fmt.Println(err)
			return
		}
	}

	resourceTypesExpr := resourceTypes[0]

	for _, resource := range resourceTypes[1:] {
		resourceTypesExpr = &ast.BinaryExpr{X: resourceTypesExpr, Op: token.OR, Y: resource}
	}

	resourceNames := resourceNamesSlice(spec.Resources)
	sort.Strings(resourceNames)
	var resourceTypeStrings ast.Expr

	resourceTypeStrings = ast.NewString(resourceNames[0])

	for _, resourceName := range resourceNames[1:] {
		resourceTypeStrings = &ast.BinaryExpr{X: resourceTypeStrings, Op: token.OR, Y: ast.NewString(resourceName)}
	}
	resourceTypeStrings = &ast.BinaryExpr{X: resourceTypeStrings, Op: token.OR, Y: &ast.UnaryExpr{
		Op: token.MAT,
		X:  &ast.BasicLit{Kind: token.STRING, Value: "#\"^Custom::[a-zA-Z0-9_@-]{1,60}$\"#"},
	}}

	declarations := []ast.Decl{
		&ast.Package{
			Name: ast.NewIdent(shortRegion),
		},
		&ast.ImportDecl{
			Specs: []*ast.ImportSpec{{
				Path: ast.NewString("github.com/cue-sh/cfn-cue/aws/fn"),
			}},
		},
		newField("#ResourceSpecificationVersion", ast.NewString(spec.ResourceSpecificationVersion)),
	}

	deletionPolicyStrings := []string{"Delete", "Retain", "Snapshot"}
	var deletionPolicies ast.Expr
	deletionPolicies = ast.NewString(deletionPolicyStrings[0])

	for _, deletionPolicy := range deletionPolicyStrings[1:] {
		deletionPolicies = &ast.BinaryExpr{X: deletionPolicies, Op: token.OR, Y: ast.NewString(deletionPolicy)}
	}
	var templateResources *ast.Field
	// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html
	if *fullDisjunction {
		templateResources = newField("Resources", ast.NewStruct(ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}), resourceTypesExpr))
	} else {
		templateResources = &ast.Field{
			Label: ast.NewIdent("Resources"),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								newOptionalField("Description", ast.NewIdent("string")),
								newField("Type", resourceTypeStrings),
								newField("Properties", ast.NewStruct(bulkOptionalLabel(), top())),
								newOptionalField("DependsOn",
									ast.NewBinExpr(token.OR,
										ast.NewIdent("string"),
										ast.NewList(&ast.Ellipsis{Type: ast.NewIdent("string")}),
									),
								),
								newOptionalField("DeletionPolicy", deletionPolicies),
								newOptionalField("UpdateReplacePolicy", deletionPolicies),
								newOptionalField("CreationPolicy", ast.NewIdent("_")),
								newOptionalField("UpdatePolicy", ast.NewIdent("_")),
								newOptionalField("Metadata", ast.NewStruct(bulkOptionalLabel(), top())),
								newOptionalField("Condition", ast.NewIdent("string")),
							},
						},
					},
				},
			},
		}
	}

	declarations = append(declarations, &ast.Field{
		Label: ast.NewIdent("#" + "Template"),
		// Token: token.ISA,
		Value: &ast.StructLit{
			Elts: []ast.Decl{
				newOptionalField("AWSTemplateFormatVersion", ast.NewString("2010-09-09")),
				newOptionalField("Description", &ast.BasicLit{Value: "string"}),
				newOptionalField("Metadata", ast.NewStruct(ast.NewList(&ast.BasicLit{Value: "string"}), &ast.BasicLit{Value: "_"})),
				// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/mappings-section-structure.html
				newOptionalField("Mappings", ast.NewStruct(
					ast.NewList(&ast.BasicLit{Value: "string"}),
					ast.NewStruct(
						ast.NewList(&ast.BasicLit{Value: "string"}),
						ast.NewStruct(
							ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
							ast.NewBinExpr(token.OR, &ast.BasicLit{Value: "string | int | bool"}, ast.NewList(&ast.Ellipsis{Type: &ast.BasicLit{Value: "(string | int | bool)"}})))))),

				// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/conditions-section-structure.html
				newOptionalField("Conditions", ast.NewStruct(
					ast.NewList(&ast.BasicLit{Value: "string"}),
					ast.NewBinExpr(
						token.OR, ast.NewSel(ast.NewIdent("fn"), "#And"),
						ast.NewSel(ast.NewIdent("fn"), "#Equals"),
						ast.NewSel(ast.NewIdent("fn"), "#If"),
						ast.NewSel(ast.NewIdent("fn"), "#Not"),
						ast.NewSel(ast.NewIdent("fn"), "#Or"),
					),
				)),
				templateParameters(),
				templateResources,
				// resourcesForLoop,
				// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html
				newOptionalField("Outputs", tryParse(`{
						[=~"[a-zA-Z0-9]"]: {
							Description?: string
							Value:        _
							Condition?:   string
							Export?: Name: _
						}
					}`)),
			},
		},
	})

	allServicesFile := &ast.File{
		Filename: shortRegion + ".cue",
		Decls:    declarations,
	}

	b, _ := format.Node(allServicesFile, format.Simplify())
	packageFolder := path.Join("aws", *prefix, shortRegion)

	os.MkdirAll(packageFolder, os.ModePerm)

	cuefile, err := os.Create(path.Join(packageFolder, shortRegion+".cue"))
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = cuefile.Write(b)
	if err != nil {
		fmt.Println(err)
		cuefile.Close()
		return
	}
	// fmt.Println(l, "bytes written successfully")
	err = cuefile.Close()
	if err != nil {
		fmt.Println(err)
		return
	}

}

func saveRegions(regions []string) {
	sort.Strings(regions)
	fmt.Println("Generating Regions")
	var binaryExpr ast.Expr
	binaryExpr = ast.NewString(regions[0])

	for _, region := range regions[1:] {
		binaryExpr = &ast.BinaryExpr{
			X:  binaryExpr,
			Op: token.OR,
			Y:  ast.NewString(region),
		}
	}

	file := &ast.File{
		Filename: "regions.cue",
		Decls: []ast.Decl{
			&ast.Package{
				Name: ast.NewIdent("regions"),
			},
			&ast.Field{
				Label: ast.NewIdent("#Regions"),
				Value: binaryExpr,
			},
		},
	}
	bytes, formatErr := format.Node(file, format.Simplify())

	if formatErr != nil {
		fmt.Println("Error formatting regions")
		return
	}

	folder := path.Join("aws", "regions")
	os.MkdirAll(folder, os.ModePerm)

	cuefile, err := os.Create(path.Join(folder, file.Filename))
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = cuefile.Write(bytes)
	if err != nil {
		fmt.Println(err)
		cuefile.Close()
		return
	}
	err = cuefile.Close()
	if err != nil {
		fmt.Println(err)
		return
	}
}

var regionFlag = flag.String("region", "", "Choose a single region to generate")
var intrinsicsFlag = flag.Bool("intrinsics", true, "Turn intrinsic functions on/off")
var fullDisjunction = flag.Bool("full", false, "This flag switch cfn-cue to use full resource disjunctions.")
var serviceFlag = flag.String("service", "", "Only process a single service")
var resourceFlag = flag.String("resource", "", "Only this resource")
var prefix = flag.String("prefix", "", "this prefix")

func main() {
	flag.Parse()

	client := github.NewClient(nil)
	master := &github.RepositoryContentGetOptions{Ref: "main"}
	_, dirContent, _, listErr := client.Repositories.GetContents(context.Background(), "aws-cloudformation", "cfn-python-lint", "src/cfnlint/data/CloudSpecs", master)
	if listErr != nil {
		fmt.Println(listErr)
		os.Exit(1)
	}

	regions := map[string]string{}

	for _, c := range dirContent {
		filename := c.GetName()
		if strings.Contains(filename, ".json") {
			regionName := strings.ReplaceAll(filename, ".json", "")
			regions[regionName] = c.GetDownloadURL()
		}
	}

	if *regionFlag != "" {
		validRegion := false
		for regionName := range regions {
			if *regionFlag == regionName {
				validRegion = true
			}
		}
		if !validRegion {
			fmt.Println(*regionFlag + " is not a valid region")
			os.Exit(1)
		}
	}

	for region, downloadURL := range regions {
		if *regionFlag != "" && region != *regionFlag {
			continue
		}
		processRegion(region, downloadURL)
	}

	regionsArr := make([]string, 0, len(regions))

	for k := range regions {
		regionsArr = append(regionsArr, k)
	}
	saveRegions(regionsArr)
}

func downloadSpec(location string) ([]byte, error) {
	uri, err := url.Parse(location)
	if err != nil {
		return nil, err
	}

	switch uri.Scheme {
	case "https", "http":
		uri := uri.String()
		response, err := http.Get(uri)
		if err != nil {
			return nil, err
		}

		data, err := ioutil.ReadAll(response.Body)
		if err != nil {
			return nil, err
		}

		return data, nil
	case "file":
		data, err := ioutil.ReadFile(strings.Replace(location, "file://", "", -1))
		if err != nil {
			return nil, err
		}

		return data, nil
	}

	return nil, fmt.Errorf("invalid URL scheme %s", uri.Scheme)
}

func processSpec(specname string, data []byte) (*CloudFormationResourceSpecification, error) {
	// Unmarshall the JSON specification
	spec := &CloudFormationResourceSpecification{}
	if err := json.Unmarshal(data, spec); err != nil {
		return nil, err
	}

	return spec, nil
}
