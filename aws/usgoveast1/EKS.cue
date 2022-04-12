package usgoveast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#EKS: {
	#Addon: {
		Type: "AWS::EKS::Addon"
		Properties: {
			AddonName:              *string | fn.#Fn
			AddonVersion?:          *string | fn.#Fn
			ClusterName:            *string | fn.#Fn
			ResolveConflicts?:      *("NONE" | "OVERWRITE") | fn.#Fn
			ServiceAccountRoleArn?: *string | fn.#Fn
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
	#Cluster: {
		Type: "AWS::EKS::Cluster"
		Properties: {
			EncryptionConfig?: *[...{
				Provider?: *{
					KeyArn?: *string | fn.#Fn
				} | fn.#If
				Resources?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			KubernetesNetworkConfig?: *{
				IpFamily?:        *("ipv4" | "ipv6") | fn.#Fn
				ServiceIpv4Cidr?: *string | fn.#Fn
				ServiceIpv6Cidr?: *string | fn.#Fn
			} | fn.#If
			Logging?: *{
				ClusterLogging?: *{
					EnabledTypes?: *[...{
						Type?: *("api" | "audit" | "authenticator" | "controllerManager" | "scheduler") | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			Name?:              *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[0-9A-Za-z][A-Za-z0-9\-_]*"#)) | fn.#Fn
			ResourcesVpcConfig: *{
				EndpointPrivateAccess?: *bool | fn.#Fn
				EndpointPublicAccess?:  *bool | fn.#Fn
				PublicAccessCidrs?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SecurityGroupIds?:      [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SubnetIds:              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			RoleArn: *string | fn.#Fn
			Tags?:   *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Version?: *(=~#"1\.\d\d"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#IdentityProviderConfig: {
		Type: "AWS::EKS::IdentityProviderConfig"
		Properties: {
			ClusterName:                 *string | fn.#Fn
			IdentityProviderConfigName?: *string | fn.#Fn
			Oidc?:                       *{
				ClientId:        *string | fn.#Fn
				GroupsClaim?:    *string | fn.#Fn
				GroupsPrefix?:   *string | fn.#Fn
				IssuerUrl:       *string | fn.#Fn
				RequiredClaims?: *[...{
					Key:   *(strings.MinRunes(1) & strings.MaxRunes(63)) | fn.#Fn
					Value: *(strings.MinRunes(1) & strings.MaxRunes(253)) | fn.#Fn
				}] | fn.#If
				UsernameClaim?:  *string | fn.#Fn
				UsernamePrefix?: *string | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type: *("oidc") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Nodegroup: {
		Type: "AWS::EKS::Nodegroup"
		Properties: {
			AmiType?:            *string | fn.#Fn
			CapacityType?:       *string | fn.#Fn
			ClusterName:         *string | fn.#Fn
			DiskSize?:           *number | fn.#Fn
			ForceUpdateEnabled?: *bool | fn.#Fn
			InstanceTypes?:      [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Labels?:             *{
				[string]: _
			} | fn.#Fn
			LaunchTemplate?: *{
				Id?:      *string | fn.#Fn
				Name?:    *string | fn.#Fn
				Version?: *string | fn.#Fn
			} | fn.#If
			NodeRole:        *string | fn.#Fn
			NodegroupName?:  *string | fn.#Fn
			ReleaseVersion?: *string | fn.#Fn
			RemoteAccess?:   *{
				Ec2SshKey:             *string | fn.#Fn
				SourceSecurityGroups?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			ScalingConfig?: *{
				DesiredSize?: *number | fn.#Fn
				MaxSize?:     *number | fn.#Fn
				MinSize?:     *number | fn.#Fn
			} | fn.#If
			Subnets: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:   *{
				[string]: _
			} | fn.#Fn
			Taints?: *[...{
				Effect?: *string | fn.#Fn
				Key?:    *string | fn.#Fn
				Value?:  *string | fn.#Fn
			}] | fn.#If
			UpdateConfig?: *{
				MaxUnavailable?:           *number | fn.#Fn
				MaxUnavailablePercentage?: *(>=1 & <=100) | fn.#Fn
			} | fn.#If
			Version?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
