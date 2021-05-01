package cacentral1

import "github.com/TangoGroup/aws/fn"

#NimbleStudio: {
	#LaunchProfile: {
		Type: "AWS::NimbleStudio::LaunchProfile"
		Properties: {
			Description?:                  string | fn.#Fn
			Ec2SubnetIds:                  [...(string | fn.#Fn)] | (string | fn.#Fn)
			LaunchProfileProtocolVersions: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Name:                          string | fn.#Fn
			StreamConfiguration:           {
				ClipboardMode:              string | fn.#Fn
				Ec2InstanceTypes:           [...(string | fn.#Fn)] | (string | fn.#Fn)
				MaxSessionLengthInMinutes?: number | fn.#Fn
				StreamingImageIds:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			StudioComponentIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
			StudioId:           string | fn.#Fn
			Tags?:              {
				[string]: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StreamingImage: {
		Type: "AWS::NimbleStudio::StreamingImage"
		Properties: {
			Description?: string | fn.#Fn
			Ec2ImageId:   string | fn.#Fn
			Name:         string | fn.#Fn
			StudioId:     string | fn.#Fn
			Tags?:        {
				[string]: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Studio: {
		Type: "AWS::NimbleStudio::Studio"
		Properties: {
			AdminRoleArn:                   string | fn.#Fn
			DisplayName:                    string | fn.#Fn
			StudioEncryptionConfiguration?: {
				KeyArn?: string | fn.#Fn
				KeyType: string | fn.#Fn
			} | fn.#If
			StudioName: string | fn.#Fn
			Tags?:      {
				[string]: string | fn.#Fn
			} | fn.#If
			UserRoleArn: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StudioComponent: {
		Type: "AWS::NimbleStudio::StudioComponent"
		Properties: {
			Configuration?: {
				ActiveDirectoryConfiguration?: {
					ComputerAttributes?: [...{
						Name?:  string | fn.#Fn
						Value?: string | fn.#Fn
					}] | fn.#If
					DirectoryId?:                         string | fn.#Fn
					OrganizationalUnitDistinguishedName?: string | fn.#Fn
				} | fn.#If
				ComputeFarmConfiguration?: {
					ActiveDirectoryUser?: string | fn.#Fn
					Endpoint?:            string | fn.#Fn
				} | fn.#If
				LicenseServiceConfiguration?: {
					Endpoint?: string | fn.#Fn
				} | fn.#If
				SharedFileSystemConfiguration?: {
					Endpoint?:          string | fn.#Fn
					FileSystemId?:      string | fn.#Fn
					LinuxMountPoint?:   string | fn.#Fn
					ShareName?:         string | fn.#Fn
					WindowsMountDrive?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Description?:           string | fn.#Fn
			Ec2SecurityGroupIds?:   [...(string | fn.#Fn)] | (string | fn.#Fn)
			InitializationScripts?: [...{
				LaunchProfileProtocolVersion?: string | fn.#Fn
				Platform?:                     string | fn.#Fn
				RunContext?:                   string | fn.#Fn
				Script?:                       string | fn.#Fn
			}] | fn.#If
			Name:              string | fn.#Fn
			ScriptParameters?: [...{
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			}] | fn.#If
			StudioId: string | fn.#Fn
			Subtype?: string | fn.#Fn
			Tags?:    {
				[string]: string | fn.#Fn
			} | fn.#If
			Type: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
