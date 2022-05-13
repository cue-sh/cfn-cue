package apsoutheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#VoiceID: {
	#Domain: {
		Type: "AWS::VoiceID::Domain"
		Properties: {
			Description?:                      *string | fn.#Fn
			Name:                              *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9_-]*$"#)) | fn.#Fn
			ServerSideEncryptionConfiguration: *{
				KmsKeyId: *(strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.#Fn
			} | fn.#If
			Tags?: *[...{
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
