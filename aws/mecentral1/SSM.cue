package mecentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SSM: {
	#Association: {
		Type: "AWS::SSM::Association"
		Properties: {
			ApplyOnlyAtCronInterval?:       *bool | fn.#Fn
			AssociationName?:               *(=~#"^[a-zA-Z0-9_\-.]{3,128}$"#) | fn.#Fn
			AutomationTargetParameterName?: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
			CalendarNames?:                 [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			ComplianceSeverity?:            *("CRITICAL" | "HIGH" | "MEDIUM" | "LOW" | "UNSPECIFIED") | fn.#Fn
			DocumentVersion?:               *(=~#"([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)"#) | fn.#Fn
			InstanceId?:                    *(=~#"(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)"#) | fn.#Fn
			MaxConcurrency?:                *(=~#"^([1-9][0-9]{0,6}|[1-9][0-9]%|[1-9]%|100%)$"#) | fn.#Fn
			MaxErrors?:                     *(=~#"^([1-9][0-9]{0,6}|[0]|[1-9][0-9]%|[0-9]%|100%)$"#) | fn.#Fn
			Name:                           *(=~#"^[a-zA-Z0-9_\-.:/]{3,200}$"#) | fn.#Fn
			OutputLocation?:                *{
				S3Location?: *{
					OutputS3BucketName?: *(strings.MinRunes(3) & strings.MaxRunes(63)) | fn.#Fn
					OutputS3KeyPrefix?:  *string | fn.#Fn
					OutputS3Region?:     *(strings.MinRunes(3) & strings.MaxRunes(20)) | fn.#Fn
				} | fn.#If
			} | fn.#If
			Parameters?: *{
				[string]: *{
					[string]: _
				} | fn.#Fn
			} | fn.#If
			ScheduleExpression?: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			ScheduleOffset?:     *(>=1 & <=6) | fn.#Fn
			SyncCompliance?:     *("AUTO" | "MANUAL") | fn.#Fn
			Targets?:            *[...{
				Key:    *string | fn.#Fn
				Values: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			WaitForSuccessTimeoutSeconds?: *(>=15 & <=172800) | fn.#Fn
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
			Attachments?: *[...{
				Key?:    *("SourceUrl" | "S3FileUrl" | "AttachmentReference") | fn.#Fn
				Name?:   *string | fn.#Fn
				Values?: [...(*(strings.MinRunes(1) & strings.MaxRunes(100000)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(100000)) | fn.#Fn)
			}] | fn.#If
			Content: *{
				[string]: _
			} | fn.#Fn
			DocumentFormat?: *("YAML" | "JSON" | "TEXT") | fn.#Fn
			DocumentType?:   *("ApplicationConfiguration" | "ApplicationConfigurationSchema" | "Automation" | "Automation.ChangeTemplate" | "ChangeCalendar" | "CloudFormation" | "Command" | "DeploymentStrategy" | "Package" | "Policy" | "ProblemAnalysis" | "ProblemAnalysisTemplate" | "Session") | fn.#Fn
			Name?:           *(=~#"^[a-zA-Z0-9_\-.]{3,128}$"#) | fn.#Fn
			Requires?:       *[...{
				Name?:    *(=~#"^[a-zA-Z0-9_\-.:/]{3,200}$"#) | fn.#Fn
				Version?: *(=~#"([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)"#) | fn.#Fn
			}] | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetType?:   *(=~#"^\/[\w\.\-\:\/]*$"#) | fn.#Fn
			UpdateMethod?: *("Replace" | "NewVersion") | fn.#Fn
			VersionName?:  *(=~#"^[a-zA-Z0-9_\-.]{1,128}$"#) | fn.#Fn
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
