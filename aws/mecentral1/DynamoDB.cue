package mecentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#DynamoDB: {
	#Table: {
		Type: "AWS::DynamoDB::Table"
		Properties: {
			AttributeDefinitions: *[...{
				AttributeName: *string | fn.#Fn
				AttributeType: *("B" | "N" | "S") | fn.#Fn
			}] | fn.#If
			BillingMode?:                      *("PAY_PER_REQUEST" | "PROVISIONED") | fn.#Fn
			ContributorInsightsSpecification?: *{
				Enabled: *bool | fn.#Fn
			} | fn.#If
			GlobalSecondaryIndexes?: *[...{
				ContributorInsightsSpecification?: *{
					Enabled: *bool | fn.#Fn
				} | fn.#If
				IndexName: *string | fn.#Fn
				KeySchema: *[...{
					AttributeName: *string | fn.#Fn
					KeyType:       *("HASH" | "RANGE") | fn.#Fn
				}] | fn.#If
				Projection: *{
					NonKeyAttributes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					ProjectionType?:   *("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.#Fn
				} | fn.#If
				ProvisionedThroughput?: *{
					ReadCapacityUnits:  *int | fn.#Fn
					WriteCapacityUnits: *int | fn.#Fn
				} | fn.#If
			}] | fn.#If
			ImportSourceSpecification?: *{
				InputCompressionType?: *string | fn.#Fn
				InputFormat:           *string | fn.#Fn
				InputFormatOptions?:   *{
					Csv?: *{
						Delimiter?:  *string | fn.#Fn
						HeaderList?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					} | fn.#If
				} | fn.#If
				S3BucketSource: *{
					S3Bucket:       *string | fn.#Fn
					S3BucketOwner?: *string | fn.#Fn
					S3KeyPrefix?:   *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			KeySchema: *[...{
				AttributeName: *string | fn.#Fn
				KeyType:       *("HASH" | "RANGE") | fn.#Fn
			}] | fn.#If
			KinesisStreamSpecification?: *{
				StreamArn: *string | fn.#Fn
			} | fn.#If
			LocalSecondaryIndexes?: *[...{
				IndexName: *string | fn.#Fn
				KeySchema: *[...{
					AttributeName: *string | fn.#Fn
					KeyType:       *("HASH" | "RANGE") | fn.#Fn
				}] | fn.#If
				Projection: *{
					NonKeyAttributes?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					ProjectionType?:   *("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.#Fn
				} | fn.#If
			}] | fn.#If
			PointInTimeRecoverySpecification?: *{
				PointInTimeRecoveryEnabled?: *bool | fn.#Fn
			} | fn.#If
			ProvisionedThroughput?: *{
				ReadCapacityUnits:  *int | fn.#Fn
				WriteCapacityUnits: *int | fn.#Fn
			} | fn.#If
			SSESpecification?: *{
				KMSMasterKeyId?: *string | fn.#Fn
				SSEEnabled:      *bool | fn.#Fn
				SSEType?:        *string | fn.#Fn
			} | fn.#If
			StreamSpecification?: *{
				StreamViewType: *("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE") | fn.#Fn
			} | fn.#If
			TableClass?: *string | fn.#Fn
			TableName?:  *string | fn.#Fn
			Tags?:       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TimeToLiveSpecification?: *{
				AttributeName: *string | fn.#Fn
				Enabled:       *bool | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
