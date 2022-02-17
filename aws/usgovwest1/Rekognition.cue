package usgovwest1

import "github.com/cue-sh/cfn-cue/aws/fn"

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
}
