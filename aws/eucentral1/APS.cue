package eucentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#APS: {
	#Workspace: {
		Type: "AWS::APS::Workspace"
		Properties: {
			Alias?: *string | fn.#Fn
			Tags?:  *[...{
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
