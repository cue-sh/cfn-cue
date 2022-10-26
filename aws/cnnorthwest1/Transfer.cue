package cnnorthwest1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Transfer: {
	#Agreement: {
		Type: "AWS::Transfer::Agreement"
		Properties: {
			AccessRole:       *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:.*role/.*"#)) | fn.#Fn
			BaseDirectory:    *(=~#"^$|/.*"#) | fn.#Fn
			Description?:     *(strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"^[\w\- ]*$"#)) | fn.#Fn
			LocalProfileId:   *(strings.MinRunes(19) & strings.MaxRunes(19) & (=~#"^p-([0-9a-f]{17})$"#)) | fn.#Fn
			PartnerProfileId: *(strings.MinRunes(19) & strings.MaxRunes(19) & (=~#"^p-([0-9a-f]{17})$"#)) | fn.#Fn
			ServerId:         *(strings.MinRunes(19) & strings.MaxRunes(19) & (=~#"^s-([0-9a-f]{17})$"#)) | fn.#Fn
			Status?:          *("ACTIVE" | "INACTIVE") | fn.#Fn
			Tags?:            *[...{
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
	#Certificate: {
		Type: "AWS::Transfer::Certificate"
		Properties: {
			ActiveDate?:       *string | fn.#Fn
			Certificate:       *string | fn.#Fn
			CertificateChain?: *string | fn.#Fn
			Description?:      *(strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"^[\w\- ]*$"#)) | fn.#Fn
			InactiveDate?:     *string | fn.#Fn
			PrivateKey?:       *string | fn.#Fn
			Tags?:             *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Usage: *("SIGNING" | "ENCRYPTION") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Connector: {
		Type: "AWS::Transfer::Connector"
		Properties: {
			AccessRole: *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:.*role/.*"#)) | fn.#Fn
			As2Config:  *{
				[string]: _
			} | fn.#Fn
			LoggingRole?: *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:.*role/.*"#)) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Url: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Profile: {
		Type: "AWS::Transfer::Profile"
		Properties: {
			As2Id:           *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
			CertificateIds?: [...(*(strings.MinRunes(22) & strings.MaxRunes(22) & (=~#"^cert-([0-9a-f]{17})$"#)) | fn.#Fn)] | (*(strings.MinRunes(22) & strings.MaxRunes(22) & (=~#"^cert-([0-9a-f]{17})$"#)) | fn.#Fn)
			ProfileType:     *("LOCAL" | "PARTNER") | fn.#Fn
			Tags?:           *[...{
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
	#User: {
		Type: "AWS::Transfer::User"
		Properties: {
			HomeDirectory?:         *string | fn.#Fn
			HomeDirectoryMappings?: *[...{
				Entry:  *string | fn.#Fn
				Target: *string | fn.#Fn
			}] | fn.#If
			HomeDirectoryType?: *string | fn.#Fn
			Policy?:            *string | fn.#Fn
			PosixProfile?:      *{
				Gid:            *number | fn.#Fn
				SecondaryGids?: [...(*number | fn.#Fn)] | (*number | fn.#Fn)
				Uid:            *number | fn.#Fn
			} | fn.#If
			Role:           *string | fn.#Fn
			ServerId:       *string | fn.#Fn
			SshPublicKeys?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:          *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UserName: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workflow: {
		Type: "AWS::Transfer::Workflow"
		Properties: {
			Description?:      *(=~#"^[\w\- ]*$"#) | fn.#Fn
			OnExceptionSteps?: *[...{
				CopyStepDetails?: *{
					[string]: _
				} | fn.#Fn
				CustomStepDetails?: *{
					[string]: _
				} | fn.#Fn
				DeleteStepDetails?: *{
					[string]: _
				} | fn.#Fn
				TagStepDetails?: *{
					[string]: _
				} | fn.#Fn
				Type?: *("COPY" | "CUSTOM" | "DELETE" | "TAG") | fn.#Fn
			}] | fn.#If
			Steps: *[...{
				CopyStepDetails?: *{
					[string]: _
				} | fn.#Fn
				CustomStepDetails?: *{
					[string]: _
				} | fn.#Fn
				DeleteStepDetails?: *{
					[string]: _
				} | fn.#Fn
				TagStepDetails?: *{
					[string]: _
				} | fn.#Fn
				Type?: *("COPY" | "CUSTOM" | "DELETE" | "TAG") | fn.#Fn
			}] | fn.#If
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
