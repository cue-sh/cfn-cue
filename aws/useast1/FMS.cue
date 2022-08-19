package useast1

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
	#Policy: {
		Type: "AWS::FMS::Policy"
		Properties: {
			DeleteAllPolicyResources?: *bool | fn.#Fn
			ExcludeMap?:               *{
				ACCOUNT?: [...(*(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^([0-9]*)$"#)) | fn.#Fn)] | (*(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^([0-9]*)$"#)) | fn.#Fn)
				ORGUNIT?: [...(*(strings.MinRunes(16) & strings.MaxRunes(68) & (=~#"^(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#)) | fn.#Fn)] | (*(strings.MinRunes(16) & strings.MaxRunes(68) & (=~#"^(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#)) | fn.#Fn)
			} | fn.#If
			ExcludeResourceTags: *bool | fn.#Fn
			IncludeMap?:         *{
				ACCOUNT?: [...(*(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^([0-9]*)$"#)) | fn.#Fn)] | (*(strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^([0-9]*)$"#)) | fn.#Fn)
				ORGUNIT?: [...(*(strings.MinRunes(16) & strings.MaxRunes(68) & (=~#"^(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#)) | fn.#Fn)] | (*(strings.MinRunes(16) & strings.MaxRunes(68) & (=~#"^(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$"#)) | fn.#Fn)
			} | fn.#If
			PolicyName:         *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^([a-zA-Z0-9_.:/=+\-@]+)$"#)) | fn.#Fn
			RemediationEnabled: *bool | fn.#Fn
			ResourceTags?:      *[...{
				Key:    *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				Value?: *string | fn.#Fn
			}] | fn.#If
			ResourceType:              *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^([^\s]*)$"#)) | fn.#Fn
			ResourceTypeList?:         [...(*(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^([^\s]*)$"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^([^\s]*)$"#)) | fn.#Fn)
			ResourcesCleanUp?:         *bool | fn.#Fn
			SecurityServicePolicyData: *{
				ManagedServiceData?: *(strings.MinRunes(1) & strings.MaxRunes(8192)) | fn.#Fn
				PolicyOption?:       *{
					NetworkFirewallPolicy?: *{
						FirewallDeploymentModel: *("DISTRIBUTED" | "CENTRALIZED") | fn.#Fn
					} | fn.#If
					ThirdPartyFirewallPolicy?: *{
						FirewallDeploymentModel: *("DISTRIBUTED" | "CENTRALIZED") | fn.#Fn
					} | fn.#If
				} | fn.#If
				Type: *("WAF" | "WAFV2" | "SHIELD_ADVANCED" | "SECURITY_GROUPS_COMMON" | "SECURITY_GROUPS_CONTENT_AUDIT" | "SECURITY_GROUPS_USAGE_AUDIT" | "NETWORK_FIREWALL" | "THIRD_PARTY_FIREWALL" | "DNS_FIREWALL") | fn.#Fn
			} | fn.#If
			Tags?: *[...{
				Key:   *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^([^\s]*)$"#)) | fn.#Fn
				Value: *(=~#"^([^\s]*)$"#) | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
