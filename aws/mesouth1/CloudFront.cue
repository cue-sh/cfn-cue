package mesouth1

import "github.com/cue-sh/cfn-cue/aws/fn"

#CloudFront: {
	#CachePolicy: {
		Type: "AWS::CloudFront::CachePolicy"
		Properties: CachePolicyConfig: *{
			Comment?:                                 *string | fn.#Fn
			DefaultTTL:                               *number | fn.#Fn
			MaxTTL:                                   *number | fn.#Fn
			MinTTL:                                   *number | fn.#Fn
			Name:                                     *string | fn.#Fn
			ParametersInCacheKeyAndForwardedToOrigin: *{
				CookiesConfig: *{
					CookieBehavior: *(=~#"^(none|whitelist|allExcept|all)$"#) | fn.#Fn
					Cookies?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				EnableAcceptEncodingBrotli?: *bool | fn.#Fn
				EnableAcceptEncodingGzip:    *bool | fn.#Fn
				HeadersConfig:               *{
					HeaderBehavior: *(=~#"^(none|whitelist)$"#) | fn.#Fn
					Headers?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				QueryStringsConfig: *{
					QueryStringBehavior: *(=~#"^(none|whitelist|allExcept|all)$"#) | fn.#Fn
					QueryStrings?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Function: {
		Type: "AWS::CloudFront::Function"
		Properties: {
			AutoPublish?:    *bool | fn.#Fn
			FunctionCode?:   *string | fn.#Fn
			FunctionConfig?: *{
				Comment: *string | fn.#Fn
				Runtime: *string | fn.#Fn
			} | fn.#If
			Name: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#KeyGroup: {
		Type: "AWS::CloudFront::KeyGroup"
		Properties: KeyGroupConfig: *{
			Comment?: *string | fn.#Fn
			Items:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name:     *string | fn.#Fn
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#OriginRequestPolicy: {
		Type: "AWS::CloudFront::OriginRequestPolicy"
		Properties: OriginRequestPolicyConfig: *{
			Comment?:      *string | fn.#Fn
			CookiesConfig: *{
				CookieBehavior: *(=~#"^(none|whitelist|all)$"#) | fn.#Fn
				Cookies?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			HeadersConfig: *{
				HeaderBehavior: *(=~#"^(none|whitelist|allViewer|allViewerAndWhitelistCloudFront)$"#) | fn.#Fn
				Headers?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
			Name:               *string | fn.#Fn
			QueryStringsConfig: *{
				QueryStringBehavior: *(=~#"^(none|whitelist|all)$"#) | fn.#Fn
				QueryStrings?:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PublicKey: {
		Type: "AWS::CloudFront::PublicKey"
		Properties: PublicKeyConfig: *{
			CallerReference: *string | fn.#Fn
			Comment?:        *string | fn.#Fn
			EncodedKey:      *string | fn.#Fn
			Name:            *string | fn.#Fn
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RealtimeLogConfig: {
		Type: "AWS::CloudFront::RealtimeLogConfig"
		Properties: {
			EndPoints: *[...{
				KinesisStreamConfig: *{
					RoleArn:   *string | fn.#Fn
					StreamArn: *string | fn.#Fn
				} | fn.#If
				StreamType: *string | fn.#Fn
			}] | fn.#If
			Fields:       [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Name:         *string | fn.#Fn
			SamplingRate: *(>=1 & <=100) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResponseHeadersPolicy: {
		Type: "AWS::CloudFront::ResponseHeadersPolicy"
		Properties: ResponseHeadersPolicyConfig: *{
			Comment?:    *string | fn.#Fn
			CorsConfig?: *{
				AccessControlAllowCredentials: *bool | fn.#Fn
				AccessControlAllowHeaders:     *{
					Items: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				AccessControlAllowMethods: *{
					Items: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				AccessControlAllowOrigins: *{
					Items: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				AccessControlExposeHeaders?: *{
					Items: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				AccessControlMaxAgeSec?: *int | fn.#Fn
				OriginOverride:          *bool | fn.#Fn
			} | fn.#If
			CustomHeadersConfig?: *{
				Items: *[...{
					Header:   *string | fn.#Fn
					Override: *bool | fn.#Fn
					Value:    *string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Name:                   *string | fn.#Fn
			SecurityHeadersConfig?: *{
				ContentSecurityPolicy?: *{
					ContentSecurityPolicy: *string | fn.#Fn
					Override:              *bool | fn.#Fn
				} | fn.#If
				ContentTypeOptions?: *{
					Override: *bool | fn.#Fn
				} | fn.#If
				FrameOptions?: *{
					FrameOption: *(=~#"^(DENY|SAMEORIGIN)$"#) | fn.#Fn
					Override:    *bool | fn.#Fn
				} | fn.#If
				ReferrerPolicy?: *{
					Override:       *bool | fn.#Fn
					ReferrerPolicy: *(=~#"^(no-referrer|no-referrer-when-downgrade|origin|origin-when-cross-origin|same-origin|strict-origin|strict-origin-when-cross-origin|unsafe-url)$"#) | fn.#Fn
				} | fn.#If
				StrictTransportSecurity?: *{
					AccessControlMaxAgeSec: *int | fn.#Fn
					IncludeSubdomains?:     *bool | fn.#Fn
					Override:               *bool | fn.#Fn
					Preload?:               *bool | fn.#Fn
				} | fn.#If
				XSSProtection?: *{
					ModeBlock?: *bool | fn.#Fn
					Override:   *bool | fn.#Fn
					Protection: *bool | fn.#Fn
					ReportUri?: *string | fn.#Fn
				} | fn.#If
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StreamingDistribution: {
		Type: "AWS::CloudFront::StreamingDistribution"
		Properties: {
			StreamingDistributionConfig: *{
				Aliases?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Comment:  *string | fn.#Fn
				Enabled:  *bool | fn.#Fn
				Logging?: *{
					Bucket:  *string | fn.#Fn
					Enabled: *bool | fn.#Fn
					Prefix:  *string | fn.#Fn
				} | fn.#If
				PriceClass?: *("PriceClass_100" | "PriceClass_200" | "PriceClass_All") | fn.#Fn
				S3Origin:    *{
					DomainName:           *string | fn.#Fn
					OriginAccessIdentity: *string | fn.#Fn
				} | fn.#If
				TrustedSigners: *{
					AwsAccountNumbers?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Enabled:            *bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags: *[...{
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
