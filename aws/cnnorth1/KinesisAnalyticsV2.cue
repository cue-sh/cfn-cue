package cnnorth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#KinesisAnalyticsV2: {
	#Application: {
		Type: "AWS::KinesisAnalyticsV2::Application"
		Properties: {
			ApplicationConfiguration?: *{
				ApplicationCodeConfiguration?: *{
					CodeContent: *{
						S3ContentLocation?: *{
							BucketARN:      *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
							FileKey:        *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
							ObjectVersion?: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
						} | fn.#If
						TextContent?:    *(strings.MinRunes(1) & strings.MaxRunes(102400)) | fn.#Fn
						ZipFileContent?: *string | fn.#Fn
					} | fn.#If
					CodeContentType: *("PLAINTEXT" | "ZIPFILE") | fn.#Fn
				} | fn.#If
				ApplicationSnapshotConfiguration?: *{
					SnapshotsEnabled: *bool | fn.#Fn
				} | fn.#If
				EnvironmentProperties?: *{
					PropertyGroups?: *[...{
						PropertyGroupId?: *(strings.MinRunes(1) & strings.MaxRunes(50) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
						PropertyMap?:     *{
							[string]: *string | fn.#Fn
						} | fn.#If
					}] | fn.#If
				} | fn.#If
				FlinkApplicationConfiguration?: *{
					CheckpointConfiguration?: *{
						CheckpointInterval?:         *(>=1 & <=9223372036854776000) | fn.#Fn
						CheckpointingEnabled?:       *bool | fn.#Fn
						ConfigurationType:           *("DEFAULT" | "CUSTOM") | fn.#Fn
						MinPauseBetweenCheckpoints?: *int | fn.#Fn
					} | fn.#If
					MonitoringConfiguration?: *{
						ConfigurationType: *("DEFAULT" | "CUSTOM") | fn.#Fn
						LogLevel?:         *("DEBUG" | "INFO" | "WARN" | "ERROR") | fn.#Fn
						MetricsLevel?:     *("APPLICATION" | "OPERATOR" | "PARALLELISM" | "TASK") | fn.#Fn
					} | fn.#If
					ParallelismConfiguration?: *{
						AutoScalingEnabled?: *bool | fn.#Fn
						ConfigurationType:   *("CUSTOM" | "DEFAULT") | fn.#Fn
						Parallelism?:        *int | fn.#Fn
						ParallelismPerKPU?:  *int | fn.#Fn
					} | fn.#If
				} | fn.#If
				SqlApplicationConfiguration?: *{
					Inputs?: *[...{
						InputParallelism?: *{
							Count?: *(>=1 & <=64) | fn.#Fn
						} | fn.#If
						InputProcessingConfiguration?: *{
							InputLambdaProcessor?: *{
								ResourceARN: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
							} | fn.#If
						} | fn.#If
						InputSchema: *{
							RecordColumns: *[...{
								Mapping?: *(strings.MinRunes(1) & strings.MaxRunes(65535)) | fn.#Fn
								Name:     *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[^-\s<>&]*$"#)) | fn.#Fn
								SqlType:  *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
							}] | fn.#If
							RecordEncoding?: *("UTF-8") | fn.#Fn
							RecordFormat:    *{
								MappingParameters?: *{
									CSVMappingParameters?: *{
										RecordColumnDelimiter: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
										RecordRowDelimiter:    *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
									} | fn.#If
									JSONMappingParameters?: *{
										RecordRowPath: *(strings.MinRunes(1) & strings.MaxRunes(65535) & (=~#"^(?=^\$)(?=^\S+$).*$"#)) | fn.#Fn
									} | fn.#If
								} | fn.#If
								RecordFormatType: *("CSV" | "JSON") | fn.#Fn
							} | fn.#If
						} | fn.#If
						KinesisFirehoseInput?: *{
							ResourceARN: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
						} | fn.#If
						KinesisStreamsInput?: *{
							ResourceARN: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
						} | fn.#If
						NamePrefix: *(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[^-\s<>&]*$"#)) | fn.#Fn
					}] | fn.#If
				} | fn.#If
				ZeppelinApplicationConfiguration?: *{
					CatalogConfiguration?: *{
						GlueDataCatalogConfiguration?: *{
							DatabaseARN?: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
						} | fn.#If
					} | fn.#If
					CustomArtifactsConfiguration?: *[...{
						ArtifactType:    *("DEPENDENCY_JAR" | "UDF") | fn.#Fn
						MavenReference?: *{
							ArtifactId: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
							GroupId:    *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
							Version:    *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
						} | fn.#If
						S3ContentLocation?: *{
							BucketARN:      *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
							FileKey:        *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
							ObjectVersion?: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
						} | fn.#If
					}] | fn.#If
					DeployAsApplicationConfiguration?: *{
						S3ContentLocation: *{
							BasePath?: *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^[a-zA-Z0-9/!-_.*'()]+$"#)) | fn.#Fn
							BucketARN: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
						} | fn.#If
					} | fn.#If
					MonitoringConfiguration?: *{
						LogLevel?: *("DEBUG" | "INFO" | "WARN" | "ERROR") | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			ApplicationDescription?: *string | fn.#Fn
			ApplicationMode?:        *("INTERACTIVE" | "STREAMING") | fn.#Fn
			ApplicationName?:        *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
			RuntimeEnvironment:      *("FLINK-1_11" | "FLINK-1_13" | "FLINK-1_6" | "FLINK-1_8" | "SQL-1_0" | "ZEPPELIN-FLINK-1_0" | "ZEPPELIN-FLINK-2_0") | fn.#Fn
			ServiceExecutionRole:    *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
			Tags?:                   *[...{
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
	#ApplicationCloudWatchLoggingOption: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName:         *string | fn.#Fn
			CloudWatchLoggingOption: *{
				LogStreamARN: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ApplicationOutput: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: *string | fn.#Fn
			Output:          *{
				DestinationSchema: *{
					RecordFormatType?: *string | fn.#Fn
				} | fn.#If
				KinesisFirehoseOutput?: *{
					ResourceARN: *string | fn.#Fn
				} | fn.#If
				KinesisStreamsOutput?: *{
					ResourceARN: *string | fn.#Fn
				} | fn.#If
				LambdaOutput?: *{
					ResourceARN: *string | fn.#Fn
				} | fn.#If
				Name?: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ApplicationReferenceDataSource: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName:     *string | fn.#Fn
			ReferenceDataSource: *{
				ReferenceSchema: *{
					RecordColumns: *[...{
						Mapping?: *string | fn.#Fn
						Name:     *string | fn.#Fn
						SqlType:  *string | fn.#Fn
					}] | fn.#If
					RecordEncoding?: *string | fn.#Fn
					RecordFormat:    *{
						MappingParameters?: *{
							CSVMappingParameters?: *{
								RecordColumnDelimiter: *string | fn.#Fn
								RecordRowDelimiter:    *string | fn.#Fn
							} | fn.#If
							JSONMappingParameters?: *{
								RecordRowPath: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						RecordFormatType: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				S3ReferenceDataSource?: *{
					BucketARN: *string | fn.#Fn
					FileKey:   *string | fn.#Fn
				} | fn.#If
				TableName?: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
