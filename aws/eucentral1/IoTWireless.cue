package eucentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IoTWireless: {
	#FuotaTask: {
		Type: "AWS::IoTWireless::FuotaTask"
		Properties: {
			AssociateMulticastGroup?:    *string | fn.#Fn
			AssociateWirelessDevice?:    *string | fn.#Fn
			Description?:                *string | fn.#Fn
			DisassociateMulticastGroup?: *string | fn.#Fn
			DisassociateWirelessDevice?: *string | fn.#Fn
			FirmwareUpdateImage:         *(strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.#Fn
			FirmwareUpdateRole:          *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			LoRaWAN:                     *{
				RfRegion:   *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
				StartTime?: *string | fn.#Fn
			} | fn.#If
			Name?: *string | fn.#Fn
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
	#MulticastGroup: {
		Type: "AWS::IoTWireless::MulticastGroup"
		Properties: {
			AssociateWirelessDevice?:    *string | fn.#Fn
			Description?:                *string | fn.#Fn
			DisassociateWirelessDevice?: *string | fn.#Fn
			LoRaWAN:                     *{
				DlClass:                   *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
				NumberOfDevicesInGroup?:   *int | fn.#Fn
				NumberOfDevicesRequested?: *int | fn.#Fn
				RfRegion:                  *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
			} | fn.#If
			Name?: *string | fn.#Fn
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
	#NetworkAnalyzerConfiguration: {
		Type: "AWS::IoTWireless::NetworkAnalyzerConfiguration"
		Properties: {
			Description?: *string | fn.#Fn
			Name:         *(=~#"^[a-zA-Z0-9-_]+$"#) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TraceContent?: *{
				[string]: _
			} | fn.#Fn
			WirelessDevices?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			WirelessGateways?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
