package apsoutheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Batch: {
	#ComputeEnvironment: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: *string | fn.#Fn
			ComputeResources?:       *{
				AllocationStrategy?: *string | fn.#Fn
				BidPercentage?:      *int | fn.#Fn
				DesiredvCpus?:       *int | fn.#Fn
				Ec2Configuration?:   *[...{
					ImageIdOverride?: *string | fn.#Fn
					ImageType:        *string | fn.#Fn
				}] | fn.#If
				Ec2KeyPair?:     *string | fn.#Fn
				ImageId?:        *string | fn.#Fn
				InstanceRole?:   *string | fn.#Fn
				InstanceTypes?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				LaunchTemplate?: *{
					LaunchTemplateId?:   *string | fn.#Fn
					LaunchTemplateName?: *string | fn.#Fn
					Version?:            *string | fn.#Fn
				} | fn.#If
				MaxvCpus:          *int | fn.#Fn
				MinvCpus?:         *int | fn.#Fn
				PlacementGroup?:   *string | fn.#Fn
				SecurityGroupIds?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SpotIamFleetRole?: *(=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
				Subnets:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Tags?:             *{
					[string]: *string | fn.#Fn
				} | fn.#If
				Type:                        *string | fn.#Fn
				UpdateToLatestImageVersion?: *bool | fn.#Fn
			} | fn.#If
			ReplaceComputeEnvironment?: *bool | fn.#Fn
			ServiceRole?:               *(=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
			State?:                     *string | fn.#Fn
			Tags?:                      *{
				[string]: *string | fn.#Fn
			} | fn.#If
			Type:            *string | fn.#Fn
			UnmanagedvCpus?: *int | fn.#Fn
			UpdatePolicy?:   *{
				JobExecutionTimeoutMinutes?: *int | fn.#Fn
				TerminateJobsOnUpdate?:      *bool | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#JobQueue: {
		Type: "AWS::Batch::JobQueue"
		Properties: {
			ComputeEnvironmentOrder: *[...{
				ComputeEnvironment: *string | fn.#Fn
				Order:              *int | fn.#Fn
			}] | fn.#If
			JobQueueName?:        *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
			Priority:             *int | fn.#Fn
			SchedulingPolicyArn?: *(=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#) | fn.#Fn
			State?:               *("DISABLED" | "ENABLED") | fn.#Fn
			Tags?:                *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SchedulingPolicy: {
		Type: "AWS::Batch::SchedulingPolicy"
		Properties: {
			FairsharePolicy?: *{
				ComputeReservation?: *number | fn.#Fn
				ShareDecaySeconds?:  *number | fn.#Fn
				ShareDistribution?:  *[...{
					ShareIdentifier?: *string | fn.#Fn
					WeightFactor?:    *number | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Name?: *string | fn.#Fn
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
