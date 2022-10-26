package mecentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IoT: {
	#Certificate: {
		Type: "AWS::IoT::Certificate"
		Properties: {
			CertificateSigningRequest: *string | fn.#Fn
			Status:                    *("ACTIVE" | "INACTIVE" | "REVOKED" | "PENDING_TRANSFER" | "PENDING_ACTIVATION") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Logging: {
		Type: "AWS::IoT::Logging"
		Properties: {
			AccountId:       *(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.#Fn
			DefaultLogLevel: *("ERROR" | "WARN" | "INFO" | "DEBUG" | "DISABLED") | fn.#Fn
			RoleArn:         *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Policy: {
		Type: "AWS::IoT::Policy"
		Properties: {
			PolicyDocument: *{
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			PolicyName?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PolicyPrincipalAttachment: {
		Type: "AWS::IoT::PolicyPrincipalAttachment"
		Properties: {
			PolicyName: *string | fn.#Fn
			Principal:  *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceSpecificLogging: {
		Type: "AWS::IoT::ResourceSpecificLogging"
		Properties: {
			LogLevel:   *("ERROR" | "WARN" | "INFO" | "DEBUG" | "DISABLED") | fn.#Fn
			TargetName: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9.:_-]+"#)) | fn.#Fn
			TargetType: *("THING_GROUP" | "CLIENT_ID" | "SOURCE_IP" | "PRINCIPAL_ID") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Thing: {
		Type: "AWS::IoT::Thing"
		Properties: {
			AttributePayload?: *{
				Attributes?: *{
					[string]: *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ThingName?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ThingPrincipalAttachment: {
		Type: "AWS::IoT::ThingPrincipalAttachment"
		Properties: {
			Principal: *string | fn.#Fn
			ThingName: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TopicRule: {
		Type: "AWS::IoT::TopicRule"
		Properties: {
			RuleName?:        *string | fn.#Fn
			TopicRulePayload: *{
				Actions: *[...{
					CloudwatchAlarm?: *{
						AlarmName:   *string | fn.#Fn
						RoleArn:     *string | fn.#Fn
						StateReason: *string | fn.#Fn
						StateValue:  *string | fn.#Fn
					} | fn.#If
					CloudwatchMetric?: *{
						MetricName:       *string | fn.#Fn
						MetricNamespace:  *string | fn.#Fn
						MetricTimestamp?: *string | fn.#Fn
						MetricUnit:       *string | fn.#Fn
						MetricValue:      *string | fn.#Fn
						RoleArn:          *string | fn.#Fn
					} | fn.#If
					DynamoDB?: *{
						HashKeyField:   *string | fn.#Fn
						HashKeyType?:   *string | fn.#Fn
						HashKeyValue:   *string | fn.#Fn
						PayloadField?:  *string | fn.#Fn
						RangeKeyField?: *string | fn.#Fn
						RangeKeyType?:  *string | fn.#Fn
						RangeKeyValue?: *string | fn.#Fn
						RoleArn:        *string | fn.#Fn
						TableName:      *string | fn.#Fn
					} | fn.#If
					DynamoDBv2?: *{
						PutItem?: *{
							TableName: *string | fn.#Fn
						} | fn.#If
						RoleArn?: *string | fn.#Fn
					} | fn.#If
					Elasticsearch?: *{
						Endpoint: *string | fn.#Fn
						Id:       *string | fn.#Fn
						Index:    *string | fn.#Fn
						RoleArn:  *string | fn.#Fn
						Type:     *string | fn.#Fn
					} | fn.#If
					Firehose?: *{
						DeliveryStreamName: *string | fn.#Fn
						RoleArn:            *string | fn.#Fn
						Separator?:         *string | fn.#Fn
					} | fn.#If
					Http?: *{
						Auth?: *{
							Sigv4?: *{
								RoleArn:       *string | fn.#Fn
								ServiceName:   *string | fn.#Fn
								SigningRegion: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						ConfirmationUrl?: *string | fn.#Fn
						Headers?:         *[...{
							Key:   *string | fn.#Fn
							Value: *string | fn.#Fn
						}] | fn.#If
						Url: *string | fn.#Fn
					} | fn.#If
					IotAnalytics?: *{
						ChannelName: *string | fn.#Fn
						RoleArn:     *string | fn.#Fn
					} | fn.#If
					IotEvents?: *{
						InputName:  *string | fn.#Fn
						MessageId?: *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
					} | fn.#If
					IotSiteWise?: *{
						PutAssetPropertyValueEntries: *[...{
							AssetId?:       *string | fn.#Fn
							EntryId?:       *string | fn.#Fn
							PropertyAlias?: *string | fn.#Fn
							PropertyId?:    *string | fn.#Fn
							PropertyValues: *[...{
								Quality?:  *string | fn.#Fn
								Timestamp: *{
									OffsetInNanos?: *string | fn.#Fn
									TimeInSeconds:  *string | fn.#Fn
								} | fn.#If
								Value: *{
									BooleanValue?: *string | fn.#Fn
									DoubleValue?:  *string | fn.#Fn
									IntegerValue?: *string | fn.#Fn
									StringValue?:  *string | fn.#Fn
								} | fn.#If
							}] | fn.#If
						}] | fn.#If
						RoleArn: *string | fn.#Fn
					} | fn.#If
					Kinesis?: *{
						PartitionKey?: *string | fn.#Fn
						RoleArn:       *string | fn.#Fn
						StreamName:    *string | fn.#Fn
					} | fn.#If
					Lambda?: *{
						FunctionArn?: *string | fn.#Fn
					} | fn.#If
					Republish?: *{
						Qos?:    *int | fn.#Fn
						RoleArn: *string | fn.#Fn
						Topic:   *string | fn.#Fn
					} | fn.#If
					S3?: *{
						BucketName: *string | fn.#Fn
						Key:        *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
					} | fn.#If
					Sns?: *{
						MessageFormat?: *string | fn.#Fn
						RoleArn:        *string | fn.#Fn
						TargetArn:      *string | fn.#Fn
					} | fn.#If
					Sqs?: *{
						QueueUrl:   *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
						UseBase64?: *bool | fn.#Fn
					} | fn.#If
					StepFunctions?: *{
						ExecutionNamePrefix?: *string | fn.#Fn
						RoleArn:              *string | fn.#Fn
						StateMachineName:     *string | fn.#Fn
					} | fn.#If
				}] | fn.#If
				AwsIotSqlVersion?: *string | fn.#Fn
				Description?:      *string | fn.#Fn
				ErrorAction?:      *{
					CloudwatchAlarm?: *{
						AlarmName:   *string | fn.#Fn
						RoleArn:     *string | fn.#Fn
						StateReason: *string | fn.#Fn
						StateValue:  *string | fn.#Fn
					} | fn.#If
					CloudwatchMetric?: *{
						MetricName:       *string | fn.#Fn
						MetricNamespace:  *string | fn.#Fn
						MetricTimestamp?: *string | fn.#Fn
						MetricUnit:       *string | fn.#Fn
						MetricValue:      *string | fn.#Fn
						RoleArn:          *string | fn.#Fn
					} | fn.#If
					DynamoDB?: *{
						HashKeyField:   *string | fn.#Fn
						HashKeyType?:   *string | fn.#Fn
						HashKeyValue:   *string | fn.#Fn
						PayloadField?:  *string | fn.#Fn
						RangeKeyField?: *string | fn.#Fn
						RangeKeyType?:  *string | fn.#Fn
						RangeKeyValue?: *string | fn.#Fn
						RoleArn:        *string | fn.#Fn
						TableName:      *string | fn.#Fn
					} | fn.#If
					DynamoDBv2?: *{
						PutItem?: *{
							TableName: *string | fn.#Fn
						} | fn.#If
						RoleArn?: *string | fn.#Fn
					} | fn.#If
					Elasticsearch?: *{
						Endpoint: *string | fn.#Fn
						Id:       *string | fn.#Fn
						Index:    *string | fn.#Fn
						RoleArn:  *string | fn.#Fn
						Type:     *string | fn.#Fn
					} | fn.#If
					Firehose?: *{
						DeliveryStreamName: *string | fn.#Fn
						RoleArn:            *string | fn.#Fn
						Separator?:         *string | fn.#Fn
					} | fn.#If
					Http?: *{
						Auth?: *{
							Sigv4?: *{
								RoleArn:       *string | fn.#Fn
								ServiceName:   *string | fn.#Fn
								SigningRegion: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						ConfirmationUrl?: *string | fn.#Fn
						Headers?:         *[...{
							Key:   *string | fn.#Fn
							Value: *string | fn.#Fn
						}] | fn.#If
						Url: *string | fn.#Fn
					} | fn.#If
					IotAnalytics?: *{
						ChannelName: *string | fn.#Fn
						RoleArn:     *string | fn.#Fn
					} | fn.#If
					IotEvents?: *{
						InputName:  *string | fn.#Fn
						MessageId?: *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
					} | fn.#If
					IotSiteWise?: *{
						PutAssetPropertyValueEntries: *[...{
							AssetId?:       *string | fn.#Fn
							EntryId?:       *string | fn.#Fn
							PropertyAlias?: *string | fn.#Fn
							PropertyId?:    *string | fn.#Fn
							PropertyValues: *[...{
								Quality?:  *string | fn.#Fn
								Timestamp: *{
									OffsetInNanos?: *string | fn.#Fn
									TimeInSeconds:  *string | fn.#Fn
								} | fn.#If
								Value: *{
									BooleanValue?: *string | fn.#Fn
									DoubleValue?:  *string | fn.#Fn
									IntegerValue?: *string | fn.#Fn
									StringValue?:  *string | fn.#Fn
								} | fn.#If
							}] | fn.#If
						}] | fn.#If
						RoleArn: *string | fn.#Fn
					} | fn.#If
					Kinesis?: *{
						PartitionKey?: *string | fn.#Fn
						RoleArn:       *string | fn.#Fn
						StreamName:    *string | fn.#Fn
					} | fn.#If
					Lambda?: *{
						FunctionArn?: *string | fn.#Fn
					} | fn.#If
					Republish?: *{
						Qos?:    *int | fn.#Fn
						RoleArn: *string | fn.#Fn
						Topic:   *string | fn.#Fn
					} | fn.#If
					S3?: *{
						BucketName: *string | fn.#Fn
						Key:        *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
					} | fn.#If
					Sns?: *{
						MessageFormat?: *string | fn.#Fn
						RoleArn:        *string | fn.#Fn
						TargetArn:      *string | fn.#Fn
					} | fn.#If
					Sqs?: *{
						QueueUrl:   *string | fn.#Fn
						RoleArn:    *string | fn.#Fn
						UseBase64?: *bool | fn.#Fn
					} | fn.#If
					StepFunctions?: *{
						ExecutionNamePrefix?: *string | fn.#Fn
						RoleArn:              *string | fn.#Fn
						StateMachineName:     *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				RuleDisabled: *bool | fn.#Fn
				Sql:          *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
