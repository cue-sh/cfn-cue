package cnnorth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#CloudFormation: {
	#CustomResource: {
		Type: "AWS::CloudFormation::CustomResource" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: {
			ServiceToken: *string | fn.#Fn
			{
				[string]: _
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Macro: {
		Type: "AWS::CloudFormation::Macro"
		Properties: {
			Description?:  *string | fn.#Fn
			FunctionName:  *string | fn.#Fn
			LogGroupName?: *string | fn.#Fn
			LogRoleARN?:   *string | fn.#Fn
			Name:          *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModuleDefaultVersion: {
		Type: "AWS::CloudFormation::ModuleDefaultVersion"
		Properties: {
			Arn?:        *(=~#"^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/module/.+/[0-9]{8}$"#) | fn.#Fn
			ModuleName?: *(=~#"^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::MODULE"#) | fn.#Fn
			VersionId?:  *(=~#"^[0-9]{8}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModuleVersion: {
		Type: "AWS::CloudFormation::ModuleVersion"
		Properties: {
			ModuleName:    *(=~#"^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::MODULE"#) | fn.#Fn
			ModulePackage: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceDefaultVersion: {
		Type: "AWS::CloudFormation::ResourceDefaultVersion"
		Properties: {
			TypeName?:       *(=~#"^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}$"#) | fn.#Fn
			TypeVersionArn?: *(=~#"^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/resource/.+$"#) | fn.#Fn
			VersionId?:      *(=~#"^[A-Za-z0-9-]{1,128}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceVersion: {
		Type: "AWS::CloudFormation::ResourceVersion"
		Properties: {
			ExecutionRoleArn?: *string | fn.#Fn
			LoggingConfig?:    *{
				LogGroupName?: *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[\.\-_/#A-Za-z0-9]+$"#)) | fn.#Fn
				LogRoleArn?:   *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			} | fn.#If
			SchemaHandlerPackage: *string | fn.#Fn
			TypeName:             *(=~#"^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Stack: {
		Type: "AWS::CloudFormation::Stack"
		Properties: {
			NotificationARNs?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Parameters?:       *{
				[string]: *string | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TemplateURL:       *string | fn.#Fn
			TimeoutInMinutes?: *int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WaitCondition: {
		Type: "AWS::CloudFormation::WaitCondition"
		Properties: {
			Count?:   *int | fn.#Fn
			Handle?:  *string | fn.#Fn
			Timeout?: *(>=0 & <=43200) | fn.#Fn
		}
		DependsOn?: string | [...string]
		CreationPolicy?: {
			AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
			ResourceSignal?: {
				Count?:   int
				Timeout?: string
			}
		}
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WaitConditionHandle: {
		Type: "AWS::CloudFormation::WaitConditionHandle"
		Properties: {}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
