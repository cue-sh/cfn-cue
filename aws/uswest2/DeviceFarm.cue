package uswest2

import "github.com/cue-sh/cfn-cue/aws/fn"

#DeviceFarm: {
	#DevicePool: {
		Type: "AWS::DeviceFarm::DevicePool"
		Properties: {
			Description?: *string | fn.#Fn
			MaxDevices?:  *int | fn.#Fn
			Name:         *string | fn.#Fn
			ProjectArn:   *string | fn.#Fn
			Rules:        *[...{
				Attribute?: *string | fn.#Fn
				Operator?:  *string | fn.#Fn
				Value?:     *string | fn.#Fn
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
	#InstanceProfile: {
		Type: "AWS::DeviceFarm::InstanceProfile"
		Properties: {
			Description?:                   *string | fn.#Fn
			ExcludeAppPackagesFromCleanup?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name:                           *string | fn.#Fn
			PackageCleanup?:                *bool | fn.#Fn
			RebootAfterUse?:                *bool | fn.#Fn
			Tags?:                          *[...{
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
	#NetworkProfile: {
		Type: "AWS::DeviceFarm::NetworkProfile"
		Properties: {
			Description?:           *string | fn.#Fn
			DownlinkBandwidthBits?: *int | fn.#Fn
			DownlinkDelayMs?:       *int | fn.#Fn
			DownlinkJitterMs?:      *int | fn.#Fn
			DownlinkLossPercent?:   *int | fn.#Fn
			Name:                   *string | fn.#Fn
			ProjectArn:             *string | fn.#Fn
			Tags?:                  *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UplinkBandwidthBits?: *int | fn.#Fn
			UplinkDelayMs?:       *int | fn.#Fn
			UplinkJitterMs?:      *int | fn.#Fn
			UplinkLossPercent?:   *int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Project: {
		Type: "AWS::DeviceFarm::Project"
		Properties: {
			DefaultJobTimeoutMinutes?: *int | fn.#Fn
			Name:                      *string | fn.#Fn
			Tags?:                     *[...{
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
	#TestGridProject: {
		Type: "AWS::DeviceFarm::TestGridProject"
		Properties: {
			Description?: *string | fn.#Fn
			Name:         *string | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcConfig?: *{
				SecurityGroupIds: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				SubnetIds:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				VpcId:            *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCEConfiguration: {
		Type: "AWS::DeviceFarm::VPCEConfiguration"
		Properties: {
			ServiceDnsName: *string | fn.#Fn
			Tags?:          *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpceConfigurationDescription?: *string | fn.#Fn
			VpceConfigurationName:         *string | fn.#Fn
			VpceServiceName:               *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
