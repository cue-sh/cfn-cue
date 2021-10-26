package apnortheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Connect: {
	#HoursOfOperation: {
		Type: "AWS::Connect::HoursOfOperation"
		Properties: {
			Config: *[...{
				Day:       *("SUNDAY" | "MONDAY" | "TUESDAY" | "WEDNESDAY" | "THURSDAY" | "FRIDAY" | "SATURDAY") | fn.#Fn
				EndTime:   *string | fn.#Fn
				StartTime: *string | fn.#Fn
			}] | fn.#If
			Description?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
			InstanceArn:  *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(127)) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TimeZone: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
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
	#User: {
		Type: "AWS::Connect::User"
		Properties: {
			DirectoryUserId?:   *string | fn.#Fn
			HierarchyGroupArn?: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/agent-group/[-a-zA-Z0-9]*$"#) | fn.#Fn
			IdentityInfo?:      *{
				Email?:     *string | fn.#Fn
				FirstName?: *string | fn.#Fn
				LastName?:  *string | fn.#Fn
			} | fn.#If
			InstanceArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Password?:   *(=~#"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,64}$"#) | fn.#Fn
			PhoneConfig: *{
				AfterContactWorkTimeLimit?: *int | fn.#Fn
				AutoAccept?:                *bool | fn.#Fn
				DeskPhoneNumber?:           *string | fn.#Fn
				PhoneType:                  *("SOFT_PHONE" | "DESK_PHONE") | fn.#Fn
			} | fn.#If
			RoutingProfileArn:   *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/routing-profile/[-a-zA-Z0-9]*$"#) | fn.#Fn
			SecurityProfileArns: [...(*(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/security-profile/[-a-zA-Z0-9]*$"#) | fn.#Fn)] | (*(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/security-profile/[-a-zA-Z0-9]*$"#) | fn.#Fn)
			Tags?:               *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Username: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"[a-zA-Z0-9\_\-\.\@]+"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#UserHierarchyGroup: {
		Type: "AWS::Connect::UserHierarchyGroup"
		Properties: {
			InstanceArn:     *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Name:            *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
			ParentGroupArn?: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/agent-group/[-a-zA-Z0-9]*$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
