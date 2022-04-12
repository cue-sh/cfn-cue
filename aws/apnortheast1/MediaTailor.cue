package apnortheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#MediaTailor: {
	#PlaybackConfiguration: {
		Type: "AWS::MediaTailor::PlaybackConfiguration"
		Properties: {
			AdDecisionServerUrl: *string | fn.#Fn
			AvailSuppression?:   *{
				Mode?:  *("OFF" | "BEHIND_LIVE_EDGE") | fn.#Fn
				Value?: *string | fn.#Fn
			} | fn.#If
			Bumper?: *{
				EndUrl?:   *string | fn.#Fn
				StartUrl?: *string | fn.#Fn
			} | fn.#If
			CdnConfiguration?: *{
				AdSegmentUrlPrefix?:      *string | fn.#Fn
				ContentSegmentUrlPrefix?: *string | fn.#Fn
			} | fn.#If
			ConfigurationAliases?: *{
				[string]: *{
					[string]: _
				} | fn.#Fn
			} | fn.#If
			DashConfiguration?: *{
				MpdLocation?:        *string | fn.#Fn
				OriginManifestType?: *("SINGLE_PERIOD" | "MULTI_PERIOD") | fn.#Fn
			} | fn.#If
			LivePreRollConfiguration?: *{
				AdDecisionServerUrl?: *string | fn.#Fn
				MaxDurationSeconds?:  *int | fn.#Fn
			} | fn.#If
			ManifestProcessingRules?: *{
				AdMarkerPassthrough?: *{
					Enabled?: *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			Name:                                 *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]+$"#)) | fn.#Fn
			PersonalizationThresholdSeconds?:     *int | fn.#Fn
			SessionInitializationEndpointPrefix?: *string | fn.#Fn
			SlateAdUrl?:                          *string | fn.#Fn
			Tags?:                                *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TranscodeProfileName?: *string | fn.#Fn
			VideoContentSourceUrl: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
