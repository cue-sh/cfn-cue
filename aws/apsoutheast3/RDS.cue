package apsoutheast3

import "github.com/cue-sh/cfn-cue/aws/fn"

#RDS: {
	#DBCluster: {
		Type: "AWS::RDS::DBCluster"
		Properties: {
			AssociatedRoles?: *[...{
				FeatureName?: *string | fn.#Fn
				RoleArn:      *string | fn.#Fn
			}] | fn.#If
			AvailabilityZones?:               [...(*(=~#"[a-z0-9-]+"#) | fn.#Fn)] | (*(=~#"[a-z0-9-]+"#) | fn.#Fn)
			BacktrackWindow?:                 *int | fn.#Fn
			BackupRetentionPeriod?:           *(>=1 & <=35) | fn.#Fn
			CopyTagsToSnapshot?:              *bool | fn.#Fn
			DBClusterIdentifier?:             *string | fn.#Fn
			DBClusterParameterGroupName?:     *string | fn.#Fn
			DBSubnetGroupName?:               *string | fn.#Fn
			DatabaseName?:                    *string | fn.#Fn
			DeletionProtection?:              *bool | fn.#Fn
			EnableCloudwatchLogsExports?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			EnableHttpEndpoint?:              *bool | fn.#Fn
			EnableIAMDatabaseAuthentication?: *bool | fn.#Fn
			Engine:                           *string | fn.#Fn
			EngineMode?:                      *string | fn.#Fn
			EngineVersion?:                   *string | fn.#Fn
			GlobalClusterIdentifier?:         *string | fn.#Fn
			KmsKeyId?:                        *string | fn.#Fn
			MasterUserPassword?:              *string | fn.#Fn
			MasterUsername?:                  *string | fn.#Fn
			Port?:                            *int | fn.#Fn
			PreferredBackupWindow?:           *string | fn.#Fn
			PreferredMaintenanceWindow?:      *string | fn.#Fn
			ReplicationSourceIdentifier?:     *string | fn.#Fn
			RestoreType?:                     *string | fn.#Fn
			ScalingConfiguration?:            *{
				AutoPause?:             *bool | fn.#Fn
				MaxCapacity?:           *int | fn.#Fn
				MinCapacity?:           *int | fn.#Fn
				SecondsUntilAutoPause?: *int | fn.#Fn
			} | fn.#If
			SnapshotIdentifier?:        *string | fn.#Fn
			SourceDBClusterIdentifier?: *string | fn.#Fn
			SourceRegion?:              *string | fn.#Fn
			StorageEncrypted?:          *bool | fn.#Fn
			Tags?:                      *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UseLatestRestorableTime?: *bool | fn.#Fn
			VpcSecurityGroupIds?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBClusterParameterGroup: {
		Type: "AWS::RDS::DBClusterParameterGroup"
		Properties: {
			Description: *string | fn.#Fn
			Family:      *string | fn.#Fn
			Parameters:  *{
				[string]: _
			} | fn.#Fn
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
	#DBInstance: {
		Type: "AWS::RDS::DBInstance"
		Properties: {
			AllocatedStorage?:         *string | fn.#Fn
			AllowMajorVersionUpgrade?: *bool | fn.#Fn
			AssociatedRoles?:          *[...{
				FeatureName: *string | fn.#Fn
				RoleArn:     *string | fn.#Fn
			}] | fn.#If
			AutoMinorVersionUpgrade?:            *bool | fn.#Fn
			AvailabilityZone?:                   *(=~#"[a-z0-9-]+"#) | fn.#Fn
			BackupRetentionPeriod?:              *(>=0 & <=35) | fn.#Fn
			CACertificateIdentifier?:            *string | fn.#Fn
			CharacterSetName?:                   *string | fn.#Fn
			CopyTagsToSnapshot?:                 *bool | fn.#Fn
			DBClusterIdentifier?:                *string | fn.#Fn
			DBInstanceClass:                     *("db.m5.12xlarge" | "db.m5.16xlarge" | "db.m5.24xlarge" | "db.m5.2xlarge" | "db.m5.4xlarge" | "db.m5.8xlarge" | "db.m5.large" | "db.m5.xlarge" | "db.r5.12xlarge" | "db.r5.12xlarge.tpc2.mem2x" | "db.r5.16xlarge" | "db.r5.24xlarge" | "db.r5.2xlarge" | "db.r5.2xlarge.tpc1.mem2x" | "db.r5.2xlarge.tpc2.mem4x" | "db.r5.2xlarge.tpc2.mem8x" | "db.r5.4xlarge" | "db.r5.4xlarge.tpc2.mem2x" | "db.r5.4xlarge.tpc2.mem3x" | "db.r5.4xlarge.tpc2.mem4x" | "db.r5.6xlarge.tpc2.mem4x" | "db.r5.8xlarge" | "db.r5.8xlarge.tpc2.mem3x" | "db.r5.large" | "db.r5.large.tpc1.mem2x" | "db.r5.xlarge" | "db.r5.xlarge.tpc2.mem2x" | "db.r5.xlarge.tpc2.mem4x" | "db.r5b.8xlarge" | "db.t3.2xlarge" | "db.t3.large" | "db.t3.medium" | "db.t3.micro" | "db.t3.small" | "db.t3.xlarge") | fn.#Fn
			DBInstanceIdentifier?:               *string | fn.#Fn
			DBName?:                             *string | fn.#Fn
			DBParameterGroupName?:               *string | fn.#Fn
			DBSecurityGroups?:                   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			DBSnapshotIdentifier?:               *string | fn.#Fn
			DBSubnetGroupName?:                  *string | fn.#Fn
			DeleteAutomatedBackups?:             *bool | fn.#Fn
			DeletionProtection?:                 *bool | fn.#Fn
			Domain?:                             *string | fn.#Fn
			DomainIAMRoleName?:                  *string | fn.#Fn
			EnableCloudwatchLogsExports?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			EnableIAMDatabaseAuthentication?:    *bool | fn.#Fn
			EnablePerformanceInsights?:          *bool | fn.#Fn
			Engine?:                             *(=~#"(?i)(aurora|aurora-mysql|aurora-postgresql|mariadb|mysql|oracle-ee|oracle-se2|oracle-se1|oracle-se|postgres|sqlserver-ee|sqlserver-se|sqlserver-ex|sqlserver-web)$"#) | fn.#Fn
			EngineVersion?:                      *string | fn.#Fn
			Iops?:                               *int | fn.#Fn
			KmsKeyId?:                           *string | fn.#Fn
			LicenseModel?:                       *string | fn.#Fn
			MasterUserPassword?:                 *string | fn.#Fn
			MasterUsername?:                     *string | fn.#Fn
			MaxAllocatedStorage?:                *int | fn.#Fn
			MonitoringInterval?:                 *(0 | 1 | 5 | 10 | 15 | 30 | 60) | fn.#Fn
			MonitoringRoleArn?:                  *string | fn.#Fn
			MultiAZ?:                            *bool | fn.#Fn
			OptionGroupName?:                    *string | fn.#Fn
			PerformanceInsightsKMSKeyId?:        *string | fn.#Fn
			PerformanceInsightsRetentionPeriod?: *(7 | 731) | fn.#Fn
			Port?:                               *string | fn.#Fn
			PreferredBackupWindow?:              *string | fn.#Fn
			PreferredMaintenanceWindow?:         *string | fn.#Fn
			ProcessorFeatures?:                  *[...{
				Name?:  *string | fn.#Fn
				Value?: *string | fn.#Fn
			}] | fn.#If
			PromotionTier?:              *(>=0 & <=15) | fn.#Fn
			PubliclyAccessible?:         *bool | fn.#Fn
			SourceDBInstanceIdentifier?: *string | fn.#Fn
			SourceRegion?:               *string | fn.#Fn
			StorageEncrypted?:           *bool | fn.#Fn
			StorageType?:                *string | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Timezone?:                    *string | fn.#Fn
			UseDefaultProcessorFeatures?: *bool | fn.#Fn
			VPCSecurityGroups?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBParameterGroup: {
		Type: "AWS::RDS::DBParameterGroup"
		Properties: {
			Description: *string | fn.#Fn
			Family:      *string | fn.#Fn
			Parameters?: *{
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
	#DBSecurityGroup: {
		Type: "AWS::RDS::DBSecurityGroup"
		Properties: {
			DBSecurityGroupIngress: *[...{
				CIDRIP?:                  *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				EC2SecurityGroupId?:      *string | fn.#Fn
				EC2SecurityGroupName?:    *string | fn.#Fn
				EC2SecurityGroupOwnerId?: *string | fn.#Fn
			}] | fn.#If
			EC2VpcId?:        *string | fn.#Fn
			GroupDescription: *string | fn.#Fn
			Tags?:            *[...{
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
	#DBSecurityGroupIngress: {
		Type: "AWS::RDS::DBSecurityGroupIngress"
		Properties: {
			CIDRIP?:                  *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			DBSecurityGroupName:      *string | fn.#Fn
			EC2SecurityGroupId?:      *string | fn.#Fn
			EC2SecurityGroupName?:    *string | fn.#Fn
			EC2SecurityGroupOwnerId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBSubnetGroup: {
		Type: "AWS::RDS::DBSubnetGroup"
		Properties: {
			DBSubnetGroupDescription: *string | fn.#Fn
			DBSubnetGroupName?:       *(=~#"^(?!default$)[a-zA-Z]{1}[a-zA-Z0-9-_\.\s]{0,254}$"#) | fn.#Fn
			SubnetIds:                [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:                    *[...{
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
	#EventSubscription: {
		Type: "AWS::RDS::EventSubscription"
		Properties: {
			Enabled?:         *bool | fn.#Fn
			EventCategories?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SnsTopicArn:      *string | fn.#Fn
			SourceIds?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SourceType?:      *("custom-engine-version" | "db-cluster" | "db-cluster-snapshot" | "db-instance" | "db-proxy" | "db-parameter-group" | "db-security-group" | "db-snapshot") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#OptionGroup: {
		Type: "AWS::RDS::OptionGroup"
		Properties: {
			EngineName:           *string | fn.#Fn
			MajorEngineVersion:   *string | fn.#Fn
			OptionConfigurations: *[...{
				DBSecurityGroupMemberships?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				OptionName:                  *string | fn.#Fn
				OptionSettings?:             *[...{
					Name?:  *string | fn.#Fn
					Value?: *string | fn.#Fn
				}] | fn.#If
				OptionVersion?:               *string | fn.#Fn
				Port?:                        *int | fn.#Fn
				VpcSecurityGroupMemberships?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			OptionGroupDescription: *string | fn.#Fn
			Tags?:                  *[...{
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
