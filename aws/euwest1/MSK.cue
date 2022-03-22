package euwest1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#MSK: {
	#BatchScramSecret: {
		Type: "AWS::MSK::BatchScramSecret"
		Properties: {
			ClusterArn:     *string | fn.#Fn
			SecretArnList?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Cluster: {
		Type: "AWS::MSK::Cluster"
		Properties: {
			BrokerNodeGroupInfo: *{
				BrokerAZDistribution?: *(strings.MinRunes(6) & strings.MaxRunes(9)) | fn.#Fn
				ClientSubnets:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ConnectivityInfo?:     *{
					PublicAccess?: *{
						Type?: *(strings.MinRunes(7) & strings.MaxRunes(23)) | fn.#Fn
					} | fn.#If
				} | fn.#If
				InstanceType:    *(strings.MinRunes(5) & strings.MaxRunes(32)) | fn.#Fn
				SecurityGroups?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				StorageInfo?:    *{
					EBSStorageInfo?: *{
						ProvisionedThroughput?: *{
							Enabled?:          *bool | fn.#Fn
							VolumeThroughput?: *int | fn.#Fn
						} | fn.#If
						VolumeSize?: *(>=1 & <=16384) | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			ClientAuthentication?: *{
				Sasl?: *{
					Iam?: *{
						Enabled: *bool | fn.#Fn
					} | fn.#If
					Scram?: *{
						Enabled: *bool | fn.#Fn
					} | fn.#If
				} | fn.#If
				Tls?: *{
					CertificateAuthorityArnList?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Enabled?:                     *bool | fn.#Fn
				} | fn.#If
				Unauthenticated?: *{
					Enabled: *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			ClusterName:        *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
			ConfigurationInfo?: *{
				Arn:      *string | fn.#Fn
				Revision: *int | fn.#Fn
			} | fn.#If
			CurrentVersion?: *string | fn.#Fn
			EncryptionInfo?: *{
				EncryptionAtRest?: *{
					DataVolumeKMSKeyId: *string | fn.#Fn
				} | fn.#If
				EncryptionInTransit?: *{
					ClientBroker?: *("TLS" | "TLS_PLAINTEXT" | "PLAINTEXT") | fn.#Fn
					InCluster?:    *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			EnhancedMonitoring?: *(("DEFAULT" | "PER_BROKER" | "PER_TOPIC_PER_BROKER" | "PER_TOPIC_PER_PARTITION") & (strings.MinRunes(7) & strings.MaxRunes(23))) | fn.#Fn
			KafkaVersion:        *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
			LoggingInfo?:        *{
				BrokerLogs: *{
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
			NumberOfBrokerNodes: *int | fn.#Fn
			OpenMonitoring?:     *{
				Prometheus: *{
					JmxExporter?: *{
						EnabledInBroker: *bool | fn.#Fn
					} | fn.#If
					NodeExporter?: *{
						EnabledInBroker: *bool | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Configuration: {
		Type: "AWS::MSK::Configuration"
		Properties: {
			Description?:       *string | fn.#Fn
			KafkaVersionsList?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name?:              *string | fn.#Fn
			ServerProperties:   *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
