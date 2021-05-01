package main

import (
	"sort"
	"strings"
)

func resourcesByService(spec *CloudFormationResourceSpecification, serviceNames []string) *map[string]map[string]Resource {
	resourcesByService := map[string]map[string]Resource{}
	for _, service := range serviceNames {
		resourcesByService[service] = map[string]Resource{}
	}

	for resourceName, resource := range spec.Resources {
		splits := strings.Split(resourceName, "::")
		service := splits[1]

		resourcesByService[service][resourceName] = resource
	}
	return &resourcesByService
}

func serviceNames(spec *CloudFormationResourceSpecification) []string {
	servicesMap := map[string]bool{}

	for resourceName := range spec.Resources {
		splits := strings.Split(resourceName, "::")
		servicesMap[splits[1]] = true
	}

	serviceNames := make([]string, 0, len(servicesMap))
	for serviceName := range servicesMap {
		serviceNames = append(serviceNames, serviceName)
	}
	sort.Strings(serviceNames)
	return serviceNames
}

func propertiesByResource(spec *CloudFormationResourceSpecification) *map[string]map[string]Resource {
	// Find weird/broken properties
	// fmt.Println("weird/broken properties")
	// weirdProps := []string{}
	// for resourcePropertyName, property := range spec.Properties {
	// 	if len(property.Properties) == 0 {
	// 		weirdProps = append(weirdProps, resourcePropertyName)
	// 	}
	// }
	// sort.Strings(weirdProps)
	// for _, prop := range weirdProps {
	// 	fmt.Println(prop)
	// }
	// panic(0)
	propertiesByResource := map[string]map[string]Resource{}

	for resourcePropertyName, property := range spec.Properties {
		splits := strings.Split(resourcePropertyName, ".")
		if len(splits) > 1 {
			resourceName := splits[0]
			if propertiesByResource[resourceName] == nil {
				propertiesByResource[resourceName] = map[string]Resource{}
			}
			propertyName := splits[1]
			propertiesByResource[resourceName][propertyName] = property
		}
	}

	for resourceName := range spec.Resources {
		if propertiesByResource[resourceName] == nil {
			propertiesByResource[resourceName] = map[string]Resource{}
		}
		propertiesByResource[resourceName]["Tag"] = spec.Properties["Tag"]
	}

	return &propertiesByResource
}

func resourceNamesSlice(p map[string]Resource) (keys []string) {
	keys = make([]string, 0, len(p))
	for key := range p {
		keys = append(keys, key)
	}
	return keys
}

func propertyNames(p map[string]Property) (keys []string) {
	keys = make([]string, 0, len(p))
	for key := range p {
		keys = append(keys, key)
	}
	return keys
}
