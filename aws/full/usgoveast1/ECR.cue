package usgoveast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#ECR: {
	#Repository: {
		Type: "AWS::ECR::Repository"
		Properties: {
			EncryptionConfiguration?: *{
				[string]: _
			} | fn.#Fn
			ImageScanningConfiguration?: *{
				[string]: _
			} | fn.#Fn
			ImageTagMutability?: *("MUTABLE" | "IMMUTABLE") | fn.#Fn
			LifecyclePolicy?:    *{
				LifecyclePolicyText?: *(strings.MinRunes(100) & strings.MaxRunes(30720)) | fn.#Fn
				RegistryId?:          *(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.#Fn
			} | fn.#If
			RepositoryName?:       *(strings.MinRunes(2) & strings.MaxRunes(256) & (=~#"^(?=.{2,256}$)((?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*)$"#)) | fn.#Fn
			RepositoryPolicyText?: *{
				[string]: _
			} | fn.#Fn
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
