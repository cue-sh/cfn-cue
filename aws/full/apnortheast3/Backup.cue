package apnortheast3

import "github.com/cue-sh/cfn-cue/aws/fn"

#Backup: {
	#BackupPlan: {
		Type: "AWS::Backup::BackupPlan"
		Properties: {
			BackupPlan: *{
				AdvancedBackupSettings?: *[...{
					BackupOptions: *{
						[string]: _
					} | fn.#Fn
					ResourceType: *string | fn.#Fn
				}] | fn.#If
				BackupPlanName: *string | fn.#Fn
				BackupPlanRule: *[...{
					CompletionWindowMinutes?: *int | fn.#Fn
					CopyActions?:             *[...{
						DestinationBackupVaultArn: *string | fn.#Fn
						Lifecycle?:                *{
							DeleteAfterDays?:            *int | fn.#Fn
							MoveToColdStorageAfterDays?: *int | fn.#Fn
						} | fn.#If
					}] | fn.#If
					EnableContinuousBackup?: *bool | fn.#Fn
					Lifecycle?:              *{
						DeleteAfterDays?:            *int | fn.#Fn
						MoveToColdStorageAfterDays?: *int | fn.#Fn
					} | fn.#If
					RecoveryPointTags?: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					RuleName:            *string | fn.#Fn
					ScheduleExpression?: *string | fn.#Fn
					StartWindowMinutes?: *int | fn.#Fn
					TargetBackupVault:   *(=~#"^[a-zA-Z0-9\-\_]{2,50}$"#) | fn.#Fn
				}] | fn.#If
			} | fn.#If
			BackupPlanTags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#BackupSelection: {
		Type: "AWS::Backup::BackupSelection"
		Properties: {
			BackupPlanId:    *string | fn.#Fn
			BackupSelection: *{
				IamRoleArn:  *(=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
				ListOfTags?: *[...{
					ConditionKey:   *string | fn.#Fn
					ConditionType:  *string | fn.#Fn
					ConditionValue: *string | fn.#Fn
				}] | fn.#If
				Resources?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SelectionName: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#BackupVault: {
		Type: "AWS::Backup::BackupVault"
		Properties: {
			AccessPolicy?: *{
				[string]: _
			} | fn.#Fn
			BackupVaultName:  *(=~#"^[a-zA-Z0-9\-\_]{2,50}$"#) | fn.#Fn
			BackupVaultTags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			EncryptionKeyArn?: *string | fn.#Fn
			Notifications?:    *{
				BackupVaultEvents: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SNSTopicArn:       *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
