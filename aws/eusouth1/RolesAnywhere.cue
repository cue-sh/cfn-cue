package eusouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#RolesAnywhere: {
	#Profile: {
		Type: "AWS::RolesAnywhere::Profile"
		Properties: {
			DurationSeconds?:           *(>=900 & <=43200) | fn.#Fn
			Enabled?:                   *bool | fn.#Fn
			ManagedPolicyArns?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name?:                      *string | fn.#Fn
			RequireInstanceProperties?: *bool | fn.#Fn
			RoleArns?:                  [...(*(strings.MinRunes(1) & strings.MaxRunes(1011)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(1011)) | fn.#Fn)
			SessionPolicy?:             *string | fn.#Fn
			Tags?:                      *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
