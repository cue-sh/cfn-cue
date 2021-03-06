package euwest3

import "github.com/cue-sh/cfn-cue/aws/fn"

#AutoScaling: {
	#AutoScalingGroup: {
		Type: "AWS::AutoScaling::AutoScalingGroup"
		Properties: {
			AutoScalingGroupName?:    *string | fn.#Fn
			AvailabilityZones?:       [...(*("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn)] | (*("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn)
			CapacityRebalance?:       *bool | fn.#Fn
			Cooldown?:                *string | fn.#Fn
			DesiredCapacity?:         *string | fn.#Fn
			HealthCheckGracePeriod?:  *int | fn.#Fn
			HealthCheckType?:         *("EC2" | "ELB") | fn.#Fn
			InstanceId?:              *string | fn.#Fn
			LaunchConfigurationName?: *string | fn.#Fn
			LaunchTemplate?:          *{
				LaunchTemplateId?:   *string | fn.#Fn
				LaunchTemplateName?: *string | fn.#Fn
				Version:             *string | fn.#Fn
			} | fn.#If
			LifecycleHookSpecificationList?: *[...{
				DefaultResult?:         *("ABANDON" | "CONTINUE") | fn.#Fn
				HeartbeatTimeout?:      *int | fn.#Fn
				LifecycleHookName:      *string | fn.#Fn
				LifecycleTransition:    *("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING") | fn.#Fn
				NotificationMetadata?:  *string | fn.#Fn
				NotificationTargetARN?: *string | fn.#Fn
				RoleARN?:               *string | fn.#Fn
			}] | fn.#If
			LoadBalancerNames?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			MaxInstanceLifetime?: *int | fn.#Fn
			MaxSize:              *string | fn.#Fn
			MetricsCollection?:   *[...{
				Granularity: *string | fn.#Fn
				Metrics?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			MinSize:               *string | fn.#Fn
			MixedInstancesPolicy?: *{
				InstancesDistribution?: *{
					OnDemandAllocationStrategy?:          *string | fn.#Fn
					OnDemandBaseCapacity?:                *int | fn.#Fn
					OnDemandPercentageAboveBaseCapacity?: *int | fn.#Fn
					SpotAllocationStrategy?:              *string | fn.#Fn
					SpotInstancePools?:                   *int | fn.#Fn
					SpotMaxPrice?:                        *string | fn.#Fn
				} | fn.#If
				LaunchTemplate: *{
					LaunchTemplateSpecification: *{
						LaunchTemplateId?:   *string | fn.#Fn
						LaunchTemplateName?: *string | fn.#Fn
						Version:             *string | fn.#Fn
					} | fn.#If
					Overrides?: *[...{
						InstanceType?:                *string | fn.#Fn
						LaunchTemplateSpecification?: *{
							LaunchTemplateId?:   *string | fn.#Fn
							LaunchTemplateName?: *string | fn.#Fn
							Version:             *string | fn.#Fn
						} | fn.#If
						WeightedCapacity?: *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			NewInstancesProtectedFromScaleIn?: *bool | fn.#Fn
			NotificationConfigurations?:       *[...{
				NotificationTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				TopicARN:           *string | fn.#Fn
			}] | fn.#If
			PlacementGroup?:       *string | fn.#Fn
			ServiceLinkedRoleARN?: *string | fn.#Fn
			Tags?:                 *[...{
				Key:               *string | fn.#Fn
				PropagateAtLaunch: *bool | fn.#Fn
				Value:             *string | fn.#Fn
			}] | fn.#If
			TargetGroupARNs?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			TerminationPolicies?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			VPCZoneIdentifier?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
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
		UpdatePolicy?: [string]: _
		Metadata?: [string]: _
		Condition?: string
	}
	#LaunchConfiguration: {
		Type: "AWS::AutoScaling::LaunchConfiguration"
		Properties: {
			AssociatePublicIpAddress?: *bool | fn.#Fn
			BlockDeviceMappings?:      *[...{
				DeviceName: *string | fn.#Fn
				Ebs?:       *{
					DeleteOnTermination?: *bool | fn.#Fn
					Encrypted?:           *bool | fn.#Fn
					Iops?:                *int | fn.#Fn
					SnapshotId?:          *string | fn.#Fn
					VolumeSize?:          *int | fn.#Fn
					VolumeType?:          *("gp2" | "gp3" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
				} | fn.#If
				NoDevice?:    *bool | fn.#Fn
				VirtualName?: *string | fn.#Fn
			}] | fn.#If
			ClassicLinkVPCId?:             *string | fn.#Fn
			ClassicLinkVPCSecurityGroups?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			EbsOptimized?:                 *bool | fn.#Fn
			IamInstanceProfile?:           *string | fn.#Fn
			ImageId:                       *string | fn.#Fn
			InstanceId?:                   *string | fn.#Fn
			InstanceMonitoring?:           *bool | fn.#Fn
			InstanceType:                  *("c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "inf1.24xlarge" | "inf1.2xlarge" | "inf1.6xlarge" | "inf1.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge") | fn.#Fn
			KernelId?:                     *string | fn.#Fn
			KeyName?:                      *string | fn.#Fn
			LaunchConfigurationName?:      *string | fn.#Fn
			MetadataOptions?:              *{
				HttpEndpoint?:            *string | fn.#Fn
				HttpPutResponseHopLimit?: *int | fn.#Fn
				HttpTokens?:              *string | fn.#Fn
			} | fn.#If
			PlacementTenancy?: *("dedicated" | "default") | fn.#Fn
			RamDiskId?:        *string | fn.#Fn
			SecurityGroups?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SpotPrice?:        *string | fn.#Fn
			UserData?:         *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LifecycleHook: {
		Type: "AWS::AutoScaling::LifecycleHook"
		Properties: {
			AutoScalingGroupName:   *string | fn.#Fn
			DefaultResult?:         *("ABANDON" | "CONTINUE") | fn.#Fn
			HeartbeatTimeout?:      *int | fn.#Fn
			LifecycleHookName?:     *string | fn.#Fn
			LifecycleTransition:    *("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING") | fn.#Fn
			NotificationMetadata?:  *string | fn.#Fn
			NotificationTargetARN?: *string | fn.#Fn
			RoleARN?:               *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ScalingPolicy: {
		Type: "AWS::AutoScaling::ScalingPolicy"
		Properties: {
			AdjustmentType?:          *("ChangeInCapacity" | "ExactCapacity" | "PercentChangeInCapacity") | fn.#Fn
			AutoScalingGroupName:     *string | fn.#Fn
			Cooldown?:                *string | fn.#Fn
			EstimatedInstanceWarmup?: *int | fn.#Fn
			MetricAggregationType?:   *("Average" | "Maximum" | "Minimum") | fn.#Fn
			MinAdjustmentMagnitude?:  *int | fn.#Fn
			PolicyType?:              *("SimpleScaling" | "StepScaling" | "TargetTrackingScaling") | fn.#Fn
			ScalingAdjustment?:       *int | fn.#Fn
			StepAdjustments?:         *[...{
				MetricIntervalLowerBound?: *number | fn.#Fn
				MetricIntervalUpperBound?: *number | fn.#Fn
				ScalingAdjustment:         *int | fn.#Fn
			}] | fn.#If
			TargetTrackingConfiguration?: *{
				CustomizedMetricSpecification?: *{
					Dimensions?: *[...{
						Name:  *string | fn.#Fn
						Value: *string | fn.#Fn
					}] | fn.#If
					MetricName: *string | fn.#Fn
					Namespace:  *string | fn.#Fn
					Statistic:  *("Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum") | fn.#Fn
					Unit?:      *string | fn.#Fn
				} | fn.#If
				DisableScaleIn?:                *bool | fn.#Fn
				PredefinedMetricSpecification?: *{
					PredefinedMetricType: *("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut") | fn.#Fn
					ResourceLabel?:       *string | fn.#Fn
				} | fn.#If
				TargetValue: *number | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ScheduledAction: {
		Type: "AWS::AutoScaling::ScheduledAction"
		Properties: {
			AutoScalingGroupName: *string | fn.#Fn
			DesiredCapacity?:     *int | fn.#Fn
			EndTime?:             *string | fn.#Fn
			MaxSize?:             *int | fn.#Fn
			MinSize?:             *int | fn.#Fn
			Recurrence?:          *string | fn.#Fn
			StartTime?:           *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WarmPool: {
		Type: "AWS::AutoScaling::WarmPool"
		Properties: {
			AutoScalingGroupName:      *string | fn.#Fn
			MaxGroupPreparedCapacity?: *int | fn.#Fn
			MinSize?:                  *int | fn.#Fn
			PoolState?:                *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
