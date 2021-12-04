package apnortheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Connect: {
	#ContactFlow: {
		Type: "AWS::Connect::ContactFlow"
		Properties: {
			Content:      *(strings.MinRunes(1) & strings.MaxRunes(256000)) | fn.#Fn
			Description?: *string | fn.#Fn
			InstanceArn:  *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#)) | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(127)) | fn.#Fn
			State?:       *("ACTIVE" | "ARCHIVED") | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type?: *("CONTACT_FLOW" | "CUSTOMER_QUEUE" | "CUSTOMER_HOLD" | "CUSTOMER_WHISPER" | "AGENT_HOLD" | "AGENT_WHISPER" | "OUTBOUND_WHISPER" | "AGENT_TRANSFER" | "QUEUE_TRANSFER") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ContactFlowModule: {
		Type: "AWS::Connect::ContactFlowModule"
		Properties: {
			Content:      *(strings.MinRunes(1) & strings.MaxRunes(256000)) | fn.#Fn
			Description?: *(=~#".*\S.*"#) | fn.#Fn
			InstanceArn:  *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#)) | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(127) & (=~#".*\S.*"#)) | fn.#Fn
			State?:       *("ACTIVE" | "ARCHIVED") | fn.#Fn
			Tags?:        *[...{
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
