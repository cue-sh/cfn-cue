package useast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Organizations: {
	#Account: {
		Type: "AWS::Organizations::Account"
		Properties: {
			AccountName: *(strings.MinRunes(1) & strings.MaxRunes(50) & (=~#"[\u0020-\u007E]+"#)) | fn.#Fn
			Email:       *(strings.MinRunes(6) & strings.MaxRunes(64) & (=~#"[^\s@]+@[^\s@]+\.[^\s@]+"#)) | fn.#Fn
			ParentIds?:  [...(*(=~#"^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#) | fn.#Fn)] | (*(=~#"^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#) | fn.#Fn)
			RoleName?:   *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"[\w+=,.@-]{1,64}"#)) | fn.#Fn
			Tags?:       *[...{
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
	#Policy: {
		Type: "AWS::Organizations::Policy"
		Properties: {
			Content:      *(strings.MinRunes(1) & strings.MaxRunes(1000000) & (=~#"[\s\S]*"#)) | fn.#Fn
			Description?: *(=~#"[\s\S]*"#) | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[\s\S]*"#)) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetIds?: [...(*(=~#"^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#) | fn.#Fn)] | (*(=~#"^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#) | fn.#Fn)
			Type:       *("SERVICE_CONTROL_POLICY" | "AISERVICES_OPT_OUT_POLICY" | "BACKUP_POLICY" | "TAG_POLICY") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
