package mecentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#ElastiCache: {
	#CacheCluster: {
		Type: "AWS::ElastiCache::CacheCluster"
		Properties: {
			AZMode?:                    *string | fn.#Fn
			AutoMinorVersionUpgrade?:   *bool | fn.#Fn
			CacheNodeType:              *("cache.m5.12xlarge" | "cache.m5.24xlarge" | "cache.m5.2xlarge" | "cache.m5.4xlarge" | "cache.m5.large" | "cache.m5.xlarge" | "cache.r5.12xlarge" | "cache.r5.24xlarge" | "cache.r5.2xlarge" | "cache.r5.4xlarge" | "cache.r5.large" | "cache.r5.xlarge" | "cache.t3.medium" | "cache.t3.micro" | "cache.t3.small") | fn.#Fn
			CacheParameterGroupName?:   *string | fn.#Fn
			CacheSecurityGroupNames?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			CacheSubnetGroupName?:      *string | fn.#Fn
			ClusterName?:               *string | fn.#Fn
			Engine:                     *string | fn.#Fn
			EngineVersion?:             *string | fn.#Fn
			LogDeliveryConfigurations?: *[...{
				DestinationDetails: *{
					CloudWatchLogsDetails?: *{
						LogGroup: *string | fn.#Fn
					} | fn.#If
					KinesisFirehoseDetails?: *{
						DeliveryStream: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				DestinationType: *string | fn.#Fn
				LogFormat:       *string | fn.#Fn
				LogType:         *string | fn.#Fn
			}] | fn.#If
			NotificationTopicArn?:       *string | fn.#Fn
			NumCacheNodes:               *int | fn.#Fn
			Port?:                       *int | fn.#Fn
			PreferredAvailabilityZone?:  *string | fn.#Fn
			PreferredAvailabilityZones?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			PreferredMaintenanceWindow?: *string | fn.#Fn
			SnapshotArns?:               [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SnapshotName?:               *string | fn.#Fn
			SnapshotRetentionLimit?:     *int | fn.#Fn
			SnapshotWindow?:             *string | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TransitEncryptionEnabled?: *bool | fn.#Fn
			VpcSecurityGroupIds?:      [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#ParameterGroup: {
		Type: "AWS::ElastiCache::ParameterGroup"
		Properties: {
			CacheParameterGroupFamily: *string | fn.#Fn
			Description:               *string | fn.#Fn
			Properties?:               *{
				[string]: *string | fn.#Fn
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
	#ReplicationGroup: {
		Type: "AWS::ElastiCache::ReplicationGroup"
		Properties: {
			AtRestEncryptionEnabled?:   *bool | fn.#Fn
			AuthToken?:                 *string | fn.#Fn
			AutoMinorVersionUpgrade?:   *bool | fn.#Fn
			AutomaticFailoverEnabled?:  *bool | fn.#Fn
			CacheNodeType?:             *("cache.m5.12xlarge" | "cache.m5.24xlarge" | "cache.m5.2xlarge" | "cache.m5.4xlarge" | "cache.m5.large" | "cache.m5.xlarge" | "cache.r5.12xlarge" | "cache.r5.24xlarge" | "cache.r5.2xlarge" | "cache.r5.4xlarge" | "cache.r5.large" | "cache.r5.xlarge" | "cache.t3.medium" | "cache.t3.micro" | "cache.t3.small") | fn.#Fn
			CacheParameterGroupName?:   *string | fn.#Fn
			CacheSecurityGroupNames?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			CacheSubnetGroupName?:      *string | fn.#Fn
			DataTieringEnabled?:        *bool | fn.#Fn
			Engine?:                    *string | fn.#Fn
			EngineVersion?:             *string | fn.#Fn
			GlobalReplicationGroupId?:  *string | fn.#Fn
			KmsKeyId?:                  *string | fn.#Fn
			LogDeliveryConfigurations?: *[...{
				DestinationDetails: *{
					CloudWatchLogsDetails?: *{
						LogGroup: *string | fn.#Fn
					} | fn.#If
					KinesisFirehoseDetails?: *{
						DeliveryStream: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				DestinationType: *string | fn.#Fn
				LogFormat:       *string | fn.#Fn
				LogType:         *string | fn.#Fn
			}] | fn.#If
			MultiAZEnabled?:         *bool | fn.#Fn
			NodeGroupConfiguration?: *[...{
				NodeGroupId?:              *string | fn.#Fn
				PrimaryAvailabilityZone?:  *string | fn.#Fn
				ReplicaAvailabilityZones?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ReplicaCount?:             *int | fn.#Fn
				Slots?:                    *string | fn.#Fn
			}] | fn.#If
			NotificationTopicArn?:       *string | fn.#Fn
			NumCacheClusters?:           *(>=1 & <=6) | fn.#Fn
			NumNodeGroups?:              *int | fn.#Fn
			Port?:                       *int | fn.#Fn
			PreferredCacheClusterAZs?:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			PreferredMaintenanceWindow?: *string | fn.#Fn
			PrimaryClusterId?:           *string | fn.#Fn
			ReplicasPerNodeGroup?:       *(>=0 & <=5) | fn.#Fn
			ReplicationGroupDescription: *string | fn.#Fn
			ReplicationGroupId?:         *string | fn.#Fn
			SecurityGroupIds?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SnapshotArns?:               [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SnapshotName?:               *string | fn.#Fn
			SnapshotRetentionLimit?:     *int | fn.#Fn
			SnapshotWindow?:             *string | fn.#Fn
			SnapshottingClusterId?:      *string | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TransitEncryptionEnabled?: *bool | fn.#Fn
			UserGroupIds?:             [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		UpdatePolicy?: [string]: _
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroup: {
		Type: "AWS::ElastiCache::SecurityGroup"
		Properties: {
			Description: *string | fn.#Fn
			Tags?:       *[...{
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
	#SecurityGroupIngress: {
		Type: "AWS::ElastiCache::SecurityGroupIngress"
		Properties: {
			CacheSecurityGroupName:   *string | fn.#Fn
			EC2SecurityGroupName:     *string | fn.#Fn
			EC2SecurityGroupOwnerId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetGroup: {
		Type: "AWS::ElastiCache::SubnetGroup"
		Properties: {
			CacheSubnetGroupName?: *string | fn.#Fn
			Description:           *string | fn.#Fn
			SubnetIds:             [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:                 *[...{
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
