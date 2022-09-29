package apsoutheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IdentityStore: {
	#Group: {
		Type: "AWS::IdentityStore::Group"
		Properties: {
			Description?:     *string | fn.#Fn
			DisplayName?:     *string | fn.#Fn
			IdentityStoreId?: *(strings.MinRunes(1) & strings.MaxRunes(36) & (=~#"^d-[0-9a-f]{10}$|^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
