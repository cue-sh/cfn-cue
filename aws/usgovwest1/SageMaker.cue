package usgovwest1

import "github.com/cue-sh/cfn-cue/aws/fn"

#SageMaker: {
	#CodeRepository: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: *string | fn.#Fn
			GitConfig:           *{
				Branch?:       *string | fn.#Fn
				RepositoryUrl: *string | fn.#Fn
				SecretArn?:    *string | fn.#Fn
			} | fn.#If
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
	#Endpoint: {
		Type: "AWS::SageMaker::Endpoint"
		Properties: {
			DeploymentConfig?: *{
				AutoRollbackConfiguration?: *{
					Alarms: *[...{
						AlarmName: *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				BlueGreenUpdatePolicy: *{
					MaximumExecutionTimeoutInSeconds?: *int | fn.#Fn
					TerminationWaitInSeconds?:         *int | fn.#Fn
					TrafficRoutingConfiguration:       *{
						CanarySize?: *{
							Type:  *string | fn.#Fn
							Value: *int | fn.#Fn
						} | fn.#If
						LinearStepSize?: *{
							Type:  *string | fn.#Fn
							Value: *int | fn.#Fn
						} | fn.#If
						Type:                   *string | fn.#Fn
						WaitIntervalInSeconds?: *int | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			EndpointConfigName:                *string | fn.#Fn
			EndpointName?:                     *string | fn.#Fn
			ExcludeRetainedVariantProperties?: *[...{
				VariantPropertyType?: *string | fn.#Fn
			}] | fn.#If
			RetainAllVariantProperties?: *bool | fn.#Fn
			RetainDeploymentConfig?:     *bool | fn.#Fn
			Tags?:                       *[...{
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
	#EndpointConfig: {
		Type: "AWS::SageMaker::EndpointConfig"
		Properties: {
			AsyncInferenceConfig?: *{
				ClientConfig?: *{
					MaxConcurrentInvocationsPerInstance?: *int | fn.#Fn
				} | fn.#If
				OutputConfig: *{
					KmsKeyId?:           *string | fn.#Fn
					NotificationConfig?: *{
						ErrorTopic?:   *string | fn.#Fn
						SuccessTopic?: *string | fn.#Fn
					} | fn.#If
					S3OutputPath: *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			DataCaptureConfig?: *{
				CaptureContentTypeHeader?: *{
					CsvContentTypes?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					JsonContentTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				CaptureOptions: *[...{
					CaptureMode: *string | fn.#Fn
				}] | fn.#If
				DestinationS3Uri:          *string | fn.#Fn
				EnableCapture?:            *bool | fn.#Fn
				InitialSamplingPercentage: *int | fn.#Fn
				KmsKeyId?:                 *string | fn.#Fn
			} | fn.#If
			EndpointConfigName?: *string | fn.#Fn
			ExplainerConfig?:    *{
				ClarifyExplainerConfig?: *{
					EnableExplanations?: *string | fn.#Fn
					InferenceConfig?:    *{
						ContentTemplate?:      *string | fn.#Fn
						FeatureHeaders?:       *[...{}] | fn.#If
						FeatureTypes?:         *[...{}] | fn.#If
						FeaturesAttribute?:    *string | fn.#Fn
						LabelAttribute?:       *string | fn.#Fn
						LabelHeaders?:         *[...{}] | fn.#If
						LabelIndex?:           *int | fn.#Fn
						MaxPayloadInMB?:       *int | fn.#Fn
						MaxRecordCount?:       *int | fn.#Fn
						ProbabilityAttribute?: *string | fn.#Fn
						ProbabilityIndex?:     *int | fn.#Fn
					} | fn.#If
					ShapConfig: *{
						NumberOfSamples?:   *int | fn.#Fn
						Seed?:              *int | fn.#Fn
						ShapBaselineConfig: *{
							MimeType?:        *string | fn.#Fn
							ShapBaseline?:    *string | fn.#Fn
							ShapBaselineUri?: *string | fn.#Fn
						} | fn.#If
						TextConfig?: *{
							Granularity: *string | fn.#Fn
							Language:    *string | fn.#Fn
						} | fn.#If
						UseLogit?: *bool | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			KmsKeyId?:          *string | fn.#Fn
			ProductionVariants: *[...{
				AcceleratorType?:                             *string | fn.#Fn
				ContainerStartupHealthCheckTimeoutInSeconds?: *int | fn.#Fn
				InitialInstanceCount?:                        *int | fn.#Fn
				InitialVariantWeight:                         *number | fn.#Fn
				InstanceType?:                                *string | fn.#Fn
				ModelDataDownloadTimeoutInSeconds?:           *int | fn.#Fn
				ModelName:                                    *string | fn.#Fn
				ServerlessConfig?:                            *{
					MaxConcurrency: *int | fn.#Fn
					MemorySizeInMB: *int | fn.#Fn
				} | fn.#If
				VariantName:     *string | fn.#Fn
				VolumeSizeInGB?: *int | fn.#Fn
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
	#Model: {
		Type: "AWS::SageMaker::Model"
		Properties: {
			Containers?: *[...{
				ContainerHostname?: *string | fn.#Fn
				Environment?:       *{
					[string]: _
				} | fn.#Fn
				Image?:       *string | fn.#Fn
				ImageConfig?: *{
					RepositoryAccessMode:  *string | fn.#Fn
					RepositoryAuthConfig?: *{
						RepositoryCredentialsProviderArn: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				InferenceSpecificationName?: *string | fn.#Fn
				Mode?:                       *string | fn.#Fn
				ModelDataUrl?:               *string | fn.#Fn
				ModelPackageName?:           *string | fn.#Fn
				MultiModelConfig?:           *{
					ModelCacheSetting?: *string | fn.#Fn
				} | fn.#If
			}] | fn.#If
			EnableNetworkIsolation?:   *bool | fn.#Fn
			ExecutionRoleArn:          *string | fn.#Fn
			InferenceExecutionConfig?: *{
				Mode: *string | fn.#Fn
			} | fn.#If
			ModelName?:        *string | fn.#Fn
			PrimaryContainer?: *{
				ContainerHostname?: *string | fn.#Fn
				Environment?:       *{
					[string]: _
				} | fn.#Fn
				Image?:       *string | fn.#Fn
				ImageConfig?: *{
					RepositoryAccessMode:  *string | fn.#Fn
					RepositoryAuthConfig?: *{
						RepositoryCredentialsProviderArn: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				InferenceSpecificationName?: *string | fn.#Fn
				Mode?:                       *string | fn.#Fn
				ModelDataUrl?:               *string | fn.#Fn
				ModelPackageName?:           *string | fn.#Fn
				MultiModelConfig?:           *{
					ModelCacheSetting?: *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcConfig?: *{
				SecurityGroupIds: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Subnets:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NotebookInstance: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?:                     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			AdditionalCodeRepositories?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			DefaultCodeRepository?:                *string | fn.#Fn
			DirectInternetAccess?:                 *string | fn.#Fn
			InstanceMetadataServiceConfiguration?: *{
				MinimumInstanceMetadataServiceVersion: *string | fn.#Fn
			} | fn.#If
			InstanceType:          *string | fn.#Fn
			KmsKeyId?:             *string | fn.#Fn
			LifecycleConfigName?:  *string | fn.#Fn
			NotebookInstanceName?: *string | fn.#Fn
			PlatformIdentifier?:   *string | fn.#Fn
			RoleArn:               *string | fn.#Fn
			RootAccess?:           *string | fn.#Fn
			SecurityGroupIds?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SubnetId?:             *string | fn.#Fn
			Tags?:                 *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VolumeSizeInGB?: *(>=5 & <=16384) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NotebookInstanceLifecycleConfig: {
		Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: {
			NotebookInstanceLifecycleConfigName?: *string | fn.#Fn
			OnCreate?:                            *[...{
				Content?: *string | fn.#Fn
			}] | fn.#If
			OnStart?: *[...{
				Content?: *string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workteam: {
		Type: "AWS::SageMaker::Workteam"
		Properties: {
			Description?:       *string | fn.#Fn
			MemberDefinitions?: *[...{
				CognitoMemberDefinition?: *{
					CognitoClientId:  *string | fn.#Fn
					CognitoUserGroup: *string | fn.#Fn
					CognitoUserPool:  *string | fn.#Fn
				} | fn.#If
				OidcMemberDefinition?: *{
					OidcGroups: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
			}] | fn.#If
			NotificationConfiguration?: *{
				NotificationTopicArn: *string | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			WorkforceName?: *string | fn.#Fn
			WorkteamName?:  *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
