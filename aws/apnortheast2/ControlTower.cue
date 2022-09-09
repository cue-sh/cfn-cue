package apnortheast2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#ControlTower: {
	#EnabledControl: {
		Type: "AWS::ControlTower::EnabledControl"
		Properties: {
			ControlIdentifier: *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[0-9a-zA-Z_\-:\/]+$"#)) | fn.#Fn
			TargetIdentifier:  *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[0-9a-zA-Z_\-:\/]+$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
