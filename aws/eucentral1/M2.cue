package eucentral1

import "github.com/cue-sh/cfn-cue/aws/fn"

#M2: {
	#Application: {
		Type: "AWS::M2::Application"
		Properties: {
			Definition:   *{} | fn.#If
			Description?: *string | fn.#Fn
			EngineType:   *("microfocus" | "bluage") | fn.#Fn
			Name:         *(=~#"^[A-Za-z0-9][A-Za-z0-9_\-]{1,59}$"#) | fn.#Fn
			Tags?:        *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Environment: {
		Type: "AWS::M2::Environment"
		Properties: {
			Description?:            *string | fn.#Fn
			EngineType:              *("microfocus" | "bluage") | fn.#Fn
			EngineVersion?:          *(=~#"^\S{1,10}$"#) | fn.#Fn
			HighAvailabilityConfig?: *{
				DesiredCapacity: *(>=1 & <=100) | fn.#Fn
			} | fn.#If
			InstanceType:                *(=~#"^\S{1,20}$"#) | fn.#Fn
			Name:                        *(=~#"^[A-Za-z0-9][A-Za-z0-9_\-]{1,59}$"#) | fn.#Fn
			PreferredMaintenanceWindow?: *(=~#"^\S{1,50}$"#) | fn.#Fn
			PubliclyAccessible?:         *bool | fn.#Fn
			SecurityGroupIds?:           [...(*(=~#"^\S{1,50}$"#) | fn.#Fn)] | (*(=~#"^\S{1,50}$"#) | fn.#Fn)
			StorageConfigurations?:      *[...{
				Efs?: *{
					FileSystemId: *string | fn.#Fn
					MountPoint:   *string | fn.#Fn
				} | fn.#If
				Fsx?: *{
					FileSystemId: *string | fn.#Fn
					MountPoint:   *string | fn.#Fn
				} | fn.#If
			}] | fn.#If
			SubnetIds?: [...(*(=~#"^\S{1,50}$"#) | fn.#Fn)] | (*(=~#"^\S{1,50}$"#) | fn.#Fn)
			Tags?:      *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
