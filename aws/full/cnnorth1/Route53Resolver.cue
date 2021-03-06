package cnnorth1

import "github.com/cue-sh/cfn-cue/aws/fn"

#Route53Resolver: {
	#ResolverEndpoint: {
		Type: "AWS::Route53Resolver::ResolverEndpoint"
		Properties: {
			Direction:   *("INBOUND" | "OUTBOUND") | fn.#Fn
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
			DomainName:          *string | fn.#Fn
			Name?:               *string | fn.#Fn
			ResolverEndpointId?: *string | fn.#Fn
			RuleType:            *("FORWARD" | "RECURSIVE" | "SYSTEM") | fn.#Fn
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
