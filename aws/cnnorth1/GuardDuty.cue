package cnnorth1

import "github.com/cue-sh/cfn-cue/aws/fn"

#GuardDuty: {
	#Detector: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			DataSources?: *{
				Kubernetes?: *{
					AuditLogs?: *{
						Enable?: *bool | fn.#Fn
					} | fn.#If
				} | fn.#If
				MalwareProtection?: *{
					ScanEc2InstanceWithFindings?: *{
						EbsVolumes?: *bool | fn.#Fn
					} | fn.#If
				} | fn.#If
				S3Logs?: *{
					Enable?: *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			Enable:                      *bool | fn.#Fn
			FindingPublishingFrequency?: *("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS") | fn.#Fn
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
	#Filter: {
		Type: "AWS::GuardDuty::Filter"
		Properties: {
			Action:          *("ARCHIVE" | "NOOP") | fn.#Fn
			Description:     *string | fn.#Fn
			DetectorId:      *string | fn.#Fn
			FindingCriteria: *{
				Criterion?: *{
					[string]: _
				} | fn.#Fn
				ItemType?: *{
					Eq?:                 [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Equals?:             [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					GreaterThan?:        *int | fn.#Fn
					GreaterThanOrEqual?: *int | fn.#Fn
					Gt?:                 *int | fn.#Fn
					Gte?:                *int | fn.#Fn
					LessThan?:           *int | fn.#Fn
					LessThanOrEqual?:    *int | fn.#Fn
					Lt?:                 *int | fn.#Fn
					Lte?:                *int | fn.#Fn
					Neq?:                [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					NotEquals?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			Name:  *string | fn.#Fn
			Rank:  *int | fn.#Fn
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
	#IPSet: {
		Type: "AWS::GuardDuty::IPSet"
		Properties: {
			Activate:   *bool | fn.#Fn
			DetectorId: *string | fn.#Fn
			Format:     *("ALIEN_VAULT" | "FIRE_EYE" | "OTX_CSV" | "PROOF_POINT" | "STIX" | "TXT") | fn.#Fn
			Location:   *string | fn.#Fn
			Name?:      *string | fn.#Fn
			Tags?:      *[...{
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
	#Master: {
		Type: "AWS::GuardDuty::Master"
		Properties: {
			DetectorId:    *string | fn.#Fn
			InvitationId?: *string | fn.#Fn
			MasterId:      *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Member: {
		Type: "AWS::GuardDuty::Member"
		Properties: {
			DetectorId:                *string | fn.#Fn
			DisableEmailNotification?: *bool | fn.#Fn
			Email:                     *string | fn.#Fn
			MemberId:                  *string | fn.#Fn
			Message?:                  *string | fn.#Fn
			Status?:                   *("Created" | "Disabled" | "Enabled" | "Invited" | "Removed" | "Resigned") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ThreatIntelSet: {
		Type: "AWS::GuardDuty::ThreatIntelSet"
		Properties: {
			Activate:   *bool | fn.#Fn
			DetectorId: *string | fn.#Fn
			Format:     *("ALIEN_VAULT" | "FIRE_EYE" | "OTX_CSV" | "PROOF_POINT" | "STIX" | "TXT") | fn.#Fn
			Location:   *string | fn.#Fn
			Name?:      *string | fn.#Fn
			Tags?:      *[...{
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
