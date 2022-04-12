package apsouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#KinesisVideo: {
	#SignalingChannel: {
		Type: "AWS::KinesisVideo::SignalingChannel"
		Properties: {
			MessageTtlSeconds?: *(>=5 & <=120) | fn.#Fn
			Name?:              *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z0-9_.-]+"#)) | fn.#Fn
			Tags?:              *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type?: *("SINGLE_MASTER") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Stream: {
		Type: "AWS::KinesisVideo::Stream"
		Properties: {
			DataRetentionInHours?: *int | fn.#Fn
			DeviceName?:           *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_.-]+"#)) | fn.#Fn
			KmsKeyId?:             *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#".+"#)) | fn.#Fn
			MediaType?:            *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[\w\-\.\+]+/[\w\-\.\+]+(,[\w\-\.\+]+/[\w\-\.\+]+)*"#)) | fn.#Fn
			Name?:                 *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z0-9_.-]+"#)) | fn.#Fn
			Tags?:                 *[...{
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
