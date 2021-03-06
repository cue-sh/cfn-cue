package apsouth1

import "github.com/cue-sh/cfn-cue/aws/fn"

#Amplify: {
	#App: {
		Type: "AWS::Amplify::App"
		Properties: {
			AccessToken?:              *string | fn.#Fn
			AutoBranchCreationConfig?: *{
				AutoBranchCreationPatterns?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				BasicAuthConfig?:            *{
					EnableBasicAuth?: *bool | fn.#Fn
					Password?:        *string | fn.#Fn
					Username?:        *string | fn.#Fn
				} | fn.#If
				BuildSpec?:                *string | fn.#Fn
				EnableAutoBranchCreation?: *bool | fn.#Fn
				EnableAutoBuild?:          *bool | fn.#Fn
				EnablePerformanceMode?:    *bool | fn.#Fn
				EnablePullRequestPreview?: *bool | fn.#Fn
				EnvironmentVariables?:     *[...{
					Name:  *string | fn.#Fn
					Value: *string | fn.#Fn
				}] | fn.#If
				PullRequestEnvironmentName?: *string | fn.#Fn
				Stage?:                      *string | fn.#Fn
			} | fn.#If
			BasicAuthConfig?: *{
				EnableBasicAuth?: *bool | fn.#Fn
				Password?:        *string | fn.#Fn
				Username?:        *string | fn.#Fn
			} | fn.#If
			BuildSpec?:     *string | fn.#Fn
			CustomHeaders?: *string | fn.#Fn
			CustomRules?:   *[...{
				Condition?: *string | fn.#Fn
				Source:     *string | fn.#Fn
				Status?:    *string | fn.#Fn
				Target:     *string | fn.#Fn
			}] | fn.#If
			Description?:              *string | fn.#Fn
			EnableBranchAutoDeletion?: *bool | fn.#Fn
			EnvironmentVariables?:     *[...{
				Name:  *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			IAMServiceRole?: *string | fn.#Fn
			Name:            *string | fn.#Fn
			OauthToken?:     *string | fn.#Fn
			Repository?:     *string | fn.#Fn
			Tags?:           *[...{
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
	#Branch: {
		Type: "AWS::Amplify::Branch"
		Properties: {
			AppId:            *string | fn.#Fn
			BasicAuthConfig?: *{
				EnableBasicAuth?: *bool | fn.#Fn
				Password:         *string | fn.#Fn
				Username:         *string | fn.#Fn
			} | fn.#If
			BranchName:                *string | fn.#Fn
			BuildSpec?:                *string | fn.#Fn
			Description?:              *string | fn.#Fn
			EnableAutoBuild?:          *bool | fn.#Fn
			EnablePerformanceMode?:    *bool | fn.#Fn
			EnablePullRequestPreview?: *bool | fn.#Fn
			EnvironmentVariables?:     *[...{
				Name:  *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			PullRequestEnvironmentName?: *string | fn.#Fn
			Stage?:                      *string | fn.#Fn
			Tags?:                       *[...{
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
	#Domain: {
		Type: "AWS::Amplify::Domain"
		Properties: {
			AppId:                          *string | fn.#Fn
			AutoSubDomainCreationPatterns?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			AutoSubDomainIAMRole?:          *string | fn.#Fn
			DomainName:                     *string | fn.#Fn
			EnableAutoSubDomain?:           *bool | fn.#Fn
			SubDomainSettings:              *[...{
				BranchName: *string | fn.#Fn
				Prefix:     *string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
