package uswest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#ConnectCampaigns: {
	#Campaign: {
		Type: "AWS::ConnectCampaigns::Campaign"
		Properties: {
			ConnectInstanceArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			DialerConfig:       *{
				PredictiveDialerConfig?: *{
					BandwidthAllocation?: *int | fn.#Fn
				} | fn.#If
				ProgressiveDialerConfig?: *{
					BandwidthAllocation?: *int | fn.#Fn
				} | fn.#If
			} | fn.#If
			Name:               *(strings.MinRunes(1) & strings.MaxRunes(127)) | fn.#Fn
			OutboundCallConfig: *{
				ConnectContactFlowArn:     *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/contact-flow/[-a-zA-Z0-9]*$"#) | fn.#Fn
				ConnectQueueArn:           *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/queue/[-a-zA-Z0-9]*$"#) | fn.#Fn
				ConnectSourcePhoneNumber?: *string | fn.#Fn
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
