package saeast1

import "github.com/TangoGroup/fn"

MSK :: {
	Cluster :: {
		Type: "AWS::MSK::Cluster"
		Properties: {
			BrokerNodeGroupInfo: {
				BrokerAZDistribution?: string | fn.Fn
				ClientSubnets: [...(string | fn.Fn)]
				InstanceType: string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)]
				StorageInfo?: EBSStorageInfo?: VolumeSize?: int | fn.Fn
			}
			ClientAuthentication?: Tls?: CertificateAuthorityArnList?: [...(string | fn.Fn)]
			ClusterName: string | fn.Fn
			ConfigurationInfo?: {
				Arn:      string | fn.Fn
				Revision: int | fn.Fn
			}
			EncryptionInfo?: {
				EncryptionAtRest?: DataVolumeKMSKeyId: string | fn.Fn
				EncryptionInTransit?: {
					ClientBroker?: string | fn.Fn
					InCluster?:    bool | fn.Fn
				}
			}
			EnhancedMonitoring?: string | fn.Fn
			KafkaVersion:        string | fn.Fn
			NumberOfBrokerNodes: int | fn.Fn
			Tags?:               {
			} | fn.Fn
		}
	}
}
