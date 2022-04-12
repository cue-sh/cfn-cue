package apnortheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#ServiceCatalogAppRegistry: {
	#Application: {
		Type: "AWS::ServiceCatalogAppRegistry::Application"
		Properties: {
			Description?: *string | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"\w+"#)) | fn.#Fn
			Tags?:        *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AttributeGroup: {
		Type: "AWS::ServiceCatalogAppRegistry::AttributeGroup"
		Properties: {
			Attributes: *{
				[string]: _
			} | fn.#Fn
			Description?: *string | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"\w+"#)) | fn.#Fn
			Tags?:        *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
