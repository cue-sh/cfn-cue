package cacentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SES: {
	#ConfigurationSet: {
		Type: "AWS::SES::ConfigurationSet"
		Properties: Name?: *(=~#"^[a-zA-Z0-9_-]{1,64}$"#) | fn.#Fn
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
