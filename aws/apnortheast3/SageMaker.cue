package apnortheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

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
				EndpointInput: *{
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
			KmsKeyId?:           *string | fn.#Fn
			ProductionVariants:  *[...{
				AcceleratorType?:     *string | fn.#Fn
				InitialInstanceCount: *int | fn.#Fn
				InitialVariantWeight: *number | fn.#Fn
				InstanceType:         *string | fn.#Fn
				ModelName:            *string | fn.#Fn
				VariantName:          *string | fn.#Fn
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
				Mode?:             *string | fn.#Fn
				ModelDataUrl?:     *string | fn.#Fn
				ModelPackageName?: *string | fn.#Fn
				MultiModelConfig?: *{
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
				Mode?:             *string | fn.#Fn
				ModelDataUrl?:     *string | fn.#Fn
				ModelPackageName?: *string | fn.#Fn
				MultiModelConfig?: *{
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
				ConfigUri:    *(=~#".*"#) | fn.#Fn
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
				EndpointInput: *{
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
				ConfigUri:    *(=~#".*"#) | fn.#Fn
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
				EndpointInput: *{
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
				EndpointInput: *{
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
						EndpointInput: *{
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
			AcceleratorTypes?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			AdditionalCodeRepositories?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			DefaultCodeRepository?:      *string | fn.#Fn
			DirectInternetAccess?:       *string | fn.#Fn
			InstanceType:                *string | fn.#Fn
			KmsKeyId?:                   *string | fn.#Fn
			LifecycleConfigName?:        *string | fn.#Fn
			NotebookInstanceName?:       *string | fn.#Fn
			RoleArn:                     *string | fn.#Fn
			RootAccess?:                 *string | fn.#Fn
			SecurityGroupIds?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SubnetId?:                   *string | fn.#Fn
			Tags?:                       *[...{
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
}
