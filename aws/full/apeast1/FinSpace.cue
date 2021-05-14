package euwest1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#FinSpace: {
	#Environment: {
		Type: "AWS::FinSpace::Environment"
		Properties: {
			Description?:          *(=~#"^[a-zA-Z0-9. ]{1,1000}$"#) | fn.#Fn
			FederationMode?:       *("LOCAL" | "FEDERATED") | fn.#Fn
			FederationParameters?: *{
				ApplicationCallBackURL?: *(=~#"^https?://[-a-zA-Z0-9+&amp;@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&amp;@#/%=~_|]{1,1000}"#) | fn.#Fn
				AttributeMap?:           *{
					[string]: _
				} | fn.#Fn
				FederationProviderName?: *string | fn.#Fn
				FederationURN?:          *string | fn.#Fn
				SamlMetadataDocument?:   *(strings.MinRunes(1000) & strings.MaxRunes(10000000) & (=~#".*"#)) | fn.#Fn
				SamlMetadataURL?:        *(=~#"^https?://[-a-zA-Z0-9+&amp;@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&amp;@#/%=~_|]{1,1000}"#) | fn.#Fn
			} | fn.#If
			KmsKeyId?: *string | fn.#Fn
			Name:      *(=~#"^[a-zA-Z0-9]+[a-zA-Z0-9-]*[a-zA-Z0-9]{1,255}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
