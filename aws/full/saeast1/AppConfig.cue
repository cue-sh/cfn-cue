package saeast1

import "github.com/cue-sh/cfn-cue/aws/fn"

#AppConfig: {
	#HostedConfigurationVersion: {
		Type: "AWS::AppConfig::HostedConfigurationVersion"
		Properties: {
			ApplicationId:          *string | fn.#Fn
			ConfigurationProfileId: *string | fn.#Fn
			Content:                *string | fn.#Fn
			ContentType:            *string | fn.#Fn
			Description?:           *string | fn.#Fn
			LatestVersionNumber?:   *number | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
