package apsoutheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Personalize: {
	#Dataset: {
		Type: "AWS::Personalize::Dataset"
		Properties: {
			DatasetGroupArn:   *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
			DatasetImportJob?: *{
				DataSource?: *{
					[string]: _
				} | fn.#Fn
				DatasetArn?:          *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
				DatasetImportJobArn?: *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
				JobName?:             *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.#Fn
				RoleArn?:             *(=~#"arn:([a-z\d-]+):iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
			} | fn.#If
			DatasetType: *("Interactions" | "Items" | "Users") | fn.#Fn
			Name:        *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.#Fn
			SchemaArn:   *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DatasetGroup: {
		Type: "AWS::Personalize::DatasetGroup"
		Properties: {
			Domain?:    *("ECOMMERCE" | "VIDEO_ON_DEMAND") | fn.#Fn
			KmsKeyArn?: *(=~#"arn:aws.*:kms:.*:[0-9]{12}:key/.*"#) | fn.#Fn
			Name:       *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.#Fn
			RoleArn?:   *(=~#"arn:([a-z\d-]+):iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Schema: {
		Type: "AWS::Personalize::Schema"
		Properties: {
			Domain?: *("ECOMMERCE" | "VIDEO_ON_DEMAND") | fn.#Fn
			Name:    *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.#Fn
			Schema:  *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Solution: {
		Type: "AWS::Personalize::Solution"
		Properties: {
			DatasetGroupArn: *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
			EventType?:      *string | fn.#Fn
			Name:            *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.#Fn
			PerformAutoML?:  *bool | fn.#Fn
			PerformHPO?:     *bool | fn.#Fn
			RecipeArn?:      *(=~#"arn:([a-z\d-]+):personalize:.*:.*:.+"#) | fn.#Fn
			SolutionConfig?: *{
				AlgorithmHyperParameters?: *{
					[string]: *string | fn.#Fn
				} | fn.#If
				AutoMLConfig?: *{
					[string]: _
				} | fn.#Fn
				EventValueThreshold?:             *string | fn.#Fn
				FeatureTransformationParameters?: *{
					[string]: *string | fn.#Fn
				} | fn.#If
				HpoConfig?: *{
					[string]: _
				} | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
