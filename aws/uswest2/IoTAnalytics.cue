package uswest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IoTAnalytics: {
	#Channel: {
		Type: "AWS::IoTAnalytics::Channel"
		Properties: {
			ChannelName?:    *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"(^(?!_{2}))(^[a-zA-Z0-9_]+$)"#)) | fn.#Fn
			ChannelStorage?: *{
				CustomerManagedS3?: *{
					Bucket:     *(strings.MinRunes(3) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9.\-_]*$"#)) | fn.#Fn
					KeyPrefix?: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9!_.*'()/{}:-]*/$"#)) | fn.#Fn
					RoleArn:    *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
				} | fn.#If
				ServiceManagedS3?: *{} | fn.#If
			} | fn.#If
			RetentionPeriod?: *{
				NumberOfDays?: *(>=1 & <=2147483647) | fn.#Fn
				Unlimited?:    *bool | fn.#Fn
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
	#Dataset: {
		Type: "AWS::IoTAnalytics::Dataset"
		Properties: {
			Actions: *[...{
				ActionName:       *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9_]+$"#)) | fn.#Fn
				ContainerAction?: *{
					ExecutionRoleArn:      *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
					Image:                 *string | fn.#Fn
					ResourceConfiguration: *{
						ComputeType:    *("ACU_1" | "ACU_2") | fn.#Fn
						VolumeSizeInGB: *(>=1 & <=50) | fn.#Fn
					} | fn.#If
					Variables?: *[...{
						DatasetContentVersionValue?: *{
							DatasetName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"(^(?!_{2}))(^[a-zA-Z0-9_]+$)"#)) | fn.#Fn
						} | fn.#If
						DoubleValue?:        *number | fn.#Fn
						OutputFileUriValue?: *{
							FileName: *(=~#"^[\w\.-]{1,255}$"#) | fn.#Fn
						} | fn.#If
						StringValue?: *string | fn.#Fn
						VariableName: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					}] | fn.#If
				} | fn.#If
				QueryAction?: *{
					Filters?: *[...{
						DeltaTime?: *{
							OffsetSeconds:  *int | fn.#Fn
							TimeExpression: *string | fn.#Fn
						} | fn.#If
					}] | fn.#If
					SqlQuery: *string | fn.#Fn
				} | fn.#If
			}] | fn.#If
			ContentDeliveryRules?: *[...{
				Destination: *{
					IotEventsDestinationConfiguration?: *{
						InputName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z][a-zA-Z0-9_]*$"#)) | fn.#Fn
						RoleArn:   *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
					} | fn.#If
					S3DestinationConfiguration?: *{
						Bucket:             *(strings.MinRunes(3) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9.\-_]*$"#)) | fn.#Fn
						GlueConfiguration?: *{
							DatabaseName: *(strings.MinRunes(1) & strings.MaxRunes(150)) | fn.#Fn
							TableName:    *(strings.MinRunes(1) & strings.MaxRunes(150)) | fn.#Fn
						} | fn.#If
						Key:     *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9!_.*'()/{}:-]*$"#)) | fn.#Fn
						RoleArn: *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
					} | fn.#If
				} | fn.#If
				EntryName?: *string | fn.#Fn
			}] | fn.#If
			DatasetName?:   *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"(^(?!_{2}))(^[a-zA-Z0-9_]+$)"#)) | fn.#Fn
			LateDataRules?: *[...{
				RuleConfiguration: *{
					DeltaTimeSessionWindowConfiguration?: *{
						TimeoutInMinutes: *(>=1 & <=60) | fn.#Fn
					} | fn.#If
				} | fn.#If
				RuleName?: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9_]+$"#)) | fn.#Fn
			}] | fn.#If
			RetentionPeriod?: *{
				NumberOfDays: *(>=1 & <=2147483647) | fn.#Fn
				Unlimited:    *bool | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Triggers?: *[...{
				Schedule?: *{
					ScheduleExpression: *string | fn.#Fn
				} | fn.#If
				TriggeringDataset?: *{
					DatasetName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"(^(?!_{2}))(^[a-zA-Z0-9_]+$)"#)) | fn.#Fn
				} | fn.#If
			}] | fn.#If
			VersioningConfiguration?: *{
				MaxVersions?: *(>=1 & <=1000) | fn.#Fn
				Unlimited?:   *bool | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Datastore: {
		Type: "AWS::IoTAnalytics::Datastore"
		Properties: {
			DatastoreName?:       *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_]+"#)) | fn.#Fn
			DatastorePartitions?: *{
				Partitions?: *[...{
					Partition?: *{
						AttributeName: *(=~#"[a-zA-Z0-9_]+"#) | fn.#Fn
					} | fn.#If
					TimestampPartition?: *{
						AttributeName:    *(=~#"[a-zA-Z0-9_]+"#) | fn.#Fn
						TimestampFormat?: *(=~#"[a-zA-Z0-9\s\[\]_,.'/:-]*"#) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			DatastoreStorage?: *{
				CustomerManagedS3?: *{
					Bucket:     *(strings.MinRunes(3) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9.\-_]*"#)) | fn.#Fn
					KeyPrefix?: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9!_.*'()/{}:-]*/"#)) | fn.#Fn
					RoleArn:    *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
				} | fn.#If
				IotSiteWiseMultiLayerStorage?: *{
					CustomerManagedS3Storage?: *{
						Bucket:     *(strings.MinRunes(3) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9.\-_]*"#)) | fn.#Fn
						KeyPrefix?: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9!_.*'()/{}:-]*/"#)) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ServiceManagedS3?: *{} | fn.#If
			} | fn.#If
			FileFormatConfiguration?: *{
				JsonConfiguration?:    *{} | fn.#If
				ParquetConfiguration?: *{
					SchemaDefinition?: *{
						Columns?: *[...{
							Name: *string | fn.#Fn
							Type: *string | fn.#Fn
						}] | fn.#If
					} | fn.#If
				} | fn.#If
			} | fn.#If
			RetentionPeriod?: *{
				NumberOfDays?: *(>=1 & <=2147483647) | fn.#Fn
				Unlimited?:    *bool | fn.#Fn
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
	#Pipeline: {
		Type: "AWS::IoTAnalytics::Pipeline"
		Properties: {
			PipelineActivities: *[...{
				AddAttributes?: *{
					Attributes: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					Name:  *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				Channel?: *{
					ChannelName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_]+"#)) | fn.#Fn
					Name:        *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:       *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				Datastore?: *{
					DatastoreName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_]+"#)) | fn.#Fn
					Name:          *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				DeviceRegistryEnrich?: *{
					Attribute: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					Name:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:     *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					RoleArn:   *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
					ThingName: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
				} | fn.#If
				DeviceShadowEnrich?: *{
					Attribute: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					Name:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:     *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					RoleArn:   *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
					ThingName: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
				} | fn.#If
				Filter?: *{
					Filter: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					Name:   *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:  *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				Lambda?: *{
					BatchSize:  *(>=1 & <=1000) | fn.#Fn
					LambdaName: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"[a-zA-Z0-9_-]+"#)) | fn.#Fn
					Name:       *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				Math?: *{
					Attribute: *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					Math:      *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
					Name:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:     *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				RemoveAttributes?: *{
					Attributes: [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
					Name:       *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
				SelectAttributes?: *{
					Attributes: [...(*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn)
					Name:       *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Next?:      *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				} | fn.#If
			}] | fn.#If
			PipelineName?: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_]+"#)) | fn.#Fn
			Tags?:         *[...{
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
