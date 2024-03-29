package apsoutheast3

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
	#StackSet: {
		Type: "AWS::CloudFormation::StackSet"
		Properties: {
			AdministrationRoleARN?: *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
			AutoDeployment?:        *{
				Enabled?:                      *bool | fn.#Fn
				RetainStacksOnAccountRemoval?: *bool | fn.#Fn
			} | fn.#If
			CallAs?:            *("SELF" | "DELEGATED_ADMIN") | fn.#Fn
			Capabilities?:      [...(*("CAPABILITY_IAM" | "CAPABILITY_NAMED_IAM" | "CAPABILITY_AUTO_EXPAND") | fn.#Fn)] | (*("CAPABILITY_IAM" | "CAPABILITY_NAMED_IAM" | "CAPABILITY_AUTO_EXPAND") | fn.#Fn)
			Description?:       *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
			ExecutionRoleName?: *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
			ManagedExecution?:  *{
				[string]: _
			} | fn.#Fn
			OperationPreferences?: *{
				FailureToleranceCount?:      *int | fn.#Fn
				FailureTolerancePercentage?: *int | fn.#Fn
				MaxConcurrentCount?:         *int | fn.#Fn
				MaxConcurrentPercentage?:    *int | fn.#Fn
				RegionConcurrencyType?:      *("SEQUENTIAL" | "PARALLEL") | fn.#Fn
				RegionOrder?:                [...(*(=~#"^[a-zA-Z0-9-]{1,128}$"#) | fn.#Fn)] | (*(=~#"^[a-zA-Z0-9-]{1,128}$"#) | fn.#Fn)
			} | fn.#If
			Parameters?: *[...{
				ParameterKey:   *string | fn.#Fn
				ParameterValue: *string | fn.#Fn
			}] | fn.#If
			PermissionModel:      *("SERVICE_MANAGED" | "SELF_MANAGED") | fn.#Fn
			StackInstancesGroup?: *[...{
				DeploymentTargets: *{
					AccountFilterType?:     *("NONE" | "UNION" | "INTERSECTION" | "DIFFERENCE") | fn.#Fn
					Accounts?:              [...(*(=~#"^[0-9]{12}$"#) | fn.#Fn)] | (*(=~#"^[0-9]{12}$"#) | fn.#Fn)
					OrganizationalUnitIds?: [...(*(=~#"^(ou-[a-z0-9]{4,32}-[a-z0-9]{8,32}|r-[a-z0-9]{4,32})$"#) | fn.#Fn)] | (*(=~#"^(ou-[a-z0-9]{4,32}-[a-z0-9]{8,32}|r-[a-z0-9]{4,32})$"#) | fn.#Fn)
				} | fn.#If
				ParameterOverrides?: *[...{
					ParameterKey:   *string | fn.#Fn
					ParameterValue: *string | fn.#Fn
				}] | fn.#If
				Regions: [...(*(=~#"^[a-zA-Z0-9-]{1,128}$"#) | fn.#Fn)] | (*(=~#"^[a-zA-Z0-9-]{1,128}$"#) | fn.#Fn)
			}] | fn.#If
			StackSetName: *(=~#"^[a-zA-Z][a-zA-Z0-9\-]{0,127}$"#) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TemplateBody?: *(strings.MinRunes(1) & strings.MaxRunes(51200)) | fn.#Fn
			TemplateURL?:  *(strings.MinRunes(1) & strings.MaxRunes(5120)) | fn.#Fn
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
