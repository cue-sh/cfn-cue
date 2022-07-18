package mesouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#RolesAnywhere: {
	#CRL: {
		Type: "AWS::RolesAnywhere::CRL"
		Properties: {
			CrlData?: *string | fn.#Fn
			Enabled?: *bool | fn.#Fn
			Name?:    *string | fn.#Fn
			Tags?:    *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TrustAnchorArn?: *(=~#"^arn:aws(-[^:]+)?:rolesanywhere(:.*){2}(:trust-anchor.*)$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Profile: {
		Type: "AWS::RolesAnywhere::Profile"
		Properties: {
			DurationSeconds?:           *(>=900 & <=43200) | fn.#Fn
			Enabled?:                   *bool | fn.#Fn
			ManagedPolicyArns?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name?:                      *string | fn.#Fn
			RequireInstanceProperties?: *bool | fn.#Fn
			RoleArns?:                  [...(*(strings.MinRunes(1) & strings.MaxRunes(1011)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(1011)) | fn.#Fn)
			SessionPolicy?:             *string | fn.#Fn
			Tags?:                      *[...{
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
	#TrustAnchor: {
		Type: "AWS::RolesAnywhere::TrustAnchor"
		Properties: {
			Enabled?: *bool | fn.#Fn
			Name?:    *string | fn.#Fn
			Source?:  *{
				SourceData?: *{
					AcmPcaArn?:           *string | fn.#Fn
					X509CertificateData?: *string | fn.#Fn
				} | fn.#If
				SourceType?: *("AWS_ACM_PCA" | "CERTIFICATE_BUNDLE" | "SELF_SIGNED_REPOSITORY") | fn.#Fn
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
