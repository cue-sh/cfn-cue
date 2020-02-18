package eucentral1

import "github.com/TangoGroup/aws/fn"

MSK :: {
	Cluster :: {
		Type: "AWS::MSK::Cluster"
		Properties: {
			BrokerNodeGroupInfo: close({
				BrokerAZDistribution?: string | fn.Fn
				ClientSubnets:         [...(string | fn.Fn)] | (string | fn.Fn)
				InstanceType:          string | fn.Fn
				SecurityGroups?:       [...(string | fn.Fn)] | (string | fn.Fn)
				StorageInfo?:          close({
					EBSStorageInfo?: close({
						VolumeSize?: int | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			ClientAuthentication?: close({
				Tls?: close({
					CertificateAuthorityArnList?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			ClusterName:        string | fn.Fn
			ConfigurationInfo?: close({
				Arn:      string | fn.Fn
				Revision: int | fn.Fn
			}) | fn.If
			EncryptionInfo?: close({
				EncryptionAtRest?: close({
					DataVolumeKMSKeyId: string | fn.Fn
				}) | fn.If
				EncryptionInTransit?: close({
					ClientBroker?: string | fn.Fn
					InCluster?:    bool | fn.Fn
				}) | fn.If
			}) | fn.If
			EnhancedMonitoring?: string | fn.Fn
			KafkaVersion:        string | fn.Fn
			NumberOfBrokerNodes: int | fn.Fn
			OpenMonitoring?:     close({
				Prometheus: close({
					JmxExporter?: close({
						EnabledInBroker: bool | fn.Fn
					}) | fn.If
					NodeExporter?: close({
						EnabledInBroker: bool | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
