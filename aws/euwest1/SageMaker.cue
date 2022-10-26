package euwest1

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
	#DataQualityJobDefinition: {
		Type: "AWS::SageMaker::DataQualityJobDefinition"
		Properties: {
			DataQualityAppSpecification: *{
				ContainerArguments?:  [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
				ContainerEntrypoint?: [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
				Environment?:         *{
					[string]: *string | fn.#Fn
				} | fn.#If
				ImageUri:                         *(=~#".*"#) | fn.#Fn
				PostAnalyticsProcessorSourceUri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				RecordPreprocessorSourceUri?:     *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
			} | fn.#If
			DataQualityBaselineConfig?: *{
				BaseliningJobName?:   *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				ConstraintsResource?: *{
					S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
				StatisticsResource?: *{
					S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			DataQualityJobInput: *{
				BatchTransformInput?: *{
					DataCapturedDestinationS3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					DatasetFormat:                *{
						Csv?: *{
							Header?: *bool | fn.#Fn
						} | fn.#If
						Json?: *{
							Line?: *bool | fn.#Fn
						} | fn.#If
						Parquet?: *bool | fn.#Fn
					} | fn.#If
					LocalPath:               *(=~#".*"#) | fn.#Fn
					S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:            *("Pipe" | "File") | fn.#Fn
				} | fn.#If
				EndpointInput?: *{
					EndpointName:            *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
					LocalPath:               *(=~#".*"#) | fn.#Fn
					S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:            *("Pipe" | "File") | fn.#Fn
				} | fn.#If
			} | fn.#If
			DataQualityJobOutputConfig: *{
				KmsKeyId?:         *(=~#".*"#) | fn.#Fn
				MonitoringOutputs: *[...{
					S3Output: *{
						LocalPath:     *(=~#".*"#) | fn.#Fn
						S3UploadMode?: *("Continuous" | "EndOfJob") | fn.#Fn
						S3Uri:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			EndpointName?:      *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
			JobDefinitionName?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			JobResources:       *{
				ClusterConfig: *{
					InstanceCount:   *(>=1 & <=100) | fn.#Fn
					InstanceType:    *string | fn.#Fn
					VolumeKmsKeyId?: *string | fn.#Fn
					VolumeSizeInGB:  *(>=1 & <=16384) | fn.#Fn
				} | fn.#If
			} | fn.#If
			NetworkConfig?: *{
				EnableInterContainerTrafficEncryption?: *bool | fn.#Fn
				EnableNetworkIsolation?:                *bool | fn.#Fn
				VpcConfig?:                             *{
					SecurityGroupIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
					Subnets:          [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			StoppingCondition?: *{
				MaxRuntimeInSeconds: *(>=1 & <=86400) | fn.#Fn
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
	#Device: {
		Type: "AWS::SageMaker::Device"
		Properties: {
			Device?: *{
				Description?:  *(strings.MinRunes(1) & strings.MaxRunes(40) & (=~#"[\S\s]+"#)) | fn.#Fn
				DeviceName:    *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				IotThingName?: *(=~#"[a-zA-Z0-9:_-]+"#) | fn.#Fn
			} | fn.#If
			DeviceFleetName: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$"#)) | fn.#Fn
			Tags?:           *[...{
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
	#DeviceFleet: {
		Type: "AWS::SageMaker::DeviceFleet"
		Properties: {
			Description?:    *(=~#"[\S\s]+"#) | fn.#Fn
			DeviceFleetName: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*_*[a-zA-Z0-9])*$"#)) | fn.#Fn
			OutputConfig:    *{
				KmsKeyId?:        *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.#Fn
				S3OutputLocation: *(=~#"^s3://([^/]+)/?(.*)$"#) | fn.#Fn
			} | fn.#If
			RoleArn: *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			Tags?:   *[...{
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
	#FeatureGroup: {
		Type: "AWS::SageMaker::FeatureGroup"
		Properties: {
			Description?:         *string | fn.#Fn
			EventTimeFeatureName: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.#Fn
			FeatureDefinitions:   *[...{
				FeatureName: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.#Fn
				FeatureType: *("Integral" | "Fractional" | "String") | fn.#Fn
			}] | fn.#If
			FeatureGroupName:    *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.#Fn
			OfflineStoreConfig?: *{
				[string]: _
			} | fn.#Fn
			OnlineStoreConfig?: *{
				[string]: _
			} | fn.#Fn
			RecordIdentifierFeatureName: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.#Fn
			RoleArn?:                    *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
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
	#Image: {
		Type: "AWS::SageMaker::Image"
		Properties: {
			ImageDescription?: *(strings.MinRunes(1) & strings.MaxRunes(512) & (=~#".+"#)) | fn.#Fn
			ImageDisplayName?: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[A-Za-z0-9 -_]+$"#)) | fn.#Fn
			ImageName:         *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9])*$"#)) | fn.#Fn
			ImageRoleArn:      *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:iam::[0-9]{12}:role/.*$"#)) | fn.#Fn
			Tags?:             *[...{
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
	#ImageVersion: {
		Type: "AWS::SageMaker::ImageVersion"
		Properties: {
			BaseImage: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#".+"#)) | fn.#Fn
			ImageName: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[A-Za-z0-9]([-.]?[A-Za-z0-9])*$"#)) | fn.#Fn
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
	#ModelBiasJobDefinition: {
		Type: "AWS::SageMaker::ModelBiasJobDefinition"
		Properties: {
			EndpointName?:      *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
			JobDefinitionName?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			JobResources:       *{
				ClusterConfig: *{
					InstanceCount:   *(>=1 & <=100) | fn.#Fn
					InstanceType:    *string | fn.#Fn
					VolumeKmsKeyId?: *string | fn.#Fn
					VolumeSizeInGB:  *(>=1 & <=16384) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasAppSpecification: *{
				ConfigUri:    *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				Environment?: *{
					[string]: *string | fn.#Fn
				} | fn.#If
				ImageUri: *(=~#".*"#) | fn.#Fn
			} | fn.#If
			ModelBiasBaselineConfig?: *{
				BaseliningJobName?:   *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				ConstraintsResource?: *{
					S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasJobInput: *{
				BatchTransformInput?: *{
					DataCapturedDestinationS3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					DatasetFormat:                *{
						Csv?: *{
							Header?: *bool | fn.#Fn
						} | fn.#If
						Json?: *{
							Line?: *bool | fn.#Fn
						} | fn.#If
						Parquet?: *bool | fn.#Fn
					} | fn.#If
					EndTimeOffset?:                 *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
					FeaturesAttribute?:             *string | fn.#Fn
					InferenceAttribute?:            *string | fn.#Fn
					LocalPath:                      *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:          *string | fn.#Fn
					ProbabilityThresholdAttribute?: *number | fn.#Fn
					S3DataDistributionType?:        *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:                   *("Pipe" | "File") | fn.#Fn
					StartTimeOffset?:               *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
				} | fn.#If
				EndpointInput?: *{
					EndTimeOffset?:                 *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
					EndpointName:                   *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
					FeaturesAttribute?:             *string | fn.#Fn
					InferenceAttribute?:            *string | fn.#Fn
					LocalPath:                      *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:          *string | fn.#Fn
					ProbabilityThresholdAttribute?: *number | fn.#Fn
					S3DataDistributionType?:        *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:                   *("Pipe" | "File") | fn.#Fn
					StartTimeOffset?:               *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
				} | fn.#If
				GroundTruthS3Input: *{
					S3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasJobOutputConfig: *{
				KmsKeyId?:         *(=~#".*"#) | fn.#Fn
				MonitoringOutputs: *[...{
					S3Output: *{
						LocalPath:     *(=~#".*"#) | fn.#Fn
						S3UploadMode?: *("Continuous" | "EndOfJob") | fn.#Fn
						S3Uri:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: *{
				EnableInterContainerTrafficEncryption?: *bool | fn.#Fn
				EnableNetworkIsolation?:                *bool | fn.#Fn
				VpcConfig?:                             *{
					SecurityGroupIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
					Subnets:          [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			StoppingCondition?: *{
				MaxRuntimeInSeconds: *(>=1 & <=86400) | fn.#Fn
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
	#ModelExplainabilityJobDefinition: {
		Type: "AWS::SageMaker::ModelExplainabilityJobDefinition"
		Properties: {
			EndpointName?:      *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
			JobDefinitionName?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			JobResources:       *{
				ClusterConfig: *{
					InstanceCount:   *(>=1 & <=100) | fn.#Fn
					InstanceType:    *string | fn.#Fn
					VolumeKmsKeyId?: *string | fn.#Fn
					VolumeSizeInGB:  *(>=1 & <=16384) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityAppSpecification: *{
				ConfigUri:    *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				Environment?: *{
					[string]: *string | fn.#Fn
				} | fn.#If
				ImageUri: *(=~#".*"#) | fn.#Fn
			} | fn.#If
			ModelExplainabilityBaselineConfig?: *{
				BaseliningJobName?:   *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				ConstraintsResource?: *{
					S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityJobInput: *{
				BatchTransformInput?: *{
					DataCapturedDestinationS3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					DatasetFormat:                *{
						Csv?: *{
							Header?: *bool | fn.#Fn
						} | fn.#If
						Json?: *{
							Line?: *bool | fn.#Fn
						} | fn.#If
						Parquet?: *bool | fn.#Fn
					} | fn.#If
					FeaturesAttribute?:      *string | fn.#Fn
					InferenceAttribute?:     *string | fn.#Fn
					LocalPath:               *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:   *string | fn.#Fn
					S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:            *("Pipe" | "File") | fn.#Fn
				} | fn.#If
				EndpointInput?: *{
					EndpointName:            *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
					FeaturesAttribute?:      *string | fn.#Fn
					InferenceAttribute?:     *string | fn.#Fn
					LocalPath:               *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:   *string | fn.#Fn
					S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:            *("Pipe" | "File") | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityJobOutputConfig: *{
				KmsKeyId?:         *(=~#".*"#) | fn.#Fn
				MonitoringOutputs: *[...{
					S3Output: *{
						LocalPath:     *(=~#".*"#) | fn.#Fn
						S3UploadMode?: *("Continuous" | "EndOfJob") | fn.#Fn
						S3Uri:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: *{
				EnableInterContainerTrafficEncryption?: *bool | fn.#Fn
				EnableNetworkIsolation?:                *bool | fn.#Fn
				VpcConfig?:                             *{
					SecurityGroupIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
					Subnets:          [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			StoppingCondition?: *{
				MaxRuntimeInSeconds: *(>=1 & <=86400) | fn.#Fn
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
	#ModelPackage: {
		Type: "AWS::SageMaker::ModelPackage"
		Properties: {
			AdditionalInferenceSpecificationDefinition?: *{
				Containers: *[...{
					ContainerHostname?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
					Environment?:       *{} | fn.#If
					Framework?:         *string | fn.#Fn
					FrameworkVersion?:  *(strings.MinRunes(3) & strings.MaxRunes(10) & (=~#"[0-9]\.[A-Za-z0-9.]+"#)) | fn.#Fn
					Image:              *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[\S]{1,255}"#)) | fn.#Fn
					ImageDigest?:       *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
					ModelDataUrl?:      *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					ModelInput?:        *{
						[string]: _
					} | fn.#Fn
					NearestModelName?: *string | fn.#Fn
					ProductId?:        *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
				}] | fn.#If
				Description?:                             *(=~#".*"#) | fn.#Fn
				Name:                                     *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
				SupportedContentTypes?:                   [...(*(=~#".*"#) | fn.#Fn)] | (*(=~#".*"#) | fn.#Fn)
				SupportedRealtimeInferenceInstanceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SupportedResponseMIMETypes?:              [...(*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)] | (*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)
				SupportedTransformInstanceTypes?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			AdditionalInferenceSpecifications?: *[...{
				Containers: *[...{
					ContainerHostname?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
					Environment?:       *{} | fn.#If
					Framework?:         *string | fn.#Fn
					FrameworkVersion?:  *(strings.MinRunes(3) & strings.MaxRunes(10) & (=~#"[0-9]\.[A-Za-z0-9.]+"#)) | fn.#Fn
					Image:              *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[\S]{1,255}"#)) | fn.#Fn
					ImageDigest?:       *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
					ModelDataUrl?:      *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					ModelInput?:        *{
						[string]: _
					} | fn.#Fn
					NearestModelName?: *string | fn.#Fn
					ProductId?:        *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
				}] | fn.#If
				Description?:                             *(=~#".*"#) | fn.#Fn
				Name:                                     *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
				SupportedContentTypes?:                   [...(*(=~#".*"#) | fn.#Fn)] | (*(=~#".*"#) | fn.#Fn)
				SupportedRealtimeInferenceInstanceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SupportedResponseMIMETypes?:              [...(*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)] | (*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)
				SupportedTransformInstanceTypes?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			AdditionalInferenceSpecificationsToAdd?: *[...{
				Containers: *[...{
					ContainerHostname?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
					Environment?:       *{} | fn.#If
					Framework?:         *string | fn.#Fn
					FrameworkVersion?:  *(strings.MinRunes(3) & strings.MaxRunes(10) & (=~#"[0-9]\.[A-Za-z0-9.]+"#)) | fn.#Fn
					Image:              *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[\S]{1,255}"#)) | fn.#Fn
					ImageDigest?:       *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
					ModelDataUrl?:      *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					ModelInput?:        *{
						[string]: _
					} | fn.#Fn
					NearestModelName?: *string | fn.#Fn
					ProductId?:        *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
				}] | fn.#If
				Description?:                             *(=~#".*"#) | fn.#Fn
				Name:                                     *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
				SupportedContentTypes?:                   [...(*(=~#".*"#) | fn.#Fn)] | (*(=~#".*"#) | fn.#Fn)
				SupportedRealtimeInferenceInstanceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SupportedResponseMIMETypes?:              [...(*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)] | (*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)
				SupportedTransformInstanceTypes?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			ApprovalDescription?:   *(=~#".*"#) | fn.#Fn
			CertifyForMarketplace?: *bool | fn.#Fn
			ClientToken?:           *(strings.MinRunes(1) & strings.MaxRunes(36) & (=~#"^[a-zA-Z0-9-]+$"#)) | fn.#Fn
			CreatedBy?:             *{
				DomainId?:        *string | fn.#Fn
				UserProfileArn?:  *string | fn.#Fn
				UserProfileName?: *string | fn.#Fn
			} | fn.#If
			CustomerMetadataProperties?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			Domain?:              *string | fn.#Fn
			DriftCheckBaselines?: *{
				Bias?: *{
					ConfigFile?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType?:   *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					PostTrainingConstraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					PreTrainingConstraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				Explainability?: *{
					ConfigFile?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType?:   *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Constraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ModelDataQuality?: *{
					Constraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Statistics?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ModelQuality?: *{
					Constraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Statistics?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Environment?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			InferenceSpecification?: *{
				Containers: *[...{
					ContainerHostname?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.#Fn
					Environment?:       *{} | fn.#If
					Framework?:         *string | fn.#Fn
					FrameworkVersion?:  *(strings.MinRunes(3) & strings.MaxRunes(10) & (=~#"[0-9]\.[A-Za-z0-9.]+"#)) | fn.#Fn
					Image:              *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[\S]{1,255}"#)) | fn.#Fn
					ImageDigest?:       *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
					ModelDataUrl?:      *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					ModelInput?:        *{
						[string]: _
					} | fn.#Fn
					NearestModelName?: *string | fn.#Fn
					ProductId?:        *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
				}] | fn.#If
				SupportedContentTypes:                    [...(*(=~#".*"#) | fn.#Fn)] | (*(=~#".*"#) | fn.#Fn)
				SupportedRealtimeInferenceInstanceTypes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SupportedResponseMIMETypes:               [...(*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)] | (*(=~#"^[-\w]+\/.+$"#) | fn.#Fn)
				SupportedTransformInstanceTypes?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			LastModifiedBy?: *{
				DomainId?:        *string | fn.#Fn
				UserProfileArn?:  *string | fn.#Fn
				UserProfileName?: *string | fn.#Fn
			} | fn.#If
			LastModifiedTime?:   *string | fn.#Fn
			MetadataProperties?: *{
				CommitId?:    *(=~#".*"#) | fn.#Fn
				GeneratedBy?: *(=~#".*"#) | fn.#Fn
				ProjectId?:   *(=~#".*"#) | fn.#Fn
				Repository?:  *(=~#".*"#) | fn.#Fn
			} | fn.#If
			ModelApprovalStatus?: *("Approved" | "Rejected" | "PendingManualApproval") | fn.#Fn
			ModelMetrics?:        *{
				Bias?: *{
					PostTrainingReport?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					PreTrainingReport?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Report?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				Explainability?: *{
					Report?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ModelDataQuality?: *{
					Constraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Statistics?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ModelQuality?: *{
					Constraints?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					Statistics?: *{
						ContentDigest?: *(=~#"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$"#) | fn.#Fn
						ContentType:    *(=~#".*"#) | fn.#Fn
						S3Uri:          *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			ModelPackageDescription?:   *string | fn.#Fn
			ModelPackageGroupName?:     *(strings.MinRunes(1) & strings.MaxRunes(170) & (=~#"(arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:[a-z\-]*\/)?([a-zA-Z0-9]([a-zA-Z0-9-]){0,62})(?<!-)$"#)) | fn.#Fn
			ModelPackageName?:          *string | fn.#Fn
			ModelPackageStatusDetails?: *{
				ImageScanStatuses?: *[...{
					FailureReason?: *string | fn.#Fn
					Name:           *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
					Status:         *("NotStarted" | "Failed" | "InProgress" | "Completed") | fn.#Fn
				}] | fn.#If
				ValidationStatuses: *[...{
					FailureReason?: *string | fn.#Fn
					Name:           *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
					Status:         *("NotStarted" | "Failed" | "InProgress" | "Completed") | fn.#Fn
				}] | fn.#If
			} | fn.#If
			ModelPackageStatusItem?: *{
				FailureReason?: *string | fn.#Fn
				Name:           *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
				Status:         *("NotStarted" | "Failed" | "InProgress" | "Completed") | fn.#Fn
			} | fn.#If
			ModelPackageVersion?:          *int | fn.#Fn
			SamplePayloadUrl?:             *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
			SourceAlgorithmSpecification?: *{
				SourceAlgorithms: *[...{
					AlgorithmName: *(strings.MinRunes(1) & strings.MaxRunes(170) & (=~#"(arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:[a-z\-]*\/)?([a-zA-Z0-9]([a-zA-Z0-9-]){0,62})(?<!-)$"#)) | fn.#Fn
					ModelDataUrl?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Tag?: *{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Task?:                    *string | fn.#Fn
			ValidationSpecification?: *{
				ValidationProfiles: *[...{
					ProfileName:            *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}$"#)) | fn.#Fn
					TransformJobDefinition: *{
						BatchStrategy?:           *("MultiRecord" | "SingleRecord") | fn.#Fn
						Environment?:             *{} | fn.#If
						MaxConcurrentTransforms?: *int | fn.#Fn
						MaxPayloadInMB?:          *int | fn.#Fn
						TransformInput:           *{
							CompressionType?: *("None" | "Gzip") | fn.#Fn
							ContentType?:     *(=~#".*"#) | fn.#Fn
							DataSource:       *{
								S3DataSource: *{
									S3DataType: *("ManifestFile" | "S3Prefix" | "AugmentedManifestFile") | fn.#Fn
									S3Uri:      *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
								} | fn.#If
							} | fn.#If
							SplitType?: *("None" | "TFRecord" | "Line" | "RecordIO") | fn.#Fn
						} | fn.#If
						TransformOutput: *{
							Accept?:       *(=~#".*"#) | fn.#Fn
							AssembleWith?: *("None" | "Line") | fn.#Fn
							KmsKeyId?:     *(=~#".*"#) | fn.#Fn
							S3OutputPath:  *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
						} | fn.#If
						TransformResources: *{
							InstanceCount:   *int | fn.#Fn
							InstanceType:    *string | fn.#Fn
							VolumeKmsKeyId?: *(=~#".*"#) | fn.#Fn
						} | fn.#If
					} | fn.#If
				}] | fn.#If
				ValidationRole: *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModelPackageGroup: {
		Type: "AWS::SageMaker::ModelPackageGroup"
		Properties: {
			ModelPackageGroupDescription?: *string | fn.#Fn
			ModelPackageGroupName:         *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			ModelPackageGroupPolicy?:      *{
				[string]: _
			} | fn.#Fn
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
	#ModelQualityJobDefinition: {
		Type: "AWS::SageMaker::ModelQualityJobDefinition"
		Properties: {
			EndpointName?:      *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
			JobDefinitionName?: *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			JobResources:       *{
				ClusterConfig: *{
					InstanceCount:   *(>=1 & <=100) | fn.#Fn
					InstanceType:    *string | fn.#Fn
					VolumeKmsKeyId?: *string | fn.#Fn
					VolumeSizeInGB:  *(>=1 & <=16384) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityAppSpecification: *{
				ContainerArguments?:  [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
				ContainerEntrypoint?: [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
				Environment?:         *{
					[string]: *string | fn.#Fn
				} | fn.#If
				ImageUri:                         *(=~#".*"#) | fn.#Fn
				PostAnalyticsProcessorSourceUri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				ProblemType:                      *("BinaryClassification" | "MulticlassClassification" | "Regression") | fn.#Fn
				RecordPreprocessorSourceUri?:     *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
			} | fn.#If
			ModelQualityBaselineConfig?: *{
				BaseliningJobName?:   *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				ConstraintsResource?: *{
					S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityJobInput: *{
				BatchTransformInput?: *{
					DataCapturedDestinationS3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					DatasetFormat:                *{
						Csv?: *{
							Header?: *bool | fn.#Fn
						} | fn.#If
						Json?: *{
							Line?: *bool | fn.#Fn
						} | fn.#If
						Parquet?: *bool | fn.#Fn
					} | fn.#If
					EndTimeOffset?:                 *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
					InferenceAttribute?:            *string | fn.#Fn
					LocalPath:                      *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:          *string | fn.#Fn
					ProbabilityThresholdAttribute?: *number | fn.#Fn
					S3DataDistributionType?:        *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:                   *("Pipe" | "File") | fn.#Fn
					StartTimeOffset?:               *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
				} | fn.#If
				EndpointInput?: *{
					EndTimeOffset?:                 *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
					EndpointName:                   *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
					InferenceAttribute?:            *string | fn.#Fn
					LocalPath:                      *(=~#".*"#) | fn.#Fn
					ProbabilityAttribute?:          *string | fn.#Fn
					ProbabilityThresholdAttribute?: *number | fn.#Fn
					S3DataDistributionType?:        *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
					S3InputMode?:                   *("Pipe" | "File") | fn.#Fn
					StartTimeOffset?:               *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.#Fn
				} | fn.#If
				GroundTruthS3Input: *{
					S3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityJobOutputConfig: *{
				KmsKeyId?:         *(=~#".*"#) | fn.#Fn
				MonitoringOutputs: *[...{
					S3Output: *{
						LocalPath:     *(=~#".*"#) | fn.#Fn
						S3UploadMode?: *("Continuous" | "EndOfJob") | fn.#Fn
						S3Uri:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: *{
				EnableInterContainerTrafficEncryption?: *bool | fn.#Fn
				EnableNetworkIsolation?:                *bool | fn.#Fn
				VpcConfig?:                             *{
					SecurityGroupIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
					Subnets:          [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			StoppingCondition?: *{
				MaxRuntimeInSeconds: *(>=1 & <=86400) | fn.#Fn
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
	#MonitoringSchedule: {
		Type: "AWS::SageMaker::MonitoringSchedule"
		Properties: {
			EndpointName?:                   *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
			FailureReason?:                  *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
			LastMonitoringExecutionSummary?: *{
				CreationTime:              *string | fn.#Fn
				EndpointName?:             *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
				FailureReason?:            *string | fn.#Fn
				LastModifiedTime:          *string | fn.#Fn
				MonitoringExecutionStatus: *("Pending" | "Completed" | "CompletedWithViolations" | "InProgress" | "Failed" | "Stopping" | "Stopped") | fn.#Fn
				MonitoringScheduleName:    *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
				ProcessingJobArn?:         *(=~#"aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:processing-job/.*"#) | fn.#Fn
				ScheduledTime:             *string | fn.#Fn
			} | fn.#If
			MonitoringScheduleConfig: *{
				MonitoringJobDefinition?: *{
					BaselineConfig?: *{
						ConstraintsResource?: *{
							S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
						} | fn.#If
						StatisticsResource?: *{
							S3Uri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
						} | fn.#If
					} | fn.#If
					Environment?: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					MonitoringAppSpecification: *{
						ContainerArguments?:              [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
						ContainerEntrypoint?:             [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
						ImageUri:                         *(=~#".*"#) | fn.#Fn
						PostAnalyticsProcessorSourceUri?: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
						RecordPreprocessorSourceUri?:     *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
					} | fn.#If
					MonitoringInputs: *[...{
						BatchTransformInput?: *{
							DataCapturedDestinationS3Uri: *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
							DatasetFormat:                *{
								Csv?: *{
									Header?: *bool | fn.#Fn
								} | fn.#If
								Json?: *{
									Line?: *bool | fn.#Fn
								} | fn.#If
								Parquet?: *bool | fn.#Fn
							} | fn.#If
							LocalPath:               *(=~#".*"#) | fn.#Fn
							S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
							S3InputMode?:            *("Pipe" | "File") | fn.#Fn
						} | fn.#If
						EndpointInput?: *{
							EndpointName:            *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.#Fn
							LocalPath:               *(=~#".*"#) | fn.#Fn
							S3DataDistributionType?: *("FullyReplicated" | "ShardedByS3Key") | fn.#Fn
							S3InputMode?:            *("Pipe" | "File") | fn.#Fn
						} | fn.#If
					}] | fn.#If
					MonitoringOutputConfig: *{
						KmsKeyId?:         *(=~#".*"#) | fn.#Fn
						MonitoringOutputs: *[...{
							S3Output: *{
								LocalPath:     *(=~#".*"#) | fn.#Fn
								S3UploadMode?: *("Continuous" | "EndOfJob") | fn.#Fn
								S3Uri:         *(=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.#Fn
							} | fn.#If
						}] | fn.#If
					} | fn.#If
					MonitoringResources: *{
						ClusterConfig: *{
							InstanceCount:   *(>=1 & <=100) | fn.#Fn
							InstanceType:    *string | fn.#Fn
							VolumeKmsKeyId?: *string | fn.#Fn
							VolumeSizeInGB:  *(>=1 & <=16384) | fn.#Fn
						} | fn.#If
					} | fn.#If
					NetworkConfig?: *{
						EnableInterContainerTrafficEncryption?: *bool | fn.#Fn
						EnableNetworkIsolation?:                *bool | fn.#Fn
						VpcConfig?:                             *{
							SecurityGroupIds: [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
							Subnets:          [...(*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)] | (*(=~#"[-0-9a-zA-Z]+"#) | fn.#Fn)
						} | fn.#If
					} | fn.#If
					RoleArn:            *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
					StoppingCondition?: *{
						MaxRuntimeInSeconds: *(>=1 & <=86400) | fn.#Fn
					} | fn.#If
				} | fn.#If
				MonitoringJobDefinitionName?: *(strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
				MonitoringType?:              *("DataQuality" | "ModelQuality" | "ModelBias" | "ModelExplainability") | fn.#Fn
				ScheduleConfig?:              *{
					ScheduleExpression: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
				} | fn.#If
			} | fn.#If
			MonitoringScheduleName:    *(=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.#Fn
			MonitoringScheduleStatus?: *("Pending" | "Failed" | "Scheduled" | "Stopped") | fn.#Fn
			Tags?:                     *[...{
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
	#Pipeline: {
		Type: "AWS::SageMaker::Pipeline"
		Properties: {
			ParallelismConfiguration?: *{
				[string]: _
			} | fn.#Fn
			PipelineDefinition: *{
				[string]: _
			} | fn.#Fn
			PipelineDescription?: *string | fn.#Fn
			PipelineDisplayName?: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#)) | fn.#Fn
			PipelineName:         *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#)) | fn.#Fn
			RoleArn:              *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.#Fn
			Tags?:                *[...{
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
	#Project: {
		Type: "AWS::SageMaker::Project"
		Properties: {
			ProjectDescription?:               *(=~#".*"#) | fn.#Fn
			ProjectName:                       *(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.#Fn
			ServiceCatalogProvisioningDetails: *{
				[string]: _
			} | fn.#Fn
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
