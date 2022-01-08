package apsoutheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#KMS: {
	#Alias: {
		Type: "AWS::KMS::Alias"
		Properties: {
			AliasName:   *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^(alias/)[a-zA-Z0-9:/_-]+$"#)) | fn.#Fn
			TargetKeyId: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Key: {
		Type: "AWS::KMS::Key"
		Properties: {
			Description?:       *string | fn.#Fn
			EnableKeyRotation?: *bool | fn.#Fn
			Enabled?:           *bool | fn.#Fn
			KeyPolicy:          *{
				[string]: _
			} | fn.#Fn
			KeyUsage?:            *("ENCRYPT_DECRYPT" | "SIGN_VERIFY") | fn.#Fn
			PendingWindowInDays?: *(>=7 & <=30) | fn.#Fn
			Tags?:                *[...{
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
