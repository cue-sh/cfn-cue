package apsoutheast1

import "github.com/TangoGroup/aws/fn"

StepFunctions :: {
	Activity :: {
		Type: "AWS::StepFunctions::Activity"
		Properties: {
			Name:  string | fn.Fn
			Tags?: [...close({
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StateMachine :: {
		Type: "AWS::StepFunctions::StateMachine"
		Properties: {
			DefinitionString:      string | fn.Fn
			LoggingConfiguration?: close({
			}) | fn.If
			RoleArn:           string | fn.Fn
			StateMachineName?: string | fn.Fn
			StateMachineType?: string | fn.Fn
			Tags?:             [...close({
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
