package mecentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SSM: {
	#Association: {
		Type: "AWS::SSM::Association"
		Properties: {
			AssociationName?: *(=~#"^[a-zA-Z0-9_\-.]{3,128}$"#) | fn.#Fn
			DocumentVersion?: *(=~#"([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)"#) | fn.#Fn
			InstanceId?:      *(=~#"(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)"#) | fn.#Fn
			Name:             *(=~#"^[a-zA-Z0-9_\-.:/]{3,200}$"#) | fn.#Fn
			OutputLocation?:  *{
				S3Location?: *{
					OutputS3BucketName?: *(strings.MinRunes(3) & strings.MaxRunes(63)) | fn.#Fn
					OutputS3KeyPrefix?:  *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Parameters?: *{
				[string]: ParameterValues: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			ScheduleExpression?: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			Targets?:            *[...{
				Key:    *string | fn.#Fn
				Values: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Document: {
		Type: "AWS::SSM::Document"
		Properties: {
			Content: *{
				[string]: _
			} | fn.#Fn
			DocumentType?: *("ApplicationConfiguration" | "ApplicationConfigurationSchema" | "Automation" | "Automation.ChangeTemplate" | "ChangeCalendar" | "CloudFormation" | "Command" | "DeploymentStrategy" | "Package" | "Policy" | "ProblemAnalysis" | "ProblemAnalysisTemplate" | "Session") | fn.#Fn
			Name?:         *(=~#"^[a-zA-Z0-9_\-.]{3,128}$"#) | fn.#Fn
			Tags?:         *[...{
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
	#PatchBaseline: {
		Type: "AWS::SSM::PatchBaseline"
		Properties: {
			ApprovalRules?: *{
				PatchRules?: *[...{
					ApproveAfterDays?:  *int | fn.#Fn
					ApproveUntilDate?:  *{} | fn.#If
					ComplianceLevel?:   *string | fn.#Fn
					EnableNonSecurity?: *bool | fn.#Fn
					PatchFilterGroup?:  *{
						PatchFilters?: *[...{
							Key?:    *string | fn.#Fn
							Values?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						}] | fn.#If
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			ApprovedPatches?:                  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			ApprovedPatchesComplianceLevel?:   *string | fn.#Fn
			ApprovedPatchesEnableNonSecurity?: *bool | fn.#Fn
			Description?:                      *string | fn.#Fn
			GlobalFilters?:                    *{
				PatchFilters?: *[...{
					Key?:    *string | fn.#Fn
					Values?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				}] | fn.#If
			} | fn.#If
			Name:                   *string | fn.#Fn
			OperatingSystem?:       *string | fn.#Fn
			PatchGroups?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			RejectedPatches?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			RejectedPatchesAction?: *string | fn.#Fn
			Sources?:               *[...{
				Configuration?: *string | fn.#Fn
				Name?:          *string | fn.#Fn
				Products?:      [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			Tags?: *[...{
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
