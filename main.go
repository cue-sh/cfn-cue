package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"path"
	"sort"
	"strings"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
)

func mergeMaps(a, b map[string]bool) map[string]bool {
	for str := range b {
		a[str] = true
	}
	return a
}

func createFieldFromProperty(name string, prop Property, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType, parentName string, parentResource Resource) (node *ast.Field, imports map[string]bool) {
	// Need to capture Map Types, and put the PrimitiveItemType or ItemType properly into a struct
	var value ast.Expr
	var value2 ast.Expr
	custom := false

	if parentName == "AWS::AppSync::GraphQLApi" && name == "AdditionalAuthenticationProviders" {
		prop = Property{ItemType: "AdditionalAuthenticationProvider", Type: "List", Required: false}
	}
	if parentName == "AWS::AppSync::GraphQLApi" && name == "Tags" {
		prop = Property{ItemType: "Tag", Type: "List", Required: false}
	}
	if parentName == "AWS::CodeBuild::Project" && name == "FilterGroups" {
		prop = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
	}
	if name == "FilterGroups" && prop.ItemType == "FilterGroup" {
		var v ast.StructLit
		v, imports = createStructFromResource(name, resourceSubproperties["WebhookFilter"], resourceSubproperties, valueTypes)
		value = ast.NewList(&ast.Ellipsis{Type: &v})
		prop = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
		custom = true
	}
	// AWS::EC2::Instance.NoDevice
	if name == "NoDevice" && prop.Type == "NoDevice" {
		prop = Property{PrimitiveType: "String", Required: false}
	}
	// AWS::Glue::SecurityConfiguration.S3Encryptions
	// if name == "S3Encryptions" && prop.Type == "S3Encryption" {
	if parentName == "EncryptionConfiguration" && name == "S3Encryptions" {
		prop = Property{ItemType: "S3Encryption", Type: "List", Required: false}
	}
	// AWS::IoTAnalytics::Channel.ServiceManagedS3 -- Skipped
	// AWS::IoTAnalytics::Datastore.ServiceManagedS3 -- Skipped
	// AWS::LakeFormation::DataLakeSettings.Admins
	if parentName == "AWS::LakeFormation::DataLakeSettings" && name == "Admins" {
		prop = Property{ItemType: "DataLakePrincipal", Type: "List", Required: false}
	}
	// AWS::MediaLive::Channel.AribSourceSettings -- Skipped
	// AWS::Transfer::User.SshPublicKey
	if parentName == "AWS::Transfer::User" && name == "SshPublicKeys" {
		prop = Property{PrimitiveItemType: "String", Type: "List", Required: false}
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

		// value2 = prop.getCUEPrimitiveType()

		if len(constraints) > 0 {
			value = constraints[0]
			for _, constraint := range constraints[1:] {
				val := ast.NewBinExpr(token.AND, value, &ast.ParenExpr{X: constraint})
				value = val
			}

			value = &ast.ParenExpr{
				X: value,
			}
			//  = val
			// value2 = val
			// value2 = nil
		}
		if *intrinsicsFlag {
			value = ast.NewBinExpr(token.OR, value, ast.NewSel(ast.NewIdent("fn"), "#Fn"))
		}

		if prop.IsList() {
			value = &ast.ParenExpr{X: value}
		}
	} else if !custom {
		// This is a more complex type, we need to recurse...
		var typeName string
		if prop.IsList() || prop.IsMap() {
			typeName = prop.ItemType
		} else {
			typeName = prop.Type
		}
		if typeName == parentResource.Properties[parentName].ItemType {
			// Weird recursion... might need some cleverness with Aliases to structure this correctly.
			value = ast.NewStruct(ast.NewList(&ast.BasicLit{Value: "string"}), &ast.BasicLit{Value: "_"})
		} else {
			var v ast.StructLit
			v, imports = createStructFromResource(name, resourceSubproperties[typeName], resourceSubproperties, valueTypes)
			value = &v
		}
	}

	if prop.IsList() {
		value2 = value
		value = ast.NewList(&ast.Ellipsis{Type: value})
		if prop.IsListOfPrimitives() {
			// var s ast.Expr
			// if value2 != nil {
			// 	s = &ast.BinaryExpr{
			// 		X:  value2,
			// 		Op: token.OR,
			// 		Y:  ast.NewSel(ast.NewIdent("fn"), "Fn"),
			// 	}
			// } else {
			// 	s = ast.NewSel(ast.NewIdent("fn"), "Fn")
			// }
			value = ast.NewBinExpr(token.OR, value, value2)
		}
	}

	if prop.IsMap() {
		value = ast.NewStruct(ast.NewList(&ast.BasicLit{Value: "string"}), value)
	}

	if *intrinsicsFlag && (prop.IsMap() || (prop.IsList() && !prop.IsListOfPrimitives()) || prop.IsCustomType()) {
		value = ast.NewBinExpr(token.OR, value, ast.NewSel(ast.NewIdent("fn"), "#If"))
	}

	var optional token.Pos
	switch prop.Required {
	case true:
		optional = token.NoRelPos.Pos()
	case false:
		optional = token.Elided.Pos()
	}
	node = &ast.Field{
		Label:    ast.NewIdent(name),
		Value:    value,
		Optional: optional,
	}

	return node, imports
}

func createStructFromResource(resourceName string, resource Resource, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType) (s ast.StructLit, imports map[string]bool) {
	properties := resource.Properties
	propertyNames := propertyNames(resource.Properties)
	sort.Strings(propertyNames)
	imports = map[string]bool{}

	propertyDecls := make([]ast.Decl, 0)

	for _, propertyName := range propertyNames {
		propertyResource := properties[propertyName]

		value, propImports := createFieldFromProperty(propertyName, propertyResource, resourceSubproperties, valueTypes, resourceName, resource)
		if len(propImports) > 0 {
			imports = mergeMaps(imports, propImports)
		}
		propertyDecls = append(propertyDecls, value)
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

	// if len(imports) > 0 {
	// 	fmt.Println("struct resource imports:", imports)
	// }

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

func newBulkOptionalField(value ast.Expr) *ast.Field {
	return &ast.Field{
		Label: ast.NewList(&ast.BasicLit{Value: "string"}),
		Value: value,
	}
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

var regionFlag = flag.String("region", "", "Choose a single region to generate")
var intrinsicsFlag = flag.Bool("intrinsics", true, "Turn intrinsic functions on/off")

func main() {
	flag.Parse()
	fmt.Println("Region: " + *regionFlag)
	regions := []string{
		"af-south-1",
		"ap-east-1",
		"ap-northeast-1",
		"ap-northeast-2",
		"ap-northeast-3",
		"ap-south-1",
		"ap-southeast-1",
		"ap-southeast-2",
		"ca-central-1",
		"cn-north-1",
		"cn-northwest-1",
		"eu-central-1",
		"eu-north-1",
		"eu-south-1",
		"eu-west-1",
		"eu-west-2",
		"eu-west-3",
		"me-south-1",
		"sa-east-1",
		"us-east-1",
		"us-east-2",
		"us-gov-east-1",
		"us-gov-west-1",
		"us-west-1",
		"us-west-2",
	}

	for _, region := range regions {
		shortRegion := strings.ReplaceAll(region, "-", "")

		if *regionFlag != "" {
			if region != *regionFlag {
				continue
			}
		}

		cloudformationSpec := "https://github.com/aws-cloudformation/cfn-python-lint/raw/master/src/cfnlint/data/CloudSpecs/" + region + ".json"
		fmt.Println(cloudformationSpec)
		data, _ := downloadSpec(cloudformationSpec)

		// fmt.Println(string(data))

		spec, specErr := processSpec("cfn", data)
		if specErr != nil {
			fmt.Println(specErr)
			continue
		}

		// propertiesByResource := map[string]map[string]Resource{}
		propertiesByResource := *propertiesByResource(spec)

		serviceNames := serviceNames(spec)

		resourcesByService := *resourcesByService(spec, serviceNames)

		// importDeclarations := make([]*ast.ImportSpec, 0)

		resourceTypes := make([]ast.Expr, 0)
		resourceTypesFields := []ast.Decl{}

		for _, serviceName := range serviceNames {
			resources := resourcesByService[serviceName]
			// fmt.Println(i, ":", serviceName)
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
					Path: ast.NewString("github.com/TangoGroup/aws/fn"),
				}},
			}

			serviceResources := make([]ast.Decl, 0)

			resourceNames := resourceNamesSlice(resources)
			sort.Strings(resourceNames)

			for _, resourceName := range resourceNames {
				resource := resources[resourceName]

				splits := strings.Split(resourceName, "::")
				resourceSubproperties := propertiesByResource[resourceName]

				resourceStr := splits[2]
				// fmt.Println("  " + resourceName)

				properties, resourceImports := createStructFromResource(resourceName, resource, resourceSubproperties, spec.ValueTypes)
				importStrings = mergeMaps(importStrings, resourceImports)
				propertiesStruct := &ast.Field{
					Label: ast.NewIdent("Properties"),
					Value: &properties,
				}
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
				resourceElts = append(resourceElts, &ast.Field{
					Label:    ast.NewIdent("Condition"),
					Optional: token.Elided.Pos(),
					Value:    ast.NewIdent("string"),
				})

				f := &ast.Field{
					Label: ast.NewIdent("#" + resourceStr),
					// Token: token.ISA,
					Value: &ast.StructLit{
						Elts: resourceElts,
					},
				}

				serviceResources = append(serviceResources, f)

				resourceTypes = append(resourceTypes, ast.NewSel(ast.NewIdent(serviceName), resourceStr))
				resourceTypesFields = append(resourceTypesFields, &ast.Field{
					Label: ast.NewIdent(resourceName),
					// Token: token.ISA,
					Value: ast.NewSel(ast.NewIdent("#"+serviceName), "#"+resourceStr),
				})
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
			b, _ := format.Node(ff, format.Simplify())

			servicePackage := path.Join("github.com/TangoGroup/aws/", shortRegion)

			// importDeclarations = append(importDeclarations,
			// 	ast.NewImport(ast.NewIdent(strings.ToLower(serviceName)),
			// 		servicePackage))

			folder := path.Join("cue.mod", "pkg", servicePackage)

			os.MkdirAll(folder, os.ModePerm)

			// fmt.Println("Saving", path.Join(folder, serviceName+".cue"))

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
			// fmt.Println(l, "bytes written successfully")
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

		// expr := ast.NewList(resourceTypes...)

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
					Path: ast.NewString("github.com/TangoGroup/aws/fn"),
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
		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html
		// templateResources1 := &ast.Field{
		// 	Label: ast.NewIdent("Resources"),
		// 	Value: &ast.StructLit{
		// 		Elts: []ast.Decl{
		// 			&ast.Field{
		// 				Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
		// 				Value: resourceTypesExpr,
		// 			},
		// 		},
		// 	},
		// }
		templateResources2 := &ast.Field{
			Label: ast.NewIdent("Resources"),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								newOptionalField("Description", ast.NewIdent("string")),
								// &ast.Field{
								// 	Label: ast.NewIdent("Type"),
								// 	Value: ast.NewCall(ast.NewIdent("or"), &ast.ListComprehension{
								// 		Clauses: []ast.Clause{
								// 			&ast.ForClause{
								// 				Value:  ast.NewIdent("resource"),
								// 				Source: ast.NewIdent("ResourceTypes"),
								// 			},
								// 		},
								// 		Expr: ast.NewSel(ast.NewIdent("resource"), "Type"),
								// 	}),
								// },
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
		// resourcesForLoop := &ast.Comprehension{
		// 	Clauses: []ast.Clause{
		// 		&ast.ForClause{
		// 			Key:    ast.NewIdent("resourceName"),
		// 			Value:  ast.NewIdent("resource"),
		// 			Source: ast.NewIdent("Resources"),
		// 		},
		// 	},
		// 	Value: &ast.StructLit{
		// 		Elts: []ast.Decl{
		// 			&ast.Comprehension{
		// 				Clauses: []ast.Clause{
		// 					&ast.ForClause{
		// 						// Key: ast.NewIdent("resourceName"),
		// 						Value:  ast.NewIdent("cfnResource"),
		// 						Source: ast.NewIdent("ResourceTypes"),
		// 					},
		// 				},
		// 				Value: &ast.StructLit{
		// 					Elts: []ast.Decl{
		// 						&ast.Comprehension{
		// 							Clauses: []ast.Clause{
		// 								&ast.IfClause{
		// 									Condition: &ast.BinaryExpr{
		// 										X:  ast.NewSel(ast.NewIdent("resource"), "Type"),
		// 										Op: token.EQL,
		// 										Y:  ast.NewSel(ast.NewIdent("cfnResource"), "Type"),
		// 									},
		// 								},
		// 							},
		// 							Value: &ast.StructLit{
		// 								Elts: []ast.Decl{
		// 									&ast.Field{
		// 										Label: ast.NewIdent("Resources"),
		// 										Value: &ast.StructLit{
		// 											Elts: []ast.Decl{
		// 												&ast.Field{
		// 													Label: &ast.Interpolation{
		// 														Elts: []ast.Expr{
		// 															&ast.BasicLit{
		// 																Kind:  token.STRING,
		// 																Value: `"\(resourceName)"`,
		// 															},
		// 														},
		// 													},
		// 													Value: ast.NewIdent("cfnResource"),
		// 												},
		// 											},
		// 										},
		// 									},
		// 								},
		// 							},
		// 						},
		// 					},
		// 				},
		// 			},
		// 		},
		// 	},
		// }
		// resourcesForLoop := &ast.Comprehension{
		// 	Clauses: []ast.Clause{
		// 		&ast.ForClause{
		// 			Key:    ast.NewIdent("resourceName"),
		// 			Value:  ast.NewIdent("resource"),
		// 			Source: ast.NewIdent("Resources"),
		// 		},
		// 	},
		// 	Value: &ast.StructLit{
		// 		Elts: []ast.Decl{
		// 			&ast.Field{
		// 				Label: ast.NewIdent("Resources"),
		// 				Value: &ast.StructLit{
		// 					Elts: []ast.Decl{
		// 						&ast.Field{
		// 							Label: &ast.Interpolation{
		// 								Elts: []ast.Expr{
		// 									&ast.BasicLit{
		// 										Kind:  token.STRING,
		// 										Value: `"\(resourceName)"`,
		// 									},
		// 								},
		// 							},
		// 							Value: &ast.IndexExpr{
		// 								X:     ast.NewIdent("ResourceTypesMap"),
		// 								Index: ast.NewSel(ast.NewIdent("resource"), "Type"),
		// 							},
		// 						},
		// 					},
		// 				},
		// 			},
		// 		},
		// 	},
		// }

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
							token.OR, ast.NewSel(ast.NewIdent("fn"), "And"),
							ast.NewSel(ast.NewIdent("fn"), "Equals"),
							ast.NewSel(ast.NewIdent("fn"), "If"),
							ast.NewSel(ast.NewIdent("fn"), "Not"),
							ast.NewSel(ast.NewIdent("fn"), "Or"),
						),
					)),
					templateParameters(),
					// templateResources1,
					templateResources2,
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

		declarations = append(declarations, newField("ResourceTypesMap", &ast.StructLit{Elts: resourceTypesFields}))

		// resourcesMap := &ast.Field{
		// 	Label: ast.NewIdent("ResourceTypesMap"),
		// 	Token: token.ISA,
		// 	Value: &ast.StructLit{
		// 		Elts: []ast.Decl{
		// 			&ast.Comprehension{
		// 				Clauses: []ast.Clause{
		// 					&ast.ForClause{
		// 						Value:  ast.NewIdent("resource"),
		// 						Source: ast.NewIdent("ResourceTypes"),
		// 					},
		// 				},
		// 				Value: &ast.StructLit{
		// 					Elts: []ast.Decl{
		// 						&ast.Field{
		// 							Label: &ast.Interpolation{
		// 								Elts: []ast.Expr{
		// 									&ast.BasicLit{
		// 										Kind:  token.STRING,
		// 										Value: `"\(resource.Type)"`,
		// 									},
		// 								},
		// 							},
		// 							Value: ast.NewIdent("resource"),
		// 						},
		// 					},
		// 				},
		// 			},
		// 			&ast.Field{
		// 				Label: ast.NewIdent("AWS::CloudFormation::CustomResource"),
		// 				Value: ast.NewSel(ast.NewIdent("CloudFormation"), "CustomResource"),
		// 			},
		// 			&ast.Field{
		// 				Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: &ast.BasicLit{Kind: token.STRING, Value: "#\"^Custom::[a-zA-Z0-9_@-]{1,60}$\"#"}}),
		// 				Value: ast.NewSel(ast.NewIdent("CloudFormation"), "CustomResource"),
		// 			},
		// 		},
		// 	},
		// }

		// resourcesMapForLoop := &ast.Comprehension{
		// 	Clauses: []ast.Clause{
		// 		&ast.ForClause{
		// 			Value:  ast.NewIdent("resource"),
		// 			Source: ast.NewIdent("ResourceTypes"),
		// 		},
		// 	},
		// 	Value: &ast.StructLit{
		// 		Elts: []ast.Decl{
		// 			&ast.Field{
		// 				Label: ast.NewIdent("ResourceTypesMap"),
		// 				Token: token.ISA,
		// 				Value: &ast.StructLit{
		// 					Elts: []ast.Decl{
		// 						&ast.Field{
		// 							Label: &ast.Interpolation{
		// 								Elts: []ast.Expr{
		// 									&ast.BasicLit{
		// 										Kind:  token.STRING,
		// 										Value: `"\(resource.Type)"`,
		// 									},
		// 								},
		// 							},
		// 							Value: ast.NewIdent("resource"),
		// 						},
		// 					},
		// 				},
		// 			},
		// 		},
		// 	},
		// }

		// declarations = append(declarations, resourcesMap)
		// declarations = append(declarations, resourcesMapForLoop)

		// declarations = append(declarations, &ast.Field{
		// 	Label: ast.NewIdent("ResourceTypes"),
		// 	Token: token.ISA,
		// 	Value: expr,
		// })

		allServicesFile := &ast.File{
			Filename: shortRegion + ".cue",
			Decls:    declarations,
		}

		b, _ := format.Node(allServicesFile, format.Simplify())
		packageFolder := path.Join("cue.mod/pkg/github.com/TangoGroup/aws", shortRegion)

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
