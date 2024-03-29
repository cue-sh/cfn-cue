package apsoutheast2

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
			DefaultInstanceWarmup?:   *int | fn.#Fn
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
			InstanceType:                  *("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5ad.12xlarge" | "c5ad.16xlarge" | "c5ad.24xlarge" | "c5ad.2xlarge" | "c5ad.4xlarge" | "c5ad.8xlarge" | "c5ad.large" | "c5ad.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "c6gd.12xlarge" | "c6gd.16xlarge" | "c6gd.2xlarge" | "c6gd.4xlarge" | "c6gd.8xlarge" | "c6gd.large" | "c6gd.medium" | "c6gd.metal" | "c6gd.xlarge" | "c6gn.12xlarge" | "c6gn.16xlarge" | "c6gn.2xlarge" | "c6gn.4xlarge" | "c6gn.8xlarge" | "c6gn.large" | "c6gn.medium" | "c6gn.xlarge" | "c6i.12xlarge" | "c6i.16xlarge" | "c6i.24xlarge" | "c6i.2xlarge" | "c6i.32xlarge" | "c6i.4xlarge" | "c6i.8xlarge" | "c6i.large" | "c6i.metal" | "c6i.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "d3.2xlarge" | "d3.4xlarge" | "d3.8xlarge" | "d3.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.large" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "i4i.16xlarge" | "i4i.2xlarge" | "i4i.32xlarge" | "i4i.4xlarge" | "i4i.8xlarge" | "i4i.large" | "i4i.metal" | "i4i.xlarge" | "im4gn.16xlarge" | "im4gn.2xlarge" | "im4gn.4xlarge" | "im4gn.8xlarge" | "im4gn.large" | "im4gn.xlarge" | "inf1.24xlarge" | "inf1.2xlarge" | "inf1.6xlarge" | "inf1.xlarge" | "is4gen.2xlarge" | "is4gen.4xlarge" | "is4gen.8xlarge" | "is4gen.large" | "is4gen.medium" | "is4gen.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5zn.12xlarge" | "m5zn.2xlarge" | "m5zn.3xlarge" | "m5zn.6xlarge" | "m5zn.large" | "m5zn.metal" | "m5zn.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "m6gd.12xlarge" | "m6gd.16xlarge" | "m6gd.2xlarge" | "m6gd.4xlarge" | "m6gd.8xlarge" | "m6gd.large" | "m6gd.medium" | "m6gd.metal" | "m6gd.xlarge" | "m6i.12xlarge" | "m6i.16xlarge" | "m6i.24xlarge" | "m6i.2xlarge" | "m6i.32xlarge" | "m6i.4xlarge" | "m6i.8xlarge" | "m6i.large" | "m6i.metal" | "m6i.xlarge" | "mac1.metal" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5b.12xlarge" | "r5b.16xlarge" | "r5b.24xlarge" | "r5b.2xlarge" | "r5b.4xlarge" | "r5b.8xlarge" | "r5b.large" | "r5b.metal" | "r5b.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "r6gd.12xlarge" | "r6gd.16xlarge" | "r6gd.2xlarge" | "r6gd.4xlarge" | "r6gd.8xlarge" | "r6gd.large" | "r6gd.medium" | "r6gd.metal" | "r6gd.xlarge" | "r6i.12xlarge" | "r6i.16xlarge" | "r6i.24xlarge" | "r6i.2xlarge" | "r6i.32xlarge" | "r6i.4xlarge" | "r6i.8xlarge" | "r6i.large" | "r6i.metal" | "r6i.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "t4g.2xlarge" | "t4g.large" | "t4g.medium" | "t4g.micro" | "t4g.nano" | "t4g.small" | "t4g.xlarge" | "u-12tb1.metal" | "u-3tb1.56xlarge" | "u-6tb1.112xlarge" | "u-6tb1.56xlarge" | "u-6tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "x2idn.16xlarge" | "x2idn.24xlarge" | "x2idn.32xlarge" | "x2idn.metal" | "x2iedn.16xlarge" | "x2iedn.24xlarge" | "x2iedn.2xlarge" | "x2iedn.32xlarge" | "x2iedn.4xlarge" | "x2iedn.8xlarge" | "x2iedn.metal" | "x2iedn.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
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
			PolicyType?:                     *("PredictiveScaling" | "SimpleScaling" | "StepScaling" | "TargetTrackingScaling") | fn.#Fn
			PredictiveScalingConfiguration?: *{
				MaxCapacityBreachBehavior?: *string | fn.#Fn
				MaxCapacityBuffer?:         *int | fn.#Fn
				MetricSpecifications:       *[...{
					CustomizedCapacityMetricSpecification?: *{
						MetricDataQueries: *[...{
							Expression?: *string | fn.#Fn
							Id:          *string | fn.#Fn
							Label?:      *string | fn.#Fn
							MetricStat?: *{
								Metric: *{
									Dimensions?: *[...{
										Name:  *string | fn.#Fn
										Value: *string | fn.#Fn
									}] | fn.#If
									MetricName: *string | fn.#Fn
									Namespace:  *string | fn.#Fn
								} | fn.#If
								Stat:  *string | fn.#Fn
								Unit?: *string | fn.#Fn
							} | fn.#If
							ReturnData?: *bool | fn.#Fn
						}] | fn.#If
					} | fn.#If
					CustomizedLoadMetricSpecification?: *{
						MetricDataQueries: *[...{
							Expression?: *string | fn.#Fn
							Id:          *string | fn.#Fn
							Label?:      *string | fn.#Fn
							MetricStat?: *{
								Metric: *{
									Dimensions?: *[...{
										Name:  *string | fn.#Fn
										Value: *string | fn.#Fn
									}] | fn.#If
									MetricName: *string | fn.#Fn
									Namespace:  *string | fn.#Fn
								} | fn.#If
								Stat:  *string | fn.#Fn
								Unit?: *string | fn.#Fn
							} | fn.#If
							ReturnData?: *bool | fn.#Fn
						}] | fn.#If
					} | fn.#If
					CustomizedScalingMetricSpecification?: *{
						MetricDataQueries: *[...{
							Expression?: *string | fn.#Fn
							Id:          *string | fn.#Fn
							Label?:      *string | fn.#Fn
							MetricStat?: *{
								Metric: *{
									Dimensions?: *[...{
										Name:  *string | fn.#Fn
										Value: *string | fn.#Fn
									}] | fn.#If
									MetricName: *string | fn.#Fn
									Namespace:  *string | fn.#Fn
								} | fn.#If
								Stat:  *string | fn.#Fn
								Unit?: *string | fn.#Fn
							} | fn.#If
							ReturnData?: *bool | fn.#Fn
						}] | fn.#If
					} | fn.#If
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
			AutoScalingGroupName: *string | fn.#Fn
			InstanceReusePolicy?: *{
				ReuseOnScaleIn?: *bool | fn.#Fn
			} | fn.#If
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
