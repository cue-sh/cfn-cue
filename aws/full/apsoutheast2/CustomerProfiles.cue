package apsoutheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#CustomerProfiles: {
	#Domain: {
		Type: "AWS::CustomerProfiles::Domain"
		Properties: {
			DeadLetterQueueUrl?:    *string | fn.#Fn
			DefaultEncryptionKey?:  *string | fn.#Fn
			DefaultExpirationDays?: *(>=1 & <=1098) | fn.#Fn
			DomainName:             *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
			Tags?:                  *[...{
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
	#Integration: {
		Type: "AWS::CustomerProfiles::Integration"
		Properties: {
			DomainName:      *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
			ObjectTypeName?: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z_][a-zA-Z_0-9-]*$"#)) | fn.#Fn
			Tags?:           *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Uri?: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ObjectType: {
		Type: "AWS::CustomerProfiles::ObjectType"
		Properties: {
			AllowProfileCreation?: *bool | fn.#Fn
			Description?:          *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
			DomainName:            *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
			EncryptionKey?:        *string | fn.#Fn
			ExpirationDays?:       *(>=1 & <=1098) | fn.#Fn
			Fields?:               *[...{
				Name?:            *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
				ObjectTypeField?: *{
					ContentType?: *("STRING" | "NUMBER" | "PHONE_NUMBER" | "EMAIL_ADDRESS" | "NAME") | fn.#Fn
					Source?:      *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
					Target?:      *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
				} | fn.#If
			}] | fn.#If
			Keys?: *[...{
				Name?:              *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
				ObjectTypeKeyList?: *[...{
					FieldNames?:          [...(*(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn)
					StandardIdentifiers?: [...(*("PROFILE" | "UNIQUE" | "SECONDARY" | "LOOKUP_ONLY" | "NEW_ONLY") | fn.#Fn)] | (*("PROFILE" | "UNIQUE" | "SECONDARY" | "LOOKUP_ONLY" | "NEW_ONLY") | fn.#Fn)
				}] | fn.#If
			}] | fn.#If
			ObjectTypeName?: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z_][a-zA-Z_0-9-]*$"#)) | fn.#Fn
			Tags?:           *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TemplateId?: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
