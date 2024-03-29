package mecentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#DMS: {
	#Certificate: {
		Type: "AWS::DMS::Certificate"
		Properties: {
			CertificateIdentifier?: *string | fn.#Fn
			CertificatePem?:        *string | fn.#Fn
			CertificateWallet?:     *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Endpoint: {
		Type: "AWS::DMS::Endpoint"
		Properties: {
			CertificateArn?: *string | fn.#Fn
			DatabaseName?:   *string | fn.#Fn
			DocDbSettings?:  *{
				DocsToInvestigate?:           *int | fn.#Fn
				ExtractDocId?:                *bool | fn.#Fn
				NestingLevel?:                *string | fn.#Fn
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
			} | fn.#If
			DynamoDbSettings?: *{
				ServiceAccessRoleArn?: *string | fn.#Fn
			} | fn.#If
			ElasticsearchSettings?: *{
				EndpointUri?:             *string | fn.#Fn
				ErrorRetryDuration?:      *int | fn.#Fn
				FullLoadErrorPercentage?: *int | fn.#Fn
				ServiceAccessRoleArn?:    *string | fn.#Fn
			} | fn.#If
			EndpointIdentifier?:        *string | fn.#Fn
			EndpointType:               *string | fn.#Fn
			EngineName:                 *string | fn.#Fn
			ExtraConnectionAttributes?: *string | fn.#Fn
			GcpMySQLSettings?:          *{
				AfterConnectScript?:            *string | fn.#Fn
				CleanSourceMetadataOnMismatch?: *bool | fn.#Fn
				DatabaseName?:                  *string | fn.#Fn
				EventsPollInterval?:            *int | fn.#Fn
				MaxFileSize?:                   *int | fn.#Fn
				ParallelLoadThreads?:           *int | fn.#Fn
				Password?:                      *string | fn.#Fn
				Port?:                          *int | fn.#Fn
				SecretsManagerAccessRoleArn?:   *string | fn.#Fn
				SecretsManagerSecretId?:        *string | fn.#Fn
				ServerName?:                    *string | fn.#Fn
				ServerTimezone?:                *string | fn.#Fn
				Username?:                      *string | fn.#Fn
			} | fn.#If
			IbmDb2Settings?: *{
				CurrentLsn?:                  *string | fn.#Fn
				MaxKBytesPerRead?:            *int | fn.#Fn
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
				SetDataCaptureChanges?:       *bool | fn.#Fn
			} | fn.#If
			KafkaSettings?: *{
				Broker?:                      *string | fn.#Fn
				IncludeControlDetails?:       *bool | fn.#Fn
				IncludeNullAndEmpty?:         *bool | fn.#Fn
				IncludePartitionValue?:       *bool | fn.#Fn
				IncludeTableAlterOperations?: *bool | fn.#Fn
				IncludeTransactionDetails?:   *bool | fn.#Fn
				MessageFormat?:               *string | fn.#Fn
				MessageMaxBytes?:             *int | fn.#Fn
				NoHexPrefix?:                 *bool | fn.#Fn
				PartitionIncludeSchemaTable?: *bool | fn.#Fn
				SaslPassword?:                *string | fn.#Fn
				SaslUserName?:                *string | fn.#Fn
				SecurityProtocol?:            *string | fn.#Fn
				SslCaCertificateArn?:         *string | fn.#Fn
				SslClientCertificateArn?:     *string | fn.#Fn
				SslClientKeyArn?:             *string | fn.#Fn
				SslClientKeyPassword?:        *string | fn.#Fn
				Topic?:                       *string | fn.#Fn
			} | fn.#If
			KinesisSettings?: *{
				IncludeControlDetails?:       *bool | fn.#Fn
				IncludeNullAndEmpty?:         *bool | fn.#Fn
				IncludePartitionValue?:       *bool | fn.#Fn
				IncludeTableAlterOperations?: *bool | fn.#Fn
				IncludeTransactionDetails?:   *bool | fn.#Fn
				MessageFormat?:               *string | fn.#Fn
				NoHexPrefix?:                 *bool | fn.#Fn
				PartitionIncludeSchemaTable?: *bool | fn.#Fn
				ServiceAccessRoleArn?:        *string | fn.#Fn
				StreamArn?:                   *string | fn.#Fn
			} | fn.#If
			KmsKeyId?:                   *string | fn.#Fn
			MicrosoftSqlServerSettings?: *{
				BcpPacketSize?:               *int | fn.#Fn
				ControlTablesFileGroup?:      *string | fn.#Fn
				QuerySingleAlwaysOnNode?:     *bool | fn.#Fn
				ReadBackupOnly?:              *bool | fn.#Fn
				SafeguardPolicy?:             *string | fn.#Fn
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
				UseBcpFullLoad?:              *bool | fn.#Fn
				UseThirdPartyBackupDevice?:   *bool | fn.#Fn
			} | fn.#If
			MongoDbSettings?: *{
				AuthMechanism?:               *string | fn.#Fn
				AuthSource?:                  *string | fn.#Fn
				AuthType?:                    *string | fn.#Fn
				DatabaseName?:                *string | fn.#Fn
				DocsToInvestigate?:           *string | fn.#Fn
				ExtractDocId?:                *string | fn.#Fn
				NestingLevel?:                *string | fn.#Fn
				Password?:                    *string | fn.#Fn
				Port?:                        *int | fn.#Fn
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
				ServerName?:                  *string | fn.#Fn
				Username?:                    *string | fn.#Fn
			} | fn.#If
			MySqlSettings?: *{
				AfterConnectScript?:            *string | fn.#Fn
				CleanSourceMetadataOnMismatch?: *bool | fn.#Fn
				EventsPollInterval?:            *int | fn.#Fn
				MaxFileSize?:                   *int | fn.#Fn
				ParallelLoadThreads?:           *int | fn.#Fn
				SecretsManagerAccessRoleArn?:   *string | fn.#Fn
				SecretsManagerSecretId?:        *string | fn.#Fn
				ServerTimezone?:                *string | fn.#Fn
				TargetDbType?:                  *string | fn.#Fn
			} | fn.#If
			NeptuneSettings?: *{
				ErrorRetryDuration?:   *int | fn.#Fn
				IamAuthEnabled?:       *bool | fn.#Fn
				MaxFileSize?:          *int | fn.#Fn
				MaxRetryCount?:        *int | fn.#Fn
				S3BucketFolder?:       *string | fn.#Fn
				S3BucketName?:         *string | fn.#Fn
				ServiceAccessRoleArn?: *string | fn.#Fn
			} | fn.#If
			OracleSettings?: *{
				AccessAlternateDirectly?:                *bool | fn.#Fn
				AddSupplementalLogging?:                 *bool | fn.#Fn
				AdditionalArchivedLogDestId?:            *int | fn.#Fn
				AllowSelectNestedTables?:                *bool | fn.#Fn
				ArchivedLogDestId?:                      *int | fn.#Fn
				ArchivedLogsOnly?:                       *bool | fn.#Fn
				AsmPassword?:                            *string | fn.#Fn
				AsmServer?:                              *string | fn.#Fn
				AsmUser?:                                *string | fn.#Fn
				CharLengthSemantics?:                    *string | fn.#Fn
				DirectPathNoLog?:                        *bool | fn.#Fn
				DirectPathParallelLoad?:                 *bool | fn.#Fn
				EnableHomogenousTablespace?:             *bool | fn.#Fn
				ExtraArchivedLogDestIds?:                [...(*int | fn.#Fn)] | (*int | fn.#Fn)
				FailTasksOnLobTruncation?:               *bool | fn.#Fn
				NumberDatatypeScale?:                    *int | fn.#Fn
				OraclePathPrefix?:                       *string | fn.#Fn
				ParallelAsmReadThreads?:                 *int | fn.#Fn
				ReadAheadBlocks?:                        *int | fn.#Fn
				ReadTableSpaceName?:                     *bool | fn.#Fn
				ReplacePathPrefix?:                      *bool | fn.#Fn
				RetryInterval?:                          *int | fn.#Fn
				SecretsManagerAccessRoleArn?:            *string | fn.#Fn
				SecretsManagerOracleAsmAccessRoleArn?:   *string | fn.#Fn
				SecretsManagerOracleAsmSecretId?:        *string | fn.#Fn
				SecretsManagerSecretId?:                 *string | fn.#Fn
				SecurityDbEncryption?:                   *string | fn.#Fn
				SecurityDbEncryptionName?:               *string | fn.#Fn
				SpatialDataOptionToGeoJsonFunctionName?: *string | fn.#Fn
				StandbyDelayTime?:                       *int | fn.#Fn
				UseAlternateFolderForOnline?:            *bool | fn.#Fn
				UseBFile?:                               *bool | fn.#Fn
				UseDirectPathFullLoad?:                  *bool | fn.#Fn
				UseLogminerReader?:                      *bool | fn.#Fn
				UsePathPrefix?:                          *string | fn.#Fn
			} | fn.#If
			Password?:           *string | fn.#Fn
			Port?:               *int | fn.#Fn
			PostgreSqlSettings?: *{
				AfterConnectScript?:          *string | fn.#Fn
				CaptureDdls?:                 *bool | fn.#Fn
				DdlArtifactsSchema?:          *string | fn.#Fn
				ExecuteTimeout?:              *int | fn.#Fn
				FailTasksOnLobTruncation?:    *bool | fn.#Fn
				HeartbeatEnable?:             *bool | fn.#Fn
				HeartbeatFrequency?:          *int | fn.#Fn
				HeartbeatSchema?:             *string | fn.#Fn
				MaxFileSize?:                 *int | fn.#Fn
				PluginName?:                  *string | fn.#Fn
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
				SlotName?:                    *string | fn.#Fn
			} | fn.#If
			RedisSettings?: *{
				AuthPassword?:        *string | fn.#Fn
				AuthType?:            *string | fn.#Fn
				AuthUserName?:        *string | fn.#Fn
				Port?:                *number | fn.#Fn
				ServerName?:          *string | fn.#Fn
				SslCaCertificateArn?: *string | fn.#Fn
				SslSecurityProtocol?: *string | fn.#Fn
			} | fn.#If
			RedshiftSettings?: *{
				AcceptAnyDate?:                *bool | fn.#Fn
				AfterConnectScript?:           *string | fn.#Fn
				BucketFolder?:                 *string | fn.#Fn
				BucketName?:                   *string | fn.#Fn
				CaseSensitiveNames?:           *bool | fn.#Fn
				CompUpdate?:                   *bool | fn.#Fn
				ConnectionTimeout?:            *int | fn.#Fn
				DateFormat?:                   *string | fn.#Fn
				EmptyAsNull?:                  *bool | fn.#Fn
				EncryptionMode?:               *string | fn.#Fn
				ExplicitIds?:                  *bool | fn.#Fn
				FileTransferUploadStreams?:    *int | fn.#Fn
				LoadTimeout?:                  *int | fn.#Fn
				MaxFileSize?:                  *int | fn.#Fn
				RemoveQuotes?:                 *bool | fn.#Fn
				ReplaceChars?:                 *string | fn.#Fn
				ReplaceInvalidChars?:          *string | fn.#Fn
				SecretsManagerAccessRoleArn?:  *string | fn.#Fn
				SecretsManagerSecretId?:       *string | fn.#Fn
				ServerSideEncryptionKmsKeyId?: *string | fn.#Fn
				ServiceAccessRoleArn?:         *string | fn.#Fn
				TimeFormat?:                   *string | fn.#Fn
				TrimBlanks?:                   *bool | fn.#Fn
				TruncateColumns?:              *bool | fn.#Fn
				WriteBufferSize?:              *int | fn.#Fn
			} | fn.#If
			ResourceIdentifier?: *string | fn.#Fn
			S3Settings?:         *{
				AddColumnName?:                        *bool | fn.#Fn
				BucketFolder?:                         *string | fn.#Fn
				BucketName?:                           *string | fn.#Fn
				CannedAclForObjects?:                  *string | fn.#Fn
				CdcInsertsAndUpdates?:                 *bool | fn.#Fn
				CdcInsertsOnly?:                       *bool | fn.#Fn
				CdcMaxBatchInterval?:                  *int | fn.#Fn
				CdcMinFileSize?:                       *int | fn.#Fn
				CdcPath?:                              *string | fn.#Fn
				CompressionType?:                      *string | fn.#Fn
				CsvDelimiter?:                         *string | fn.#Fn
				CsvNoSupValue?:                        *string | fn.#Fn
				CsvNullValue?:                         *string | fn.#Fn
				CsvRowDelimiter?:                      *string | fn.#Fn
				DataFormat?:                           *string | fn.#Fn
				DataPageSize?:                         *int | fn.#Fn
				DatePartitionDelimiter?:               *string | fn.#Fn
				DatePartitionEnabled?:                 *bool | fn.#Fn
				DatePartitionSequence?:                *string | fn.#Fn
				DatePartitionTimezone?:                *string | fn.#Fn
				DictPageSizeLimit?:                    *int | fn.#Fn
				EnableStatistics?:                     *bool | fn.#Fn
				EncodingType?:                         *string | fn.#Fn
				EncryptionMode?:                       *string | fn.#Fn
				ExternalTableDefinition?:              *string | fn.#Fn
				IgnoreHeaderRows?:                     *int | fn.#Fn
				IncludeOpForFullLoad?:                 *bool | fn.#Fn
				MaxFileSize?:                          *int | fn.#Fn
				ParquetTimestampInMillisecond?:        *bool | fn.#Fn
				ParquetVersion?:                       *string | fn.#Fn
				PreserveTransactions?:                 *bool | fn.#Fn
				Rfc4180?:                              *bool | fn.#Fn
				RowGroupLength?:                       *int | fn.#Fn
				ServerSideEncryptionKmsKeyId?:         *string | fn.#Fn
				ServiceAccessRoleArn?:                 *string | fn.#Fn
				TimestampColumnName?:                  *string | fn.#Fn
				UseCsvNoSupValue?:                     *bool | fn.#Fn
				UseTaskStartTimeForFullLoadTimestamp?: *bool | fn.#Fn
			} | fn.#If
			ServerName?:     *string | fn.#Fn
			SslMode?:        *string | fn.#Fn
			SybaseSettings?: *{
				SecretsManagerAccessRoleArn?: *string | fn.#Fn
				SecretsManagerSecretId?:      *string | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Username?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EventSubscription: {
		Type: "AWS::DMS::EventSubscription"
		Properties: {
			Enabled?:          *bool | fn.#Fn
			EventCategories?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SnsTopicArn:       *string | fn.#Fn
			SourceIds?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SourceType?:       *string | fn.#Fn
			SubscriptionName?: *string | fn.#Fn
			Tags?:             *[...{
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
	#ReplicationInstance: {
		Type: "AWS::DMS::ReplicationInstance"
		Properties: {
			AllocatedStorage?:                 *int | fn.#Fn
			AllowMajorVersionUpgrade?:         *bool | fn.#Fn
			AutoMinorVersionUpgrade?:          *bool | fn.#Fn
			AvailabilityZone?:                 *string | fn.#Fn
			EngineVersion?:                    *string | fn.#Fn
			KmsKeyId?:                         *string | fn.#Fn
			MultiAZ?:                          *bool | fn.#Fn
			PreferredMaintenanceWindow?:       *string | fn.#Fn
			PubliclyAccessible?:               *bool | fn.#Fn
			ReplicationInstanceClass:          *string | fn.#Fn
			ReplicationInstanceIdentifier?:    *string | fn.#Fn
			ReplicationSubnetGroupIdentifier?: *string | fn.#Fn
			ResourceIdentifier?:               *string | fn.#Fn
			Tags?:                             *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcSecurityGroupIds?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReplicationSubnetGroup: {
		Type: "AWS::DMS::ReplicationSubnetGroup"
		Properties: {
			ReplicationSubnetGroupDescription: *string | fn.#Fn
			ReplicationSubnetGroupIdentifier?: *string | fn.#Fn
			SubnetIds:                         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:                             *[...{
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
	#ReplicationTask: {
		Type: "AWS::DMS::ReplicationTask"
		Properties: {
			CdcStartPosition?:          *string | fn.#Fn
			CdcStartTime?:              *number | fn.#Fn
			CdcStopPosition?:           *string | fn.#Fn
			MigrationType:              *string | fn.#Fn
			ReplicationInstanceArn:     *string | fn.#Fn
			ReplicationTaskIdentifier?: *string | fn.#Fn
			ReplicationTaskSettings?:   *string | fn.#Fn
			ResourceIdentifier?:        *string | fn.#Fn
			SourceEndpointArn:          *string | fn.#Fn
			TableMappings:              *string | fn.#Fn
			Tags?:                      *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetEndpointArn: *string | fn.#Fn
			TaskData?:         *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
