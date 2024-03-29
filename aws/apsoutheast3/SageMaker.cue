package apsoutheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SageMaker: {
	#App: {
		Type: "AWS::SageMaker::App"
		Properties: {
			AppName:       *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.#Fn
			AppType:       *("JupyterServer" | "KernelGateway" | "RStudioServerPro" | "RSessionGateway" | "Canvas") | fn.#Fn
			DomainId:      *(strings.MinRunes(1) & strings.MaxRunes(63)) | fn.#Fn
			ResourceSpec?: *{
				InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge" | "ml.r5.large" | "ml.r5.xlarge" | "ml.r5.2xlarge" | "ml.r5.4xlarge" | "ml.r5.8xlarge" | "ml.r5.12xlarge" | "ml.r5.16xlarge" | "ml.r5.24xlarge" | "ml.p3dn.24xlarge" | "ml.m5d.large" | "ml.m5d.xlarge" | "ml.m5d.2xlarge" | "ml.m5d.4xlarge" | "ml.m5d.8xlarge" | "ml.m5d.12xlarge" | "ml.m5d.16xlarge" | "ml.m5d.24xlarge" | "ml.g5.xlarge" | "ml.g5.2xlarge" | "ml.g5.4xlarge" | "ml.g5.8xlarge" | "ml.g5.12xlarge" | "ml.g5.16xlarge" | "ml.g5.24xlarge" | "ml.g5.48xlarge") | fn.#Fn
				SageMakerImageArn?:        *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#)) | fn.#Fn
				SageMakerImageVersionArn?: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#)) | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UserProfileName: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AppImageConfig: {
		Type: "AWS::SageMaker::AppImageConfig"
		Properties: {
			AppImageConfigName:        *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.#Fn
			KernelGatewayImageConfig?: *{
				FileSystemConfig?: *{
					DefaultGid?: *int | fn.#Fn
					DefaultUid?: *int | fn.#Fn
					MountPath?:  *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^/.*"#)) | fn.#Fn
				} | fn.#If
				KernelSpecs: *[...{
					DisplayName?: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					Name:         *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
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
	#Domain: {
		Type: "AWS::SageMaker::Domain"
		Properties: {
			AppNetworkAccessType?:       *("PublicInternetOnly" | "VpcOnly") | fn.#Fn
			AppSecurityGroupManagement?: *("Service" | "Customer") | fn.#Fn
			AuthMode:                    *("SSO" | "IAM") | fn.#Fn
			DefaultUserSettings:         *{
				ExecutionRole?:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
				JupyterServerAppSettings?: *{
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						LifecycleConfigArn?:       *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				KernelGatewayAppSettings?: *{
					CustomImages?: *[...{
						AppImageConfigName:  *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
						ImageName:           *(=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9]){0,62}$"#) | fn.#Fn
						ImageVersionNumber?: *int | fn.#Fn
					}] | fn.#If
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						LifecycleConfigArn?:       *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				RSessionAppSettings?: *{
					CustomImages?: *[...{
						AppImageConfigName:  *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
						ImageName:           *(=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9]){0,62}$"#) | fn.#Fn
						ImageVersionNumber?: *int | fn.#Fn
					}] | fn.#If
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						LifecycleConfigArn?:       *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				RStudioServerProAppSettings?: *{
					AccessStatus?: *("ENABLED" | "DISABLED") | fn.#Fn
					UserGroup?:    *("R_STUDIO_ADMIN" | "R_STUDIO_USER") | fn.#Fn
				} | fn.#If
				SecurityGroups?:  [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				SharingSettings?: *{
					NotebookOutputOption?: *("Allowed" | "Disabled") | fn.#Fn
					S3KmsKeyId?:           *(=~#".*"#) | fn.#Fn
					S3OutputPath?:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			DomainName:      *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
			DomainSettings?: *{
				RStudioServerProDomainSettings?: *{
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						LifecycleConfigArn?:       *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
					DomainExecutionRoleArn:    *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
					RStudioConnectUrl?:        *(=~#"^(https:|http:|www\.)\S*"#) | fn.#Fn
					RStudioPackageManagerUrl?: *(=~#"^(https:|http:|www\.)\S*"#) | fn.#Fn
				} | fn.#If
				SecurityGroupIds?: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
			} | fn.#If
			KmsKeyId?: *(=~#".*"#) | fn.#Fn
			SubnetIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
			Tags?:     *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId: *(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn
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
	#UserProfile: {
		Type: "AWS::SageMaker::UserProfile"
		Properties: {
			DomainId:                    *(strings.MinRunes(1) & strings.MaxRunes(63)) | fn.#Fn
			SingleSignOnUserIdentifier?: *(=~#"UserName"#) | fn.#Fn
			SingleSignOnUserValue?:      *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UserProfileName: *(strings.MinRunes(1) & strings.MaxRunes(63)) | fn.#Fn
			UserSettings?:   *{
				ExecutionRole?:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
				JupyterServerAppSettings?: *{
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				KernelGatewayAppSettings?: *{
					CustomImages?: *[...{
						AppImageConfigName:  *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
						ImageName:           *(=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9]){0,62}$"#) | fn.#Fn
						ImageVersionNumber?: *int | fn.#Fn
					}] | fn.#If
					DefaultResourceSpec?: *{
						InstanceType?:             *("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.#Fn
						SageMakerImageArn?:        *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.#Fn
						SageMakerImageVersionArn?: *(=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				RStudioServerProAppSettings?: *{
					AccessStatus?: *("ENABLED" | "DISABLED") | fn.#Fn
					UserGroup?:    *("R_STUDIO_ADMIN" | "R_STUDIO_USER") | fn.#Fn
				} | fn.#If
				SecurityGroups?:  [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				SharingSettings?: *{
					NotebookOutputOption?: *("Allowed" | "Disabled") | fn.#Fn
					S3KmsKeyId?:           *(=~#".*"#) | fn.#Fn
					S3OutputPath?:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
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
