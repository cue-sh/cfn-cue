package euwest1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#SupportApp: {
	#AccountAlias: {
		Type: "AWS::SupportApp::AccountAlias"
		Properties: AccountAlias: *(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"^[\w\- ]+$"#)) | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SlackChannelConfiguration: {
		Type: "AWS::SupportApp::SlackChannelConfiguration"
		Properties: {
			ChannelId:                        *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^\S+$"#)) | fn.#Fn
			ChannelName?:                     *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^.+$"#)) | fn.#Fn
			ChannelRoleArn:                   *(strings.MinRunes(31) & strings.MaxRunes(2048) & (=~#"^arn:aws[-a-z0-9]*:iam::[0-9]{12}:role\/(.+)$"#)) | fn.#Fn
			NotifyOnAddCorrespondenceToCase?: *bool | fn.#Fn
			NotifyOnCaseSeverity:             *("none" | "all" | "high") | fn.#Fn
			NotifyOnCreateOrReopenCase?:      *bool | fn.#Fn
			NotifyOnResolveCase?:             *bool | fn.#Fn
			TeamId:                           *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^\S+$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
