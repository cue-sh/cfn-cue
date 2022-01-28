package apsoutheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#KafkaConnect: {
	#Connector: {
		Type: "AWS::KafkaConnect::Connector"
		Properties: {
			Capacity: *{
				AutoScaling?: *{
					MaxWorkerCount: *int | fn.#Fn
					McuCount:       *int | fn.#Fn
					MinWorkerCount: *int | fn.#Fn
					ScaleInPolicy:  *{
						CpuUtilizationPercentage: *(>=1 & <=100) | fn.#Fn
					} | fn.#If
					ScaleOutPolicy: *{
						CpuUtilizationPercentage: *(>=1 & <=100) | fn.#Fn
					} | fn.#If
				} | fn.#If
				ProvisionedCapacity?: *{
					McuCount?:   *int | fn.#Fn
					WorkerCount: *int | fn.#Fn
				} | fn.#If
			} | fn.#If
			ConnectorConfiguration: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			ConnectorDescription?: *string | fn.#Fn
			ConnectorName:         *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
			KafkaCluster:          *{
				ApacheKafkaCluster: *{
					BootstrapServers: *string | fn.#Fn
					Vpc:              *{
						SecurityGroups: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						Subnets:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					} | fn.#If
				} | fn.#If
			} | fn.#If
			KafkaClusterClientAuthentication: *{
				AuthenticationType: *("NONE" | "IAM") | fn.#Fn
			} | fn.#If
			KafkaClusterEncryptionInTransit: *{
				EncryptionType: *("PLAINTEXT" | "TLS") | fn.#Fn
			} | fn.#If
			KafkaConnectVersion: *string | fn.#Fn
			LogDelivery?:        *{
				WorkerLogDelivery: *{
					CloudWatchLogs?: *{
						Enabled:   *bool | fn.#Fn
						LogGroup?: *string | fn.#Fn
					} | fn.#If
					Firehose?: *{
						DeliveryStream?: *string | fn.#Fn
						Enabled:         *bool | fn.#Fn
					} | fn.#If
					S3?: *{
						Bucket?: *string | fn.#Fn
						Enabled: *bool | fn.#Fn
						Prefix?: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Plugins: *[...{
				CustomPlugin: *{
					CustomPluginArn: *(=~#"arn:(aws|aws-us-gov|aws-cn):kafkaconnect:.*"#) | fn.#Fn
					Revision:        *int | fn.#Fn
				} | fn.#If
			}] | fn.#If
			ServiceExecutionRoleArn: *(=~#"arn:(aws|aws-us-gov|aws-cn):iam:.*"#) | fn.#Fn
			WorkerConfiguration?:    *{
				Revision:               *int | fn.#Fn
				WorkerConfigurationArn: *(=~#"arn:(aws|aws-us-gov|aws-cn):kafkaconnect:.*"#) | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
