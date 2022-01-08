package apnortheast3

import "github.com/cue-sh/cfn-cue/aws/fn"

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
}
