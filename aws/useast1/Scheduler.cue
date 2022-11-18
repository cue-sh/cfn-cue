package useast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Scheduler: {
	#Schedule: {
		Type: "AWS::Scheduler::Schedule"
		Properties: {
			Description?:       *string | fn.#Fn
			EndDate?:           *string | fn.#Fn
			FlexibleTimeWindow: *{
				MaximumWindowInMinutes?: *(>=1 & <=1440) | fn.#Fn
				Mode:                    *("OFF" | "FLEXIBLE") | fn.#Fn
			} | fn.#If
			GroupName?:                  *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[0-9a-zA-Z-_.]+$"#)) | fn.#Fn
			KmsKeyArn?:                  *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:aws(-[a-z]+)?:kms:[a-z0-9\-]+:\d{12}:(key|alias)\/[0-9a-zA-Z-_]*$"#)) | fn.#Fn
			Name?:                       *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[0-9a-zA-Z-_.]+$"#)) | fn.#Fn
			ScheduleExpression:          *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			ScheduleExpressionTimezone?: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
			StartDate?:                  *string | fn.#Fn
			State?:                      *("ENABLED" | "DISABLED") | fn.#Fn
			Target:                      *{
				Arn:               *(strings.MinRunes(1) & strings.MaxRunes(1600)) | fn.#Fn
				DeadLetterConfig?: *{
					Arn?: *(strings.MinRunes(1) & strings.MaxRunes(1600) & (=~#"^arn:aws(-[a-z]+)?:sqs:[a-z0-9\-]+:\d{12}:[a-zA-Z0-9\-_]+$"#)) | fn.#Fn
				} | fn.#If
				EcsParameters?: *{
					CapacityProviderStrategy?: *[...{
						Base?:            *number | fn.#Fn
						CapacityProvider: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
						Weight?:          *number | fn.#Fn
					}] | fn.#If
					EnableECSManagedTags?: *bool | fn.#Fn
					EnableExecuteCommand?: *bool | fn.#Fn
					Group?:                *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					LaunchType?:           *("EC2" | "FARGATE" | "EXTERNAL") | fn.#Fn
					NetworkConfiguration?: *{
						AwsvpcConfiguration?: *{
							AssignPublicIp?: *("ENABLED" | "DISABLED") | fn.#Fn
							SecurityGroups?: [...(*(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn)
							Subnets:         [...(*(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn)
						} | fn.#If
					} | fn.#If
					PlacementConstraints?: *[...{
						Expression?: *string | fn.#Fn
						Type?:       *("distinctInstance" | "memberOf") | fn.#Fn
					}] | fn.#If
					PlacementStrategy?: *[...{
						Field?: *string | fn.#Fn
						Type?:  *("random" | "spread" | "binpack") | fn.#Fn
					}] | fn.#If
					PlatformVersion?:  *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
					PropagateTags?:    *("TASK_DEFINITION") | fn.#Fn
					ReferenceId?:      *string | fn.#Fn
					Tags?:             *[...{}] | fn.#If
					TaskCount?:        *(>=1 & <=10) | fn.#Fn
					TaskDefinitionArn: *(strings.MinRunes(1) & strings.MaxRunes(1600)) | fn.#Fn
				} | fn.#If
				EventBridgeParameters?: *{
					DetailType: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Source:     *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^(?=[/\.\-_A-Za-z0-9]+)((?!aws\.).*)|(\$(\.[\w_-]+(\[(\d+|\*)\])*)*)$"#)) | fn.#Fn
				} | fn.#If
				Input?:             *string | fn.#Fn
				KinesisParameters?: *{
					PartitionKey: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
				} | fn.#If
				RetryPolicy?: *{
					MaximumEventAgeInSeconds?: *(>=60 & <=86400) | fn.#Fn
					MaximumRetryAttempts?:     *number | fn.#Fn
				} | fn.#If
				RoleArn:                      *(strings.MinRunes(1) & strings.MaxRunes(1600) & (=~#"^arn:aws(-[a-z]+)?:iam::\d{12}:role\/(service-role\/){0,1}[a-zA-Z0-9\+=,\.@\-_]+$"#)) | fn.#Fn
				SageMakerPipelineParameters?: *{
					PipelineParameterList?: *[...{
						Name:  *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[A-Za-z0-9\-_]*$"#)) | fn.#Fn
						Value: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					}] | fn.#If
				} | fn.#If
				SqsParameters?: *{
					MessageGroupId?: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ScheduleGroup: {
		Type: "AWS::Scheduler::ScheduleGroup"
		Properties: {
			Name?: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[0-9a-zA-Z-_.]+$"#)) | fn.#Fn
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
