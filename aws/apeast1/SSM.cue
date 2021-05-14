package apeast1

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
			ComplianceSeverity?:            *("CRITICAL" | "HIGH" | "MEDIUM" | "LOW" | "UNSPECIFIED") | fn.#Fn
			DocumentVersion?:               *(=~#"([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)"#) | fn.#Fn
			InstanceId?:                    *(=~#"(^i-(\w{8}|\w{17})$)|(^mi-\w{17}$)"#) | fn.#Fn
			MaxConcurrency?:                *(strings.MinRunes(1) & strings.MaxRunes(7) & (=~#"^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$"#)) | fn.#Fn
			MaxErrors?:                     *(strings.MinRunes(1) & strings.MaxRunes(7) & (=~#"^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$"#)) | fn.#Fn
			Name:                           *(=~#"^[a-zA-Z0-9_\-.:/]{3,200}$"#) | fn.#Fn
			OutputLocation?:                *{
				S3Location?: *{
					OutputS3BucketName?: *(strings.MinRunes(3) & strings.MaxRunes(63)) | fn.#Fn
					OutputS3KeyPrefix?:  *string | fn.#Fn
					OutputS3Region?:     *(strings.MinRunes(3) & strings.MaxRunes(20)) | fn.#Fn
				} | fn.#If
			} | fn.#If
			Parameters?: *{
				[string]: ParameterValues: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			ScheduleExpression?: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
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
			DocumentFormat?: *("YAML" | "JSON") | fn.#Fn
			DocumentType?:   *("ApplicationConfiguration" | "ApplicationConfigurationSchema" | "Automation" | "Automation.ChangeTemplate" | "Command" | "DeploymentStrategy" | "Package" | "Policy" | "Session") | fn.#Fn
			Name?:           *(=~#"^[a-zA-Z0-9_\-.]{3,128}$"#) | fn.#Fn
			Requires?:       *[...{
				Name?:    *(=~#"^[a-zA-Z0-9_\-.:/]{3,200}$"#) | fn.#Fn
				Version?: *(=~#"([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)"#) | fn.#Fn
			}] | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetType?:  *(=~#"^\/[\w\.\-\:\/]*$"#) | fn.#Fn
			VersionName?: *(=~#"^[a-zA-Z0-9_\-.]{1,128}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MaintenanceWindowTarget: {
		Type: "AWS::SSM::MaintenanceWindowTarget"
		Properties: {
			Description?:      *string | fn.#Fn
			Name?:             *string | fn.#Fn
			OwnerInformation?: *string | fn.#Fn
			ResourceType:      *string | fn.#Fn
			Targets:           *[...{
				Key:    *string | fn.#Fn
				Values: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			WindowId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
