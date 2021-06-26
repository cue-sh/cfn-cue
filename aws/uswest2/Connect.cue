package uswest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Connect: {
	#QuickConnect: {
		Type: "AWS::Connect::QuickConnect"
		Properties: {
			Description?:       *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
			InstanceArn:        *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Name:               *(strings.MinRunes(1) & strings.MaxRunes(127)) | fn.#Fn
			QuickConnectConfig: *{
				PhoneConfig?: *{
					PhoneNumber: *(=~#"^\+[1-9]\d{1,14}$"#) | fn.#Fn
				} | fn.#If
				QueueConfig?: *{
					ContactFlowArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/contact-flow/[-a-zA-Z0-9]*$"#) | fn.#Fn
					QueueArn:       *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/queue/[-a-zA-Z0-9]*$"#) | fn.#Fn
				} | fn.#If
				QuickConnectType: *("PHONE_NUMBER" | "QUEUE" | "USER") | fn.#Fn
				UserConfig?:      *{
					ContactFlowArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/contact-flow/[-a-zA-Z0-9]*$"#) | fn.#Fn
					UserArn:        *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/agent/[-a-zA-Z0-9]*$"#) | fn.#Fn
				} | fn.#If
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
