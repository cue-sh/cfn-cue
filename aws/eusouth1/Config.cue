package eusouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Config: {
	#AggregationAuthorization: {
		Type: "AWS::Config::AggregationAuthorization"
		Properties: {
			AuthorizedAccountId: *(=~#"^\d{12}$"#) | fn.#Fn
			AuthorizedAwsRegion: *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
			Tags?:               *[...{
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
	#ConfigRule: {
		Type: "AWS::Config::ConfigRule"
		Properties: {
			ConfigRuleName?:  *string | fn.#Fn
			Description?:     *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			InputParameters?: *{
				[string]: _
			} | fn.#Fn
			MaximumExecutionFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
			Scope?:                     *{
				ComplianceResourceId?:    *string | fn.#Fn
				ComplianceResourceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				TagKey?:                  *string | fn.#Fn
				TagValue?:                *string | fn.#Fn
			} | fn.#If
			Source: *{
				CustomPolicyDetails?: *{
					EnableDebugLogDelivery?: *bool | fn.#Fn
					PolicyRuntime?:          *string | fn.#Fn
					PolicyText?:             *string | fn.#Fn
				} | fn.#If
				Owner:          *("AWS" | "CUSTOM_LAMBDA" | "CUSTOM_POLICY") | fn.#Fn
				SourceDetails?: *[...{
					EventSource:                *("aws.config") | fn.#Fn
					MaximumExecutionFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
					MessageType:                *("ConfigurationItemChangeNotification" | "ConfigurationSnapshotDeliveryCompleted" | "OversizedConfigurationItemChangeNotification" | "ScheduledNotification") | fn.#Fn
				}] | fn.#If
				SourceIdentifier?: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConfigurationAggregator: {
		Type: "AWS::Config::ConfigurationAggregator"
		Properties: {
			AccountAggregationSources?: *[...{
				AccountIds:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				AllAwsRegions?: *bool | fn.#Fn
				AwsRegions?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			ConfigurationAggregatorName?:   *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[\w\-]+"#)) | fn.#Fn
			OrganizationAggregationSource?: *{
				AllAwsRegions?: *bool | fn.#Fn
				AwsRegions?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				RoleArn:        *string | fn.#Fn
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
	#ConfigurationRecorder: {
		Type: "AWS::Config::ConfigurationRecorder"
		Properties: {
			Name?:           *string | fn.#Fn
			RecordingGroup?: *{
				AllSupported?:               *bool | fn.#Fn
				IncludeGlobalResourceTypes?: *bool | fn.#Fn
				ResourceTypes?:              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			RoleARN: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeliveryChannel: {
		Type: "AWS::Config::DeliveryChannel"
		Properties: {
			ConfigSnapshotDeliveryProperties?: *{
				DeliveryFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
			} | fn.#If
			Name?:        *string | fn.#Fn
			S3BucketName: *string | fn.#Fn
			S3KeyPrefix?: *string | fn.#Fn
			S3KmsKeyArn?: *string | fn.#Fn
			SnsTopicARN?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#OrganizationConfigRule: {
		Type: "AWS::Config::OrganizationConfigRule"
		Properties: {
			ExcludedAccounts?:                   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			OrganizationConfigRuleName:          *string | fn.#Fn
			OrganizationCustomCodeRuleMetadata?: *{
				CodeText:                            *string | fn.#Fn
				DebugLogDeliveryAccounts?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Description?:                        *string | fn.#Fn
				InputParameters?:                    *string | fn.#Fn
				MaximumExecutionFrequency?:          *string | fn.#Fn
				OrganizationConfigRuleTriggerTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ResourceIdScope?:                    *string | fn.#Fn
				ResourceTypesScope?:                 [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Runtime:                             *string | fn.#Fn
				TagKeyScope?:                        *string | fn.#Fn
				TagValueScope?:                      *string | fn.#Fn
			} | fn.#If
			OrganizationCustomRuleMetadata?: *{
				Description?:                       *string | fn.#Fn
				InputParameters?:                   *string | fn.#Fn
				LambdaFunctionArn:                  *string | fn.#Fn
				MaximumExecutionFrequency?:         *string | fn.#Fn
				OrganizationConfigRuleTriggerTypes: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ResourceIdScope?:                   *string | fn.#Fn
				ResourceTypesScope?:                [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				TagKeyScope?:                       *string | fn.#Fn
				TagValueScope?:                     *string | fn.#Fn
			} | fn.#If
			OrganizationManagedRuleMetadata?: *{
				Description?:               *string | fn.#Fn
				InputParameters?:           *string | fn.#Fn
				MaximumExecutionFrequency?: *string | fn.#Fn
				ResourceIdScope?:           *string | fn.#Fn
				ResourceTypesScope?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				RuleIdentifier:             *string | fn.#Fn
				TagKeyScope?:               *string | fn.#Fn
				TagValueScope?:             *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RemediationConfiguration: {
		Type: "AWS::Config::RemediationConfiguration"
		Properties: {
			Automatic?:         *bool | fn.#Fn
			ConfigRuleName:     *string | fn.#Fn
			ExecutionControls?: *{
				SsmControls?: *{
					ConcurrentExecutionRatePercentage?: *int | fn.#Fn
					ErrorPercentage?:                   *int | fn.#Fn
				} | fn.#If
			} | fn.#If
			MaximumAutomaticAttempts?: *int | fn.#Fn
			Parameters?:               *{
				[string]: _
			} | fn.#Fn
			ResourceType?:        *string | fn.#Fn
			RetryAttemptSeconds?: *int | fn.#Fn
			TargetId:             *string | fn.#Fn
			TargetType:           *string | fn.#Fn
			TargetVersion?:       *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
