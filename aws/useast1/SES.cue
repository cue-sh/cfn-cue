package useast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SES: {
	#ConfigurationSet: {
		Type: "AWS::SES::ConfigurationSet"
		Properties: {
			DeliveryOptions?: *{
				SendingPoolName?: *string | fn.#Fn
				TlsPolicy?:       *(=~#"REQUIRE|OPTIONAL"#) | fn.#Fn
			} | fn.#If
			Name?:              *(=~#"^[a-zA-Z0-9_-]{1,64}$"#) | fn.#Fn
			ReputationOptions?: *{
				ReputationMetricsEnabled?: *bool | fn.#Fn
			} | fn.#If
			SendingOptions?: *{
				SendingEnabled?: *bool | fn.#Fn
			} | fn.#If
			SuppressionOptions?: *{
				SuppressedReasons?: [...(*(=~#"BOUNCE|COMPLAINT"#) | fn.#Fn)] | (*(=~#"BOUNCE|COMPLAINT"#) | fn.#Fn)
			} | fn.#If
			TrackingOptions?: *{
				CustomRedirectDomain?: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConfigurationSetEventDestination: {
		Type: "AWS::SES::ConfigurationSetEventDestination"
		Properties: {
			ConfigurationSetName: *string | fn.#Fn
			EventDestination:     *{
				CloudWatchDestination?: *{
					DimensionConfigurations?: *[...{
						DefaultDimensionValue: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_-]{1,256}$"#)) | fn.#Fn
						DimensionName:         *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_:-]{1,256}$"#)) | fn.#Fn
						DimensionValueSource:  *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				Enabled?:                    *bool | fn.#Fn
				KinesisFirehoseDestination?: *{
					DeliveryStreamARN: *string | fn.#Fn
					IAMRoleARN:        *string | fn.#Fn
				} | fn.#If
				MatchingEventTypes: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Name?:              *(=~#"^[a-zA-Z0-9_-]{0,64}$"#) | fn.#Fn
				SnsDestination?:    *{
					TopicARN: *(strings.MinRunes(36) & strings.MaxRunes(1024) & (=~#"^arn:aws[a-z0-9-]*:sns:[a-z0-9-]+:\d{12}:[^:]+$"#)) | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ContactList: {
		Type: "AWS::SES::ContactList"
		Properties: {
			ContactListName?: *(=~#"^[a-zA-Z0-9_-]{1,64}$"#) | fn.#Fn
			Description?:     *string | fn.#Fn
			Tags?:            *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Topics?: *[...{
				DefaultSubscriptionStatus: *string | fn.#Fn
				Description?:              *string | fn.#Fn
				DisplayName:               *string | fn.#Fn
				TopicName:                 *(=~#"^[a-zA-Z0-9_-]{1,64}$"#) | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DedicatedIpPool: {
		Type: "AWS::SES::DedicatedIpPool"
		Properties: {
			PoolName?:    *(=~#"^[a-z0-9_-]{0,64}$"#) | fn.#Fn
			ScalingMode?: *(=~#"^(STANDARD|MANAGED)$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EmailIdentity: {
		Type: "AWS::SES::EmailIdentity"
		Properties: {
			ConfigurationSetAttributes?: *{
				ConfigurationSetName?: *string | fn.#Fn
			} | fn.#If
			DkimAttributes?: *{
				SigningEnabled?: *bool | fn.#Fn
			} | fn.#If
			DkimSigningAttributes?: *{
				DomainSigningPrivateKey?: *string | fn.#Fn
				DomainSigningSelector?:   *string | fn.#Fn
				NextSigningKeyLength?:    *(=~#"RSA_1024_BIT|RSA_2048_BIT"#) | fn.#Fn
			} | fn.#If
			EmailIdentity:       *string | fn.#Fn
			FeedbackAttributes?: *{
				EmailForwardingEnabled?: *bool | fn.#Fn
			} | fn.#If
			MailFromAttributes?: *{
				BehaviorOnMxFailure?: *(=~#"USE_DEFAULT_VALUE|REJECT_MESSAGE"#) | fn.#Fn
				MailFromDomain?:      *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptFilter: {
		Type: "AWS::SES::ReceiptFilter"
		Properties: Filter: *{
			IpFilter: *{
				Cidr:   *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				Policy: *string | fn.#Fn
			} | fn.#If
			Name?: *string | fn.#Fn
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptRule: {
		Type: "AWS::SES::ReceiptRule"
		Properties: {
			After?: *string | fn.#Fn
			Rule:   *{
				Actions?: *[...{
					AddHeaderAction?: *{
						HeaderName:  *string | fn.#Fn
						HeaderValue: *string | fn.#Fn
					} | fn.#If
					BounceAction?: *{
						Message:       *string | fn.#Fn
						Sender:        *string | fn.#Fn
						SmtpReplyCode: *string | fn.#Fn
						StatusCode?:   *string | fn.#Fn
						TopicArn?:     *string | fn.#Fn
					} | fn.#If
					LambdaAction?: *{
						FunctionArn:     *string | fn.#Fn
						InvocationType?: *string | fn.#Fn
						TopicArn?:       *string | fn.#Fn
					} | fn.#If
					S3Action?: *{
						BucketName:       *string | fn.#Fn
						KmsKeyArn?:       *string | fn.#Fn
						ObjectKeyPrefix?: *string | fn.#Fn
						TopicArn?:        *string | fn.#Fn
					} | fn.#If
					SNSAction?: *{
						Encoding?: *string | fn.#Fn
						TopicArn?: *string | fn.#Fn
					} | fn.#If
					StopAction?: *{
						Scope:     *string | fn.#Fn
						TopicArn?: *string | fn.#Fn
					} | fn.#If
					WorkmailAction?: *{
						OrganizationArn: *string | fn.#Fn
						TopicArn?:       *string | fn.#Fn
					} | fn.#If
				}] | fn.#If
				Enabled?:     *bool | fn.#Fn
				Name?:        *string | fn.#Fn
				Recipients?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ScanEnabled?: *bool | fn.#Fn
				TlsPolicy?:   *("Optional" | "Require") | fn.#Fn
			} | fn.#If
			RuleSetName: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptRuleSet: {
		Type: "AWS::SES::ReceiptRuleSet"
		Properties: RuleSetName?: *string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Template: {
		Type: "AWS::SES::Template"
		Properties: Template?: *{
			HtmlPart?:     *string | fn.#Fn
			SubjectPart:   *string | fn.#Fn
			TemplateName?: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]{1,64}$"#)) | fn.#Fn
			TextPart?:     *string | fn.#Fn
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
