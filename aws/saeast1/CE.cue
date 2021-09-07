package saeast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#CE: {
	#CostCategory: {
		Type: "AWS::CE::CostCategory"
		Properties: {
			DefaultValue?:     *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
			Name:              *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
			RuleVersion:       *("CostCategoryExpression.v1") | fn.#Fn
			Rules:             *string | fn.#Fn
			SplitChargeRules?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
