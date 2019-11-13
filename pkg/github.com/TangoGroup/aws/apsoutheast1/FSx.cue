package apsoutheast1

import "github.com/TangoGroup/aws/fn"

FSx :: {
	FileSystem :: {
		Type: "AWS::FSx::FileSystem"
		Properties: {
			BackupId?:      string | fn.Fn
			FileSystemType: string | fn.Fn
			KmsKeyId?:      string | fn.Fn
			LustreConfiguration?: {
			}
			SecurityGroupIds?: [...(string | fn.Fn)]
			StorageCapacity?: int | fn.Fn
			SubnetIds: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			WindowsConfiguration?: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
