package apnortheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Logs: {
	#Destination: {
		Type: "AWS::Logs::Destination"
		Properties: {
			DestinationName:    *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[^:*]{1,512}$"#)) | fn.#Fn
			DestinationPolicy?: *string | fn.#Fn
			RoleArn:            *string | fn.#Fn
			TargetArn:          *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LogGroup: {
		Type: "AWS::Logs::LogGroup"
		Properties: {
			KmsKeyId?:        *(=~#"^arn:[a-z0-9-]+:kms:[a-z0-9-]+:\d{12}:(key|alias)/.+\Z"#) | fn.#Fn
			LogGroupName?:    *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[.\-_/#A-Za-z0-9]{1,512}\Z"#)) | fn.#Fn
			RetentionInDays?: *(1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 2192 | 2557 | 2922 | 3288 | 3653) | fn.#Fn
			Tags?:            *[...{
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
	#LogStream: {
		Type: "AWS::Logs::LogStream"
		Properties: {
			LogGroupName:   *string | fn.#Fn
			LogStreamName?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MetricFilter: {
		Type: "AWS::Logs::MetricFilter"
		Properties: {
			FilterName?:           *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[^:*]{1,512}"#)) | fn.#Fn
			FilterPattern:         *string | fn.#Fn
			LogGroupName:          *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[.\-_/#A-Za-z0-9]{1,512}"#)) | fn.#Fn
			MetricTransformations: *[...{
				DefaultValue?: *number | fn.#Fn
				Dimensions?:   *[...{
					Key:   *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Value: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				}] | fn.#If
				MetricName:      *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^((?![:*$])[\x00-\x7F]){1,255}"#)) | fn.#Fn
				MetricNamespace: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[0-9a-zA-Z\.\-_\/#]{1,256}"#)) | fn.#Fn
				MetricValue:     *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#".{1,100}"#)) | fn.#Fn
				Unit?:           *("Seconds" | "Microseconds" | "Milliseconds" | "Bytes" | "Kilobytes" | "Megabytes" | "Gigabytes" | "Terabytes" | "Bits" | "Kilobits" | "Megabits" | "Gigabits" | "Terabits" | "Percent" | "Count" | "Bytes/Second" | "Kilobytes/Second" | "Megabytes/Second" | "Gigabytes/Second" | "Terabytes/Second" | "Bits/Second" | "Kilobits/Second" | "Megabits/Second" | "Gigabits/Second" | "Terabits/Second" | "Count/Second" | "None") | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#QueryDefinition: {
		Type: "AWS::Logs::QueryDefinition"
		Properties: {
			LogGroupNames?: [...(*(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.#Fn)
			Name:           *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^([^:*\/]+\/?)*[^:*\/]+$"#)) | fn.#Fn
			QueryString:    *(strings.MinRunes(1) & strings.MaxRunes(10000)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourcePolicy: {
		Type: "AWS::Logs::ResourcePolicy"
		Properties: {
			PolicyDocument: *(strings.MinRunes(1) & strings.MaxRunes(5120) & (=~#"[\u0009\u000A\u000D\u0020-\u00FF]+"#)) | fn.#Fn
			PolicyName:     *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^([^:*\/]+\/?)*[^:*\/]+$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubscriptionFilter: {
		Type: "AWS::Logs::SubscriptionFilter"
		Properties: {
			DestinationArn: *string | fn.#Fn
			FilterPattern:  *string | fn.#Fn
			LogGroupName:   *string | fn.#Fn
			RoleArn?:       *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
