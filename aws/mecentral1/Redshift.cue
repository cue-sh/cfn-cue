package mecentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#Redshift: {
	#Cluster: {
		Type: "AWS::Redshift::Cluster"
		Properties: {
			AllowVersionUpgrade?:              *bool | fn.#Fn
			AutomatedSnapshotRetentionPeriod?: *int | fn.#Fn
			AvailabilityZone?:                 *string | fn.#Fn
			ClusterIdentifier?:                *string | fn.#Fn
			ClusterParameterGroupName?:        *string | fn.#Fn
			ClusterSecurityGroups?:            [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			ClusterSubnetGroupName?:           *string | fn.#Fn
			ClusterType:                       *("multi-node" | "single-node") | fn.#Fn
			ClusterVersion?:                   *("1.0") | fn.#Fn
			DBName:                            *string | fn.#Fn
			ElasticIp?:                        *string | fn.#Fn
			Encrypted?:                        *bool | fn.#Fn
			HsmClientCertificateIdentifier?:   *string | fn.#Fn
			HsmConfigurationIdentifier?:       *string | fn.#Fn
			IamRoles?:                         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			KmsKeyId?:                         *string | fn.#Fn
			LoggingProperties?:                *{
				BucketName:   *string | fn.#Fn
				S3KeyPrefix?: *string | fn.#Fn
			} | fn.#If
			MasterUserPassword:          *string | fn.#Fn
			MasterUsername:              *string | fn.#Fn
			NodeType:                    *("dc2.8xlarge" | "dc2.large" | "ra3.16xlarge" | "ra3.4xlarge") | fn.#Fn
			NumberOfNodes?:              *(>=1 & <=100) | fn.#Fn
			OwnerAccount?:               *string | fn.#Fn
			Port?:                       *int | fn.#Fn
			PreferredMaintenanceWindow?: *string | fn.#Fn
			PubliclyAccessible?:         *bool | fn.#Fn
			SnapshotClusterIdentifier?:  *string | fn.#Fn
			SnapshotIdentifier?:         *string | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcSecurityGroupIds?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClusterParameterGroup: {
		Type: "AWS::Redshift::ClusterParameterGroup"
		Properties: {
			Description:          *string | fn.#Fn
			ParameterGroupFamily: *string | fn.#Fn
			Parameters?:          *[...{
				ParameterName:  *string | fn.#Fn
				ParameterValue: *string | fn.#Fn
			}] | fn.#If
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
	#ClusterSecurityGroup: {
		Type: "AWS::Redshift::ClusterSecurityGroup"
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
	#ClusterSecurityGroupIngress: {
		Type: "AWS::Redshift::ClusterSecurityGroupIngress"
		Properties: {
			CIDRIP?:                  *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			ClusterSecurityGroupName: *string | fn.#Fn
			EC2SecurityGroupName?:    *string | fn.#Fn
			EC2SecurityGroupOwnerId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClusterSubnetGroup: {
		Type: "AWS::Redshift::ClusterSubnetGroup"
		Properties: {
			Description: *string | fn.#Fn
			SubnetIds:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
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
}
