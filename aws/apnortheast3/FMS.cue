package apnortheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#FMS: {
	#NotificationChannel: {
		Type: "AWS::FMS::NotificationChannel"
		Properties: {
			SnsRoleName: *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^([^\s]+)$"#)) | fn.#Fn
			SnsTopicArn: *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^([^\s]+)$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
