package useast1

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
					ImageIdOverride?:        *string | fn.#Fn
					ImageKubernetesVersion?: *string | fn.#Fn
					ImageType:               *string | fn.#Fn
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
			EksConfiguration?: *{
				EksClusterArn:       *string | fn.#Fn
				KubernetesNamespace: *string | fn.#Fn
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
	#JobDefinition: {
		Type: "AWS::Batch::JobDefinition"
		Properties: {
			ContainerProperties?: *{
				Command?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Environment?: *[...{
					Name?:  *string | fn.#Fn
					Value?: *string | fn.#Fn
				}] | fn.#If
				ExecutionRoleArn?:             *string | fn.#Fn
				FargatePlatformConfiguration?: *{
					PlatformVersion?: *string | fn.#Fn
				} | fn.#If
				Image:            *string | fn.#Fn
				InstanceType?:    *string | fn.#Fn
				JobRoleArn?:      *string | fn.#Fn
				LinuxParameters?: *{
					Devices?: *[...{
						ContainerPath?: *string | fn.#Fn
						HostPath?:      *string | fn.#Fn
						Permissions?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					}] | fn.#If
					InitProcessEnabled?: *bool | fn.#Fn
					MaxSwap?:            *int | fn.#Fn
					SharedMemorySize?:   *int | fn.#Fn
					Swappiness?:         *int | fn.#Fn
					Tmpfs?:              *[...{
						ContainerPath: *string | fn.#Fn
						MountOptions?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						Size:          *int | fn.#Fn
					}] | fn.#If
				} | fn.#If
				LogConfiguration?: *{
					LogDriver: *string | fn.#Fn
					Options?:  *{
						[string]: _
					} | fn.#Fn
					SecretOptions?: *[...{
						Name:      *string | fn.#Fn
						ValueFrom: *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				Memory?:      *int | fn.#Fn
				MountPoints?: *[...{
					ContainerPath?: *string | fn.#Fn
					ReadOnly?:      *bool | fn.#Fn
					SourceVolume?:  *string | fn.#Fn
				}] | fn.#If
				NetworkConfiguration?: *{
					AssignPublicIp?: *string | fn.#Fn
				} | fn.#If
				Privileged?:             *bool | fn.#Fn
				ReadonlyRootFilesystem?: *bool | fn.#Fn
				ResourceRequirements?:   *[...{
					Type?:  *string | fn.#Fn
					Value?: *string | fn.#Fn
				}] | fn.#If
				Secrets?: *[...{
					Name:      *string | fn.#Fn
					ValueFrom: *string | fn.#Fn
				}] | fn.#If
				Ulimits?: *[...{
					HardLimit: *int | fn.#Fn
					Name:      *string | fn.#Fn
					SoftLimit: *int | fn.#Fn
				}] | fn.#If
				User?:    *string | fn.#Fn
				Vcpus?:   *int | fn.#Fn
				Volumes?: *[...{
					EfsVolumeConfiguration?: *{
						AuthorizationConfig?: *{
							AccessPointId?: *string | fn.#Fn
							Iam?:           *string | fn.#Fn
						} | fn.#If
						FileSystemId:           *string | fn.#Fn
						RootDirectory?:         *string | fn.#Fn
						TransitEncryption?:     *string | fn.#Fn
						TransitEncryptionPort?: *int | fn.#Fn
					} | fn.#If
					Host?: *{
						SourcePath?: *string | fn.#Fn
					} | fn.#If
					Name?: *string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			EksProperties?: *{
				PodProperties?: *{
					Containers?: *[...{
						Args?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						Command?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						Env?:     *[...{
							Name:   *string | fn.#Fn
							Value?: *string | fn.#Fn
						}] | fn.#If
						Image:            *string | fn.#Fn
						ImagePullPolicy?: *string | fn.#Fn
						Name?:            *string | fn.#Fn
						Resources?:       *{
							Limits?: *{
								[string]: _
							} | fn.#Fn
							Requests?: *{
								[string]: _
							} | fn.#Fn
						} | fn.#If
						SecurityContext?: *{
							Privileged?:             *bool | fn.#Fn
							ReadOnlyRootFilesystem?: *bool | fn.#Fn
							RunAsGroup?:             *int | fn.#Fn
							RunAsNonRoot?:           *bool | fn.#Fn
							RunAsUser?:              *int | fn.#Fn
						} | fn.#If
						VolumeMounts?: *[...{
							MountPath?: *string | fn.#Fn
							Name?:      *string | fn.#Fn
							ReadOnly?:  *bool | fn.#Fn
						}] | fn.#If
					}] | fn.#If
					DnsPolicy?:          *string | fn.#Fn
					HostNetwork?:        *bool | fn.#Fn
					ServiceAccountName?: *string | fn.#Fn
					Volumes?:            *[...{
						EmptyDir?: *{
							Medium?:    *string | fn.#Fn
							SizeLimit?: *string | fn.#Fn
						} | fn.#If
						HostPath?: *{
							Path?: *string | fn.#Fn
						} | fn.#If
						Name:    *string | fn.#Fn
						Secret?: *{
							Name:      *string | fn.#Fn
							ValueFrom: *string | fn.#Fn
						} | fn.#If
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			JobDefinitionName?: *string | fn.#Fn
			NodeProperties?:    *{
				MainNode:            *int | fn.#Fn
				NodeRangeProperties: *[...{
					Container?: *{
						Command?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						Environment?: *[...{
							Name?:  *string | fn.#Fn
							Value?: *string | fn.#Fn
						}] | fn.#If
						ExecutionRoleArn?:             *string | fn.#Fn
						FargatePlatformConfiguration?: *{
							PlatformVersion?: *string | fn.#Fn
						} | fn.#If
						Image:            *string | fn.#Fn
						InstanceType?:    *string | fn.#Fn
						JobRoleArn?:      *string | fn.#Fn
						LinuxParameters?: *{
							Devices?: *[...{
								ContainerPath?: *string | fn.#Fn
								HostPath?:      *string | fn.#Fn
								Permissions?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
							}] | fn.#If
							InitProcessEnabled?: *bool | fn.#Fn
							MaxSwap?:            *int | fn.#Fn
							SharedMemorySize?:   *int | fn.#Fn
							Swappiness?:         *int | fn.#Fn
							Tmpfs?:              *[...{
								ContainerPath: *string | fn.#Fn
								MountOptions?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
								Size:          *int | fn.#Fn
							}] | fn.#If
						} | fn.#If
						LogConfiguration?: *{
							LogDriver: *string | fn.#Fn
							Options?:  *{
								[string]: _
							} | fn.#Fn
							SecretOptions?: *[...{
								Name:      *string | fn.#Fn
								ValueFrom: *string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						Memory?:      *int | fn.#Fn
						MountPoints?: *[...{
							ContainerPath?: *string | fn.#Fn
							ReadOnly?:      *bool | fn.#Fn
							SourceVolume?:  *string | fn.#Fn
						}] | fn.#If
						NetworkConfiguration?: *{
							AssignPublicIp?: *string | fn.#Fn
						} | fn.#If
						Privileged?:             *bool | fn.#Fn
						ReadonlyRootFilesystem?: *bool | fn.#Fn
						ResourceRequirements?:   *[...{
							Type?:  *string | fn.#Fn
							Value?: *string | fn.#Fn
						}] | fn.#If
						Secrets?: *[...{
							Name:      *string | fn.#Fn
							ValueFrom: *string | fn.#Fn
						}] | fn.#If
						Ulimits?: *[...{
							HardLimit: *int | fn.#Fn
							Name:      *string | fn.#Fn
							SoftLimit: *int | fn.#Fn
						}] | fn.#If
						User?:    *string | fn.#Fn
						Vcpus?:   *int | fn.#Fn
						Volumes?: *[...{
							EfsVolumeConfiguration?: *{
								AuthorizationConfig?: *{
									AccessPointId?: *string | fn.#Fn
									Iam?:           *string | fn.#Fn
								} | fn.#If
								FileSystemId:           *string | fn.#Fn
								RootDirectory?:         *string | fn.#Fn
								TransitEncryption?:     *string | fn.#Fn
								TransitEncryptionPort?: *int | fn.#Fn
							} | fn.#If
							Host?: *{
								SourcePath?: *string | fn.#Fn
							} | fn.#If
							Name?: *string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					TargetNodes: *string | fn.#Fn
				}] | fn.#If
				NumNodes: *int | fn.#Fn
			} | fn.#If
			Parameters?: *{
				[string]: _
			} | fn.#Fn
			PlatformCapabilities?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			PropagateTags?:        *bool | fn.#Fn
			RetryStrategy?:        *{
				Attempts?:       *int | fn.#Fn
				EvaluateOnExit?: *[...{
					Action:          *string | fn.#Fn
					OnExitCode?:     *string | fn.#Fn
					OnReason?:       *string | fn.#Fn
					OnStatusReason?: *string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			SchedulingPriority?: *int | fn.#Fn
			Tags?:               *{
				[string]: _
			} | fn.#Fn
			Timeout?: *{
				AttemptDurationSeconds?: *int | fn.#Fn
			} | fn.#If
			Type: *string | fn.#Fn
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
