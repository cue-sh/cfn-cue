package apsoutheast3

import "github.com/cue-sh/cfn-cue/aws/fn"

#Events: {
	#EventBus: {
		Type: "AWS::Events::EventBus"
		Properties: {
			EventSourceName?: *string | fn.#Fn
			Name:             *string | fn.#Fn
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
	#EventBusPolicy: {
		Type: "AWS::Events::EventBusPolicy"
		Properties: {
			Action?:    *("events:PutEvents") | fn.#Fn
			Condition?: *{
				Key?:   *("aws:PrincipalOrgID") | fn.#Fn
				Type?:  *("StringEquals") | fn.#Fn
				Value?: *string | fn.#Fn
			} | fn.#If
			EventBusName?: *string | fn.#Fn
			Principal?:    *string | fn.#Fn
			Statement?:    *{
				[string]: _
			} | fn.#Fn
			StatementId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Rule: {
		Type: "AWS::Events::Rule"
		Properties: BarName: *string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
