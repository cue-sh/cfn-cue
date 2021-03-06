package euwest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Rekognition: {
	#Collection: {
		Type: "AWS::Rekognition::Collection"
		Properties: {
			CollectionId: *(=~#"\A[a-zA-Z0-9_\.\-]+$"#) | fn.#Fn
			Tags?:        *[...{
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
	#Project: {
		Type: "AWS::Rekognition::Project"
		Properties: ProjectName: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9][a-zA-Z0-9_\-]*"#)) | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
