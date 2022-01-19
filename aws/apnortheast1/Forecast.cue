package apnortheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Forecast: {
	#Dataset: {
		Type: "AWS::Forecast::Dataset"
		Properties: {
			DataFrequency?:    *(=~#"^Y|M|W|D|H|30min|15min|10min|5min|1min$"#) | fn.#Fn
			DatasetName:       *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z][a-zA-Z0-9_]*"#)) | fn.#Fn
			DatasetType:       *("TARGET_TIME_SERIES" | "RELATED_TIME_SERIES" | "ITEM_METADATA") | fn.#Fn
			Domain:            *("RETAIL" | "CUSTOM" | "INVENTORY_PLANNING" | "EC2_CAPACITY" | "WORK_FORCE" | "WEB_TRAFFIC" | "METRICS") | fn.#Fn
			EncryptionConfig?: *{
				[string]: _
			} | fn.#Fn
			Schema: *{
				[string]: _
			} | fn.#Fn
			Tags?: [...(*{
				[string]: _
			} | fn.#Fn)] | (*{
				[string]: _
			} | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DatasetGroup: {
		Type: "AWS::Forecast::DatasetGroup"
		Properties: {
			DatasetArns?:     [...(*(=~#"^[a-zA-Z0-9\-\_\.\/\:]+$"#) | fn.#Fn)] | (*(=~#"^[a-zA-Z0-9\-\_\.\/\:]+$"#) | fn.#Fn)
			DatasetGroupName: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z][a-zA-Z0-9_]*"#)) | fn.#Fn
			Domain:           *("RETAIL" | "CUSTOM" | "INVENTORY_PLANNING" | "EC2_CAPACITY" | "WORK_FORCE" | "WEB_TRAFFIC" | "METRICS") | fn.#Fn
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
}
