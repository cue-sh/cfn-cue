package useast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#BillingConductor: {
	#BillingGroup: {
		Type: "AWS::BillingConductor::BillingGroup"
		Properties: {
			AccountGrouping: *{
				LinkedAccountIds: [...(*(=~#"[0-9]{12}"#) | fn.#Fn)] | (*(=~#"[0-9]{12}"#) | fn.#Fn)
			} | fn.#If
			ComputationPreference: *{
				PricingPlanArn: *(=~#"arn:aws(-cn)?:billingconductor::[0-9]{12}:pricingplan/[a-zA-Z0-9]{10}"#) | fn.#Fn
			} | fn.#If
			Description?:     *string | fn.#Fn
			Name:             *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_\+=\.\-@]+"#)) | fn.#Fn
			PrimaryAccountId: *(=~#"[0-9]{12}"#) | fn.#Fn
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
	#CustomLineItem: {
		Type: "AWS::BillingConductor::CustomLineItem"
		Properties: {
			BillingGroupArn:     *(=~#"arn:aws(-cn)?:billingconductor::[0-9]{12}:billinggroup/?[0-9]{12}"#) | fn.#Fn
			BillingPeriodRange?: *{
				ExclusiveEndBillingPeriod?:   *(=~#"\d{4}-(0?[1-9]|1[012])"#) | fn.#Fn
				InclusiveStartBillingPeriod?: *(=~#"\d{4}-(0?[1-9]|1[012])"#) | fn.#Fn
			} | fn.#If
			CustomLineItemChargeDetails?: *{
				Flat?: *{
					ChargeValue: *number | fn.#Fn
				} | fn.#If
				Percentage?: *{
					ChildAssociatedResources?: [...(*(=~#"(arn:aws(-cn)?:billingconductor::[0-9]{12}:(customlineitem|billinggroup)/)?[a-zA-Z0-9]{10,12}"#) | fn.#Fn)] | (*(=~#"(arn:aws(-cn)?:billingconductor::[0-9]{12}:(customlineitem|billinggroup)/)?[a-zA-Z0-9]{10,12}"#) | fn.#Fn)
					PercentageValue:           *number | fn.#Fn
				} | fn.#If
				Type: *("FEE" | "CREDIT") | fn.#Fn
			} | fn.#If
			Description?: *string | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_\+=\.\-@]+"#)) | fn.#Fn
			Tags?:        *[...{
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
	#PricingPlan: {
		Type: "AWS::BillingConductor::PricingPlan"
		Properties: {
			Description?:     *string | fn.#Fn
			Name:             *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_\+=\.\-@]+"#)) | fn.#Fn
			PricingRuleArns?: [...(*(=~#"arn:aws(-cn)?:billingconductor::[0-9]{12}:pricingrule/[a-zA-Z0-9]{10}"#) | fn.#Fn)] | (*(=~#"arn:aws(-cn)?:billingconductor::[0-9]{12}:pricingrule/[a-zA-Z0-9]{10}"#) | fn.#Fn)
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
	#PricingRule: {
		Type: "AWS::BillingConductor::PricingRule"
		Properties: {
			Description?:       *string | fn.#Fn
			ModifierPercentage: *number | fn.#Fn
			Name:               *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_\+=\.\-@]+"#)) | fn.#Fn
			Scope:              *("GLOBAL" | "SERVICE") | fn.#Fn
			Service?:           *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9\.\-]+"#)) | fn.#Fn
			Tags?:              *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type: *("MARKUP" | "DISCOUNT") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
