package usgovwest1

import "github.com/TangoGroup/aws/fn"

AppStream :: {
	DirectoryConfig :: {
		Type: "AWS::AppStream::DirectoryConfig"
		Properties: {
			DirectoryName: string | fn.Fn
			OrganizationalUnitDistinguishedNames: [...(string | fn.Fn)]
			ServiceAccountCredentials: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Fleet :: {
		Type: "AWS::AppStream::Fleet"
		Properties: {
			ComputeCapacity: {
			}
			Description?:                string | fn.Fn
			DisconnectTimeoutInSeconds?: int | fn.Fn
			DisplayName?:                string | fn.Fn
			DomainJoinInfo?: {
			}
			EnableDefaultInternetAccess?:    bool | fn.Fn
			FleetType?:                      string | fn.Fn
			IdleDisconnectTimeoutInSeconds?: int | fn.Fn
			ImageArn?:                       string | fn.Fn
			ImageName?:                      string | fn.Fn
			InstanceType:                    string | fn.Fn
			MaxUserDurationInSeconds?:       int | fn.Fn
			Name?:                           string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ImageBuilder :: {
		Type: "AWS::AppStream::ImageBuilder"
		Properties: {
			AccessEndpoints?: [...{
			}]
			AppstreamAgentVersion?: string | fn.Fn
			Description?:           string | fn.Fn
			DisplayName?:           string | fn.Fn
			DomainJoinInfo?: {
			}
			EnableDefaultInternetAccess?: bool | fn.Fn
			ImageArn?:                    string | fn.Fn
			ImageName?:                   string | fn.Fn
			InstanceType:                 string | fn.Fn
			Name?:                        string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Stack :: {
		Type: "AWS::AppStream::Stack"
		Properties: {
			AccessEndpoints?: [...{
			}]
			ApplicationSettings?: {
			}
			AttributesToDelete?: [...(string | fn.Fn)]
			DeleteStorageConnectors?: bool | fn.Fn
			Description?:             string | fn.Fn
			DisplayName?:             string | fn.Fn
			EmbedHostDomains?: [...(string | fn.Fn)]
			FeedbackURL?: string | fn.Fn
			Name?:        string | fn.Fn
			RedirectURL?: string | fn.Fn
			StorageConnectors?: [...{
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			UserSettings?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StackFleetAssociation :: {
		Type: "AWS::AppStream::StackFleetAssociation"
		Properties: {
			FleetName: string | fn.Fn
			StackName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StackUserAssociation :: {
		Type: "AWS::AppStream::StackUserAssociation"
		Properties: {
			AuthenticationType:     string | fn.Fn
			SendEmailNotification?: bool | fn.Fn
			StackName:              string | fn.Fn
			UserName:               string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	User :: {
		Type: "AWS::AppStream::User"
		Properties: {
			AuthenticationType: string | fn.Fn
			FirstName?:         string | fn.Fn
			LastName?:          string | fn.Fn
			MessageAction?:     string | fn.Fn
			UserName:           string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
