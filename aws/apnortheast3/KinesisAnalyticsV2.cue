package apnortheast3

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
				VpcConfigurations?: *[...{
					SecurityGroupIds: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					SubnetIds:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				}] | fn.#If
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
			ApplicationDescription?:              *string | fn.#Fn
			ApplicationMaintenanceConfiguration?: *{
				ApplicationMaintenanceWindowStartTime: *(=~#"^([01][0-9]|2[0-3]):[0-5][0-9]$"#) | fn.#Fn
			} | fn.#If
			ApplicationMode?:  *("INTERACTIVE" | "STREAMING") | fn.#Fn
			ApplicationName?:  *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
			RunConfiguration?: *{
				ApplicationRestoreConfiguration?: *{
					ApplicationRestoreType: *("SKIP_RESTORE_FROM_SNAPSHOT" | "RESTORE_FROM_LATEST_SNAPSHOT" | "RESTORE_FROM_CUSTOM_SNAPSHOT") | fn.#Fn
					SnapshotName?:          *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.#Fn
				} | fn.#If
				FlinkRunConfiguration?: *{
					AllowNonRestoredState?: *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			RuntimeEnvironment:   *("FLINK-1_11" | "FLINK-1_13" | "FLINK-1_6" | "FLINK-1_8" | "SQL-1_0" | "ZEPPELIN-FLINK-1_0" | "ZEPPELIN-FLINK-2_0") | fn.#Fn
			ServiceExecutionRole: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:.*$"#)) | fn.#Fn
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
}
