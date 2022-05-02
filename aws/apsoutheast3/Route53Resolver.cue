package apsoutheast3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Route53Resolver: {
	#ResolverEndpoint: {
		Type: "AWS::Route53Resolver::ResolverEndpoint"
		Properties: {
			Direction:   *string | fn.#Fn
			IpAddresses: *[...{
				Ip?:      *string | fn.#Fn
				SubnetId: *string | fn.#Fn
			}] | fn.#If
			Name?:            *string | fn.#Fn
			SecurityGroupIds: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
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
	#ResolverRule: {
		Type: "AWS::Route53Resolver::ResolverRule"
		Properties: {
			DomainName:          *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			Name?:               *string | fn.#Fn
			ResolverEndpointId?: *(strings.MinRunes(1) & strings.MaxRunes(64)) | fn.#Fn
			RuleType:            *("FORWARD" | "SYSTEM" | "RECURSIVE") | fn.#Fn
			Tags?:               *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TargetIps?: *[...{
				Ip:    *string | fn.#Fn
				Port?: *string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResolverRuleAssociation: {
		Type: "AWS::Route53Resolver::ResolverRuleAssociation"
		Properties: {
			Name?:          *string | fn.#Fn
			ResolverRuleId: *string | fn.#Fn
			VPCId:          *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
