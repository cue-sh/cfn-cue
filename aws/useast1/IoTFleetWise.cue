package useast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IoTFleetWise: {
	#Campaign: {
		Type: "AWS::IoTFleetWise::Campaign"
		Properties: {
			Action:           *("APPROVE" | "SUSPEND" | "RESUME" | "UPDATE") | fn.#Fn
			CollectionScheme: *{
				ConditionBasedCollectionScheme?: *{
					ConditionLanguageVersion?: *int | fn.#Fn
					Expression:                *string | fn.#Fn
					MinimumTriggerIntervalMs?: *number | fn.#Fn
					TriggerMode?:              *string | fn.#Fn
				} | fn.#If
				TimeBasedCollectionScheme?: *{
					PeriodMs: *number | fn.#Fn
				} | fn.#If
			} | fn.#If
			Compression?:                   *("OFF" | "SNAPPY") | fn.#Fn
			DataExtraDimensions?:           [...(*(strings.MinRunes(1) & strings.MaxRunes(150) & (=~#"^[a-zA-Z0-9_.]+$"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(150) & (=~#"^[a-zA-Z0-9_.]+$"#)) | fn.#Fn)
			Description?:                   *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^[^\u0000-\u001F\u007F]+$"#)) | fn.#Fn
			DiagnosticsMode?:               *("OFF" | "SEND_ACTIVE_DTCS") | fn.#Fn
			ExpiryTime?:                    *string | fn.#Fn
			Name:                           *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z\d\-_:]+$"#)) | fn.#Fn
			PostTriggerCollectionDuration?: *number | fn.#Fn
			Priority?:                      *int | fn.#Fn
			SignalCatalogArn:               *string | fn.#Fn
			SignalsToCollect?:              *[...{
				MaxSampleCount?:            *(>=1 & <=4294967295) | fn.#Fn
				MinimumSamplingIntervalMs?: *number | fn.#Fn
				Name:                       *(strings.MinRunes(1) & strings.MaxRunes(150) & (=~#"^[\w|*|-]+(\.[\w|*|-]+)*$"#)) | fn.#Fn
			}] | fn.#If
			SpoolingMode?: *("OFF" | "TO_DISK") | fn.#Fn
			StartTime?:    *string | fn.#Fn
			Tags?:         *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetArn: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DecoderManifest: {
		Type: "AWS::IoTFleetWise::DecoderManifest"
		Properties: {
			Description?:       *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^[^\u0000-\u001F\u007F]+$"#)) | fn.#Fn
			ModelManifestArn:   *string | fn.#Fn
			Name:               *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z\d\-_:]+$"#)) | fn.#Fn
			NetworkInterfaces?: [...(*{
				[string]: _
			} | fn.#Fn)] | (*{
				[string]: _
			} | fn.#Fn)
			SignalDecoders?: [...(*{
				[string]: _
			} | fn.#Fn)] | (*{
				[string]: _
			} | fn.#Fn)
			Status?: *("ACTIVE" | "DRAFT") | fn.#Fn
			Tags?:   *[...{
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
	#Fleet: {
		Type: "AWS::IoTFleetWise::Fleet"
		Properties: {
			Description?:     *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^[^\u0000-\u001F\u007F]+$"#)) | fn.#Fn
			Id:               *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z0-9:_-]+$"#)) | fn.#Fn
			SignalCatalogArn: *string | fn.#Fn
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
	#ModelManifest: {
		Type: "AWS::IoTFleetWise::ModelManifest"
		Properties: {
			Description?:     *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^[^\u0000-\u001F\u007F]+$"#)) | fn.#Fn
			Name:             *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z\d\-_:]+$"#)) | fn.#Fn
			Nodes?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SignalCatalogArn: *string | fn.#Fn
			Status?:          *("ACTIVE" | "DRAFT") | fn.#Fn
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
	#SignalCatalog: {
		Type: "AWS::IoTFleetWise::SignalCatalog"
		Properties: {
			Description?: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^[^\u0000-\u001F\u007F]+$"#)) | fn.#Fn
			Name?:        *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z\d\-_:]+$"#)) | fn.#Fn
			Nodes?:       *[...{
				Actuator?: *{
					AllowedValues?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					AssignedValue?:     *string | fn.#Fn
					DataType:           *string | fn.#Fn
					Description?:       *string | fn.#Fn
					FullyQualifiedName: *string | fn.#Fn
					Max?:               *number | fn.#Fn
					Min?:               *number | fn.#Fn
					Unit?:              *string | fn.#Fn
				} | fn.#If
				Attribute?: *{
					AllowedValues?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					AssignedValue?:     *string | fn.#Fn
					DataType:           *string | fn.#Fn
					DefaultValue?:      *string | fn.#Fn
					Description?:       *string | fn.#Fn
					FullyQualifiedName: *string | fn.#Fn
					Max?:               *number | fn.#Fn
					Min?:               *number | fn.#Fn
					Unit?:              *string | fn.#Fn
				} | fn.#If
				Branch?: *{
					Description?:       *string | fn.#Fn
					FullyQualifiedName: *string | fn.#Fn
				} | fn.#If
				Sensor?: *{
					AllowedValues?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					DataType:           *string | fn.#Fn
					Description?:       *string | fn.#Fn
					FullyQualifiedName: *string | fn.#Fn
					Max?:               *number | fn.#Fn
					Min?:               *number | fn.#Fn
					Unit?:              *string | fn.#Fn
				} | fn.#If
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
	#Vehicle: {
		Type: "AWS::IoTFleetWise::Vehicle"
		Properties: {
			AssociationBehavior?: *("CreateIotThing" | "ValidateIotThingExists") | fn.#Fn
			Attributes?:          *{
				[string]: *string | fn.#Fn
			} | fn.#If
			DecoderManifestArn: *string | fn.#Fn
			ModelManifestArn:   *string | fn.#Fn
			Name:               *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z\d\-_:]+$"#)) | fn.#Fn
			Tags?:              *[...{
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
