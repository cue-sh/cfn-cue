package apnortheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#AutoScaling: {
	#AutoScalingGroup: {
		Type: "AWS::AutoScaling::AutoScalingGroup"
		Properties: {
			AutoScalingGroupName?:    *string | fn.#Fn
			AvailabilityZones?:       [...(*(=~#"[a-z0-9-]+"#) | fn.#Fn)] | (*(=~#"[a-z0-9-]+"#) | fn.#Fn)
			CapacityRebalance?:       *bool | fn.#Fn
			Context?:                 *string | fn.#Fn
			Cooldown?:                *string | fn.#Fn
			DesiredCapacity?:         *string | fn.#Fn
			DesiredCapacityType?:     *string | fn.#Fn
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
						InstanceRequirements?: *{
							AcceleratorCount?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							AcceleratorManufacturers?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							AcceleratorNames?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							AcceleratorTotalMemoryMiB?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							AcceleratorTypes?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							BareMetal?:                *string | fn.#Fn
							BaselineEbsBandwidthMbps?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							BurstablePerformance?:  *string | fn.#Fn
							CpuManufacturers?:      [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							ExcludedInstanceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							InstanceGenerations?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							LocalStorage?:          *string | fn.#Fn
							LocalStorageTypes?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							MemoryGiBPerVCpu?:      *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							MemoryMiB?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							NetworkInterfaceCount?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							OnDemandMaxPricePercentageOverLowestPrice?: *int | fn.#Fn
							RequireHibernateSupport?:                   *bool | fn.#Fn
							SpotMaxPricePercentageOverLowestPrice?:     *int | fn.#Fn
							TotalLocalStorageGB?:                       *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
							VCpuCount?: *{
								Max?: *int | fn.#Fn
								Min?: *int | fn.#Fn
							} | fn.#If
						} | fn.#If
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
					Throughput?:          *int | fn.#Fn
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
			InstanceType:                  *("c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-12tb1.metal" | "u-6tb1.metal" | "u-9tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge") | fn.#Fn
			KernelId?:                     *string | fn.#Fn
			KeyName?:                      *string | fn.#Fn
			LaunchConfigurationName?:      *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
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
			LifecycleHookName?:     *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
			LifecycleTransition:    *("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING") | fn.#Fn
			NotificationMetadata?:  *(strings.MinRunes(1) & strings.MaxRunes(1023)) | fn.#Fn
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
			AdjustmentType?:                 *("ChangeInCapacity" | "ExactCapacity" | "PercentChangeInCapacity") | fn.#Fn
			AutoScalingGroupName:            *string | fn.#Fn
			Cooldown?:                       *string | fn.#Fn
			EstimatedInstanceWarmup?:        *int | fn.#Fn
			MetricAggregationType?:          *("Average" | "Maximum" | "Minimum") | fn.#Fn
			MinAdjustmentMagnitude?:         *int | fn.#Fn
			PolicyType?:                     *("SimpleScaling" | "StepScaling" | "TargetTrackingScaling") | fn.#Fn
			PredictiveScalingConfiguration?: *{
				MaxCapacityBreachBehavior?: *string | fn.#Fn
				MaxCapacityBuffer?:         *int | fn.#Fn
				MetricSpecifications:       *[...{
					PredefinedLoadMetricSpecification?: *{
						PredefinedMetricType: *string | fn.#Fn
						ResourceLabel?:       *string | fn.#Fn
					} | fn.#If
					PredefinedMetricPairSpecification?: *{
						PredefinedMetricType: *string | fn.#Fn
						ResourceLabel?:       *string | fn.#Fn
					} | fn.#If
					PredefinedScalingMetricSpecification?: *{
						PredefinedMetricType: *string | fn.#Fn
						ResourceLabel?:       *string | fn.#Fn
					} | fn.#If
					TargetValue: *number | fn.#Fn
				}] | fn.#If
				Mode?:                 *string | fn.#Fn
				SchedulingBufferTime?: *int | fn.#Fn
			} | fn.#If
			ScalingAdjustment?: *int | fn.#Fn
			StepAdjustments?:   *[...{
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
			TimeZone?:            *string | fn.#Fn
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
