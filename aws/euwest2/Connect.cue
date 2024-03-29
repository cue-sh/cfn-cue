package euwest2

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
			Type: *("CONTACT_FLOW" | "CUSTOMER_QUEUE" | "CUSTOMER_HOLD" | "CUSTOMER_WHISPER" | "AGENT_HOLD" | "AGENT_WHISPER" | "OUTBOUND_WHISPER" | "AGENT_TRANSFER" | "QUEUE_TRANSFER") | fn.#Fn
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
	#HoursOfOperation: {
		Type: "AWS::Connect::HoursOfOperation"
		Properties: {
			Config: *[...{
				Day:     *("SUNDAY" | "MONDAY" | "TUESDAY" | "WEDNESDAY" | "THURSDAY" | "FRIDAY" | "SATURDAY") | fn.#Fn
				EndTime: *{
					Hours:   *int | fn.#Fn
					Minutes: *int | fn.#Fn
				} | fn.#If
				StartTime: *{
					Hours:   *int | fn.#Fn
					Minutes: *int | fn.#Fn
				} | fn.#If
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
	#Instance: {
		Type: "AWS::Connect::Instance"
		Properties: {
			Attributes: *{
				AutoResolveBestVoices?: *bool | fn.#Fn
				ContactLens?:           *bool | fn.#Fn
				ContactflowLogs?:       *bool | fn.#Fn
				EarlyMedia?:            *bool | fn.#Fn
				InboundCalls:           *bool | fn.#Fn
				OutboundCalls:          *bool | fn.#Fn
				UseCustomTTSVoices?:    *bool | fn.#Fn
			} | fn.#If
			DirectoryId?:           *(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^d-[0-9a-f]{10}$"#)) | fn.#Fn
			IdentityManagementType: *("SAML" | "CONNECT_MANAGED" | "EXISTING_DIRECTORY") | fn.#Fn
			InstanceAlias?:         *(strings.MinRunes(1) & strings.MaxRunes(62) & (=~#"^(?!d-)([\da-zA-Z]+)([-]*[\da-zA-Z])*$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#InstanceStorageConfig: {
		Type: "AWS::Connect::InstanceStorageConfig"
		Properties: {
			InstanceArn:            *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*$"#) | fn.#Fn
			KinesisFirehoseConfig?: *{
				FirehoseArn: *(=~#"^arn:aws[-a-z0-9]*:firehose:[-a-z0-9]*:[0-9]{12}:deliverystream/[-a-zA-Z0-9_.]*$"#) | fn.#Fn
			} | fn.#If
			KinesisStreamConfig?: *{
				StreamArn: *(=~#"^arn:aws[-a-z0-9]*:kinesis:[-a-z0-9]*:[0-9]{12}:stream/[-a-zA-Z0-9_.]*$"#) | fn.#Fn
			} | fn.#If
			KinesisVideoStreamConfig?: *{
				EncryptionConfig?: *{
					EncryptionType: *("KMS") | fn.#Fn
					KeyId:          *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				Prefix:               *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				RetentionPeriodHours: *number | fn.#Fn
			} | fn.#If
			ResourceType: *("CHAT_TRANSCRIPTS" | "CALL_RECORDINGS" | "SCHEDULED_REPORTS" | "MEDIA_STREAMS" | "CONTACT_TRACE_RECORDS" | "AGENT_EVENTS") | fn.#Fn
			S3Config?:    *{
				BucketName:        *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				BucketPrefix:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				EncryptionConfig?: *{
					EncryptionType: *("KMS") | fn.#Fn
					KeyId:          *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
			} | fn.#If
			StorageType: *("S3" | "KINESIS_VIDEO_STREAM" | "KINESIS_STREAM" | "KINESIS_FIREHOSE") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PhoneNumber: {
		Type: "AWS::Connect::PhoneNumber"
		Properties: {
			CountryCode:  *(=~#"^[A-Z]{2}"#) | fn.#Fn
			Description?: *(strings.MinRunes(1) & strings.MaxRunes(500)) | fn.#Fn
			Prefix?:      *(=~#"^\+[0-9]{1,15}"#) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetArn: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:(instance|traffic-distribution-group)/[-a-zA-Z0-9]*$"#) | fn.#Fn
			Type:      *(=~#"TOLL_FREE|DID"#) | fn.#Fn
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
	#User: {
		Type: "AWS::Connect::User"
		Properties: {
			DirectoryUserId?:   *string | fn.#Fn
			HierarchyGroupArn?: *(=~#"^arn:aws[-a-z0-9]*:connect:[-a-z0-9]*:[0-9]{12}:instance/[-a-zA-Z0-9]*/agent-group/[-a-zA-Z0-9]*$"#) | fn.#Fn
			IdentityInfo?:      *{
				Email?:          *string | fn.#Fn
				FirstName?:      *string | fn.#Fn
				LastName?:       *string | fn.#Fn
				Mobile?:         *(=~#"^\+[1-9]\d{1,14}$"#) | fn.#Fn
				SecondaryEmail?: *(=~#"(?=^.{0,265}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}"#) | fn.#Fn
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
