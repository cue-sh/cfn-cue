package euwest3

import "github.com/cue-sh/cfn-cue/aws/fn"

#FSx: {
	#DataRepositoryAssociation: {
		Type: "AWS::FSx::DataRepositoryAssociation"
		Properties: {
			BatchImportMetaDataOnCreate?: *bool | fn.#Fn
			DataRepositoryPath:           *string | fn.#Fn
			FileSystemId:                 *string | fn.#Fn
			FileSystemPath:               *string | fn.#Fn
			ImportedFileChunkSize?:       *int | fn.#Fn
			S3?:                          *{
				AutoExportPolicy?: *{
					Events: [...(*("NEW" | "CHANGED" | "DELETED") | fn.#Fn)] | (*("NEW" | "CHANGED" | "DELETED") | fn.#Fn)
				} | fn.#If
				AutoImportPolicy?: *{
					Events: [...(*("NEW" | "CHANGED" | "DELETED") | fn.#Fn)] | (*("NEW" | "CHANGED" | "DELETED") | fn.#Fn)
				} | fn.#If
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
	#FileSystem: {
		Type: "AWS::FSx::FileSystem"
		Properties: {
			BackupId?:              *string | fn.#Fn
			FileSystemType:         *string | fn.#Fn
			FileSystemTypeVersion?: *string | fn.#Fn
			KmsKeyId?:              *string | fn.#Fn
			LustreConfiguration?:   *{
				AutoImportPolicy?:              *string | fn.#Fn
				AutomaticBackupRetentionDays?:  *int | fn.#Fn
				CopyTagsToBackups?:             *bool | fn.#Fn
				DailyAutomaticBackupStartTime?: *string | fn.#Fn
				DataCompressionType?:           *string | fn.#Fn
				DeploymentType?:                *string | fn.#Fn
				DriveCacheType?:                *string | fn.#Fn
				ExportPath?:                    *string | fn.#Fn
				ImportPath?:                    *string | fn.#Fn
				ImportedFileChunkSize?:         *int | fn.#Fn
				PerUnitStorageThroughput?:      *int | fn.#Fn
				WeeklyMaintenanceStartTime?:    *string | fn.#Fn
			} | fn.#If
			OntapConfiguration?: *{
				AutomaticBackupRetentionDays?:  *int | fn.#Fn
				DailyAutomaticBackupStartTime?: *string | fn.#Fn
				DeploymentType:                 *string | fn.#Fn
				DiskIopsConfiguration?:         *{
					Iops?: *int | fn.#Fn
					Mode?: *string | fn.#Fn
				} | fn.#If
				EndpointIpAddressRange?:     *string | fn.#Fn
				FsxAdminPassword?:           *string | fn.#Fn
				PreferredSubnetId?:          *string | fn.#Fn
				RouteTableIds?:              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				ThroughputCapacity?:         *int | fn.#Fn
				WeeklyMaintenanceStartTime?: *string | fn.#Fn
			} | fn.#If
			OpenZFSConfiguration?: *{
				AutomaticBackupRetentionDays?:  *int | fn.#Fn
				CopyTagsToBackups?:             *bool | fn.#Fn
				CopyTagsToVolumes?:             *bool | fn.#Fn
				DailyAutomaticBackupStartTime?: *string | fn.#Fn
				DeploymentType:                 *string | fn.#Fn
				DiskIopsConfiguration?:         *{
					Iops?: *int | fn.#Fn
					Mode?: *string | fn.#Fn
				} | fn.#If
				Options?:                 [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				RootVolumeConfiguration?: *{
					CopyTagsToSnapshots?: *bool | fn.#Fn
					DataCompressionType?: *string | fn.#Fn
					NfsExports?:          *[...{
						ClientConfigurations?: *[...{
							Clients?: *string | fn.#Fn
							Options?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						}] | fn.#If
					}] | fn.#If
					ReadOnly?:           *bool | fn.#Fn
					RecordSizeKiB?:      *int | fn.#Fn
					UserAndGroupQuotas?: *[...{
						Id?:                      *int | fn.#Fn
						StorageCapacityQuotaGiB?: *int | fn.#Fn
						Type?:                    *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				ThroughputCapacity?:         *int | fn.#Fn
				WeeklyMaintenanceStartTime?: *string | fn.#Fn
			} | fn.#If
			SecurityGroupIds?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			StorageCapacity?:  *(>=32 & <=65536) | fn.#Fn
			StorageType?:      *string | fn.#Fn
			SubnetIds:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:             *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			WindowsConfiguration?: *{
				ActiveDirectoryId?:     *string | fn.#Fn
				Aliases?:               [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				AuditLogConfiguration?: *{
					AuditLogDestination?:         *string | fn.#Fn
					FileAccessAuditLogLevel:      *string | fn.#Fn
					FileShareAccessAuditLogLevel: *string | fn.#Fn
				} | fn.#If
				AutomaticBackupRetentionDays?:            *int | fn.#Fn
				CopyTagsToBackups?:                       *bool | fn.#Fn
				DailyAutomaticBackupStartTime?:           *string | fn.#Fn
				DeploymentType?:                          *string | fn.#Fn
				PreferredSubnetId?:                       *string | fn.#Fn
				SelfManagedActiveDirectoryConfiguration?: *{
					DnsIps?:                              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					DomainName?:                          *string | fn.#Fn
					FileSystemAdministratorsGroup?:       *string | fn.#Fn
					OrganizationalUnitDistinguishedName?: *string | fn.#Fn
					Password?:                            *string | fn.#Fn
					UserName?:                            *string | fn.#Fn
				} | fn.#If
				ThroughputCapacity:          *int | fn.#Fn
				WeeklyMaintenanceStartTime?: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Snapshot: {
		Type: "AWS::FSx::Snapshot"
		Properties: {
			Name:  *string | fn.#Fn
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VolumeId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StorageVirtualMachine: {
		Type: "AWS::FSx::StorageVirtualMachine"
		Properties: {
			ActiveDirectoryConfiguration?: *{
				NetBiosName?:                             *string | fn.#Fn
				SelfManagedActiveDirectoryConfiguration?: *{
					DnsIps?:                              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					DomainName?:                          *string | fn.#Fn
					FileSystemAdministratorsGroup?:       *string | fn.#Fn
					OrganizationalUnitDistinguishedName?: *string | fn.#Fn
					Password?:                            *string | fn.#Fn
					UserName?:                            *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			FileSystemId:             *string | fn.#Fn
			Name:                     *string | fn.#Fn
			RootVolumeSecurityStyle?: *string | fn.#Fn
			SvmAdminPassword?:        *string | fn.#Fn
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
	#Volume: {
		Type: "AWS::FSx::Volume"
		Properties: {
			BackupId?:           *string | fn.#Fn
			Name:                *string | fn.#Fn
			OntapConfiguration?: *{
				JunctionPath:             *string | fn.#Fn
				SecurityStyle?:           *string | fn.#Fn
				SizeInMegabytes:          *string | fn.#Fn
				StorageEfficiencyEnabled: *string | fn.#Fn
				StorageVirtualMachineId:  *string | fn.#Fn
				TieringPolicy?:           *{
					CoolingPeriod?: *int | fn.#Fn
					Name?:          *string | fn.#Fn
				} | fn.#If
			} | fn.#If
			OpenZFSConfiguration?: *{
				CopyTagsToSnapshots?: *bool | fn.#Fn
				DataCompressionType?: *string | fn.#Fn
				NfsExports?:          *[...{
					ClientConfigurations: *[...{
						Clients: *string | fn.#Fn
						Options: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					}] | fn.#If
				}] | fn.#If
				Options?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				OriginSnapshot?: *{
					CopyStrategy: *string | fn.#Fn
					SnapshotARN:  *string | fn.#Fn
				} | fn.#If
				ParentVolumeId:                 *string | fn.#Fn
				ReadOnly?:                      *bool | fn.#Fn
				RecordSizeKiB?:                 *int | fn.#Fn
				StorageCapacityQuotaGiB?:       *int | fn.#Fn
				StorageCapacityReservationGiB?: *int | fn.#Fn
				UserAndGroupQuotas?:            *[...{
					Id:                      *int | fn.#Fn
					StorageCapacityQuotaGiB: *int | fn.#Fn
					Type:                    *string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VolumeType?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
