package mesouth1

import "github.com/TangoGroup/aws/fn"

CloudFront :: {
	CloudFrontOriginAccessIdentity :: {
		Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
		Properties: CloudFrontOriginAccessIdentityConfig: close({
		}) | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Distribution :: {
		Type: "AWS::CloudFront::Distribution"
		Properties: {
			DistributionConfig: close({
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StreamingDistribution :: {
		Type: "AWS::CloudFront::StreamingDistribution"
		Properties: {
			StreamingDistributionConfig: close({
			}) | fn.If
			Tags: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
