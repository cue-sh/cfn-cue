package apnortheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#AppIntegrations: {
	#DataIntegration: {
		Type: "AWS::AppIntegrations::DataIntegration"
		Properties: {
			Description?:   *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
			KmsKey:         *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#".*\S.*"#)) | fn.#Fn
			Name:           *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9/\._\-]+$"#)) | fn.#Fn
			ScheduleConfig: *{
				FirstExecutionFrom: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#".*\S.*"#)) | fn.#Fn
				Object:             *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9/\._\-]+$"#)) | fn.#Fn
				ScheduleExpression: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#".*\S.*"#)) | fn.#Fn
			} | fn.#If
			SourceURI: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^\w+\:\/\/\w+\/[\w/!@#+=.-]+$"#)) | fn.#Fn
			Tags?:     *[...{
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
