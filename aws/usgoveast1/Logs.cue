package usgoveast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Logs: {
	#Destination: {
		Type: "AWS::Logs::Destination"
		Properties: {
			DestinationName:   *string | fn.#Fn
			DestinationPolicy: *string | fn.#Fn
			RoleArn:           *string | fn.#Fn
			TargetArn:         *string | fn.#Fn
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
			LogGroupName?:    *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[.\-_/#A-Za-z0-9]{1,512}\Z"#)) | fn.#Fn
			RetentionInDays?: *(1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 3653) | fn.#Fn
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
			FilterPattern:         *string | fn.#Fn
			LogGroupName:          *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[.\-_/#A-Za-z0-9]{1,512}"#)) | fn.#Fn
			MetricTransformations: *[...{
				DefaultValue?:   *number | fn.#Fn
				MetricName:      *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^((?![:*$])[\x00-\x7F]){1,255}"#)) | fn.#Fn
				MetricNamespace: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[0-9a-zA-Z\.\-_\/#]{1,256}"#)) | fn.#Fn
				MetricValue:     *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#".{1,100}"#)) | fn.#Fn
			}] | fn.#If
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
