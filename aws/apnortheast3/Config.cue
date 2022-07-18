package apnortheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Config: {
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
}
