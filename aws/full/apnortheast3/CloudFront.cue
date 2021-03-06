package apnortheast3

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
}
