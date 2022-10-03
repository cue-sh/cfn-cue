package eusouth1

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
	#GroupMembership: {
		Type: "AWS::IdentityStore::GroupMembership"
		Properties: {
			GroupId?:         *(strings.MinRunes(1) & strings.MaxRunes(47) & (=~#"^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$"#)) | fn.#Fn
			IdentityStoreId?: *(strings.MinRunes(1) & strings.MaxRunes(36) & (=~#"^d-[0-9a-f]{10}$|^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"#)) | fn.#Fn
			MemberId?:        *{
				UserId: *(strings.MinRunes(1) & strings.MaxRunes(47) & (=~#"^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$"#)) | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
