package afsouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Connect: {
	#TaskTemplate: {
		Type: "AWS::Connect::TaskTemplate"
		Properties: {
			ClientToken?: *(=~#"^[0-9a-f]{8}-[0-9a-f]{4}-[0-5][0-9a-f]{3}-[089ab][0-9a-f]{3}-[0-9a-f]{12}$"#) | fn.#Fn
			Constraints?: *{
				[string]: _
			} | fn.#Fn
			ContactFlowArn?: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/contact-flow/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Defaults?:       *[...{
				DefaultValue: *(strings.MinRunes(1) & strings.MaxRunes(4096)) | fn.#Fn
				Id:           *{
					Name: *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
				} | fn.#If
			}] | fn.#If
			Description?: *string | fn.#Fn
			Fields?:      *[...{
				Description?: *string | fn.#Fn
				Id:           *{
					Name: *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
				} | fn.#If
				SingleSelectOptions?: [...(*(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[A-Za-z0-9](?:[A-Za-z0-9_.,\s-]*[A-Za-z0-9_.,-])?$"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[A-Za-z0-9](?:[A-Za-z0-9_.,\s-]*[A-Za-z0-9_.,-])?$"#)) | fn.#Fn)
				Type:                 *("NAME" | "DESCRIPTION" | "SCHEDULED_TIME" | "QUICK_CONNECT" | "URL" | "NUMBER" | "TEXT" | "TEXT_AREA" | "DATE_TIME" | "BOOLEAN" | "SINGLE_SELECT" | "EMAIL") | fn.#Fn
			}] | fn.#If
			InstanceArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Name?:       *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
			Status?:     *("ACTIVE" | "INACTIVE") | fn.#Fn
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
}
