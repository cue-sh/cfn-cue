package apsoutheast3

import "github.com/cue-sh/cfn-cue/aws/fn"

#CloudFront: {
	#Distribution: {
		Type: "AWS::CloudFront::Distribution"
		Properties: {
			DistributionConfig: *{
				Aliases?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				CNAMEs?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				CacheBehaviors?: *[...{
					AllowedMethods?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					CachePolicyId?:          *string | fn.#Fn
					CachedMethods?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Compress?:               *bool | fn.#Fn
					DefaultTTL?:             *number | fn.#Fn
					FieldLevelEncryptionId?: *string | fn.#Fn
					ForwardedValues?:        *{
						Cookies?: *{
							Forward:           *string | fn.#Fn
							WhitelistedNames?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						} | fn.#If
						Headers?:              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						QueryString:           *bool | fn.#Fn
						QueryStringCacheKeys?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					} | fn.#If
					FunctionAssociations?: *[...{
						EventType?:   *string | fn.#Fn
						FunctionARN?: *string | fn.#Fn
					}] | fn.#If
					LambdaFunctionAssociations?: *[...{
						EventType?:        *("origin-request" | "origin-response" | "viewer-request" | "viewer-response") | fn.#Fn
						IncludeBody?:      *bool | fn.#Fn
						LambdaFunctionARN: *string | fn.#Fn
					}] | fn.#If
					MaxTTL?:                  *number | fn.#Fn
					MinTTL?:                  *number | fn.#Fn
					OriginRequestPolicyId?:   *string | fn.#Fn
					PathPattern:              *string | fn.#Fn
					RealtimeLogConfigArn?:    *string | fn.#Fn
					ResponseHeadersPolicyId?: *string | fn.#Fn
					SmoothStreaming?:         *bool | fn.#Fn
					TargetOriginId:           *string | fn.#Fn
					TrustedKeyGroups?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					TrustedSigners?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					ViewerProtocolPolicy:     *("allow-all" | "https-only" | "redirect-to-https") | fn.#Fn
				}] | fn.#If
				Comment?:              *string | fn.#Fn
				CustomErrorResponses?: *[...{
					ErrorCachingMinTTL?: *number | fn.#Fn
					ErrorCode:           *(400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504) | fn.#Fn
					ResponseCode?:       *(200 | 400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504) | fn.#Fn
					ResponsePagePath?:   *string | fn.#Fn
				}] | fn.#If
				CustomOrigin?: *{
					DNSName:              *string | fn.#Fn
					HTTPPort?:            *int | fn.#Fn
					HTTPSPort?:           *int | fn.#Fn
					OriginProtocolPolicy: *string | fn.#Fn
					OriginSSLProtocols:   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				DefaultCacheBehavior: *{
					AllowedMethods?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					CachePolicyId?:          *string | fn.#Fn
					CachedMethods?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Compress?:               *bool | fn.#Fn
					DefaultTTL?:             *number | fn.#Fn
					FieldLevelEncryptionId?: *string | fn.#Fn
					ForwardedValues?:        *{
						Cookies?: *{
							Forward:           *string | fn.#Fn
							WhitelistedNames?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						} | fn.#If
						Headers?:              [...(*string | fn.#Fn)] | (*string | fn.#Fn)
						QueryString:           *bool | fn.#Fn
						QueryStringCacheKeys?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					} | fn.#If
					FunctionAssociations?: *[...{
						EventType?:   *string | fn.#Fn
						FunctionARN?: *string | fn.#Fn
					}] | fn.#If
					LambdaFunctionAssociations?: *[...{
						EventType?:        *("origin-request" | "origin-response" | "viewer-request" | "viewer-response") | fn.#Fn
						IncludeBody?:      *bool | fn.#Fn
						LambdaFunctionARN: *string | fn.#Fn
					}] | fn.#If
					MaxTTL?:                  *number | fn.#Fn
					MinTTL?:                  *number | fn.#Fn
					OriginRequestPolicyId?:   *string | fn.#Fn
					RealtimeLogConfigArn?:    *string | fn.#Fn
					ResponseHeadersPolicyId?: *string | fn.#Fn
					SmoothStreaming?:         *bool | fn.#Fn
					TargetOriginId:           *string | fn.#Fn
					TrustedKeyGroups?:        [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					TrustedSigners?:          [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					ViewerProtocolPolicy:     *("allow-all" | "https-only" | "redirect-to-https") | fn.#Fn
				} | fn.#If
				DefaultRootObject?: *string | fn.#Fn
				Enabled:            *bool | fn.#Fn
				HttpVersion?:       *("http1.1" | "http2" | "http2and3" | "http3") | fn.#Fn
				IPV6Enabled?:       *bool | fn.#Fn
				Logging?:           *{
					Bucket:          *string | fn.#Fn
					IncludeCookies?: *bool | fn.#Fn
					Prefix?:         *string | fn.#Fn
				} | fn.#If
				OriginGroups?: *{
					Items?: *[...{
						FailoverCriteria: *{
							StatusCodes: *{
								Items:    [...(*int | fn.#Fn)] | (*int | fn.#Fn)
								Quantity: *int | fn.#Fn
							} | fn.#If
						} | fn.#If
						Id:      *string | fn.#Fn
						Members: *{
							Items: *[...{
								OriginId: *string | fn.#Fn
							}] | fn.#If
							Quantity: *int | fn.#Fn
						} | fn.#If
					}] | fn.#If
					Quantity: *int | fn.#Fn
				} | fn.#If
				Origins: *[...{
					ConnectionAttempts?: *int | fn.#Fn
					ConnectionTimeout?:  *int | fn.#Fn
					CustomOriginConfig?: *{
						HTTPPort?:               *int | fn.#Fn
						HTTPSPort?:              *int | fn.#Fn
						OriginKeepaliveTimeout?: *int | fn.#Fn
						OriginProtocolPolicy:    *("http-only" | "https-only" | "match-viewer") | fn.#Fn
						OriginReadTimeout?:      *int | fn.#Fn
						OriginSSLProtocols?:     [...(*("SSLv3" | "TLSv1" | "TLSv1.1" | "TLSv1.2") | fn.#Fn)] | (*("SSLv3" | "TLSv1" | "TLSv1.1" | "TLSv1.2") | fn.#Fn)
					} | fn.#If
					DomainName:             *string | fn.#Fn
					Id:                     *string | fn.#Fn
					OriginAccessControlId?: *string | fn.#Fn
					OriginCustomHeaders?:   *[...{
						HeaderName:  *string | fn.#Fn
						HeaderValue: *string | fn.#Fn
					}] | fn.#If
					OriginPath?:   *string | fn.#Fn
					OriginShield?: *{
						Enabled?:            *bool | fn.#Fn
						OriginShieldRegion?: *string | fn.#Fn
					} | fn.#If
					S3OriginConfig?: *{
						OriginAccessIdentity?: *string | fn.#Fn
					} | fn.#If
				}] | fn.#If
				PriceClass?:   *("PriceClass_100" | "PriceClass_200" | "PriceClass_All") | fn.#Fn
				Restrictions?: *{
					GeoRestriction: *{
						Locations?:      [...(*("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW") | fn.#Fn)] | (*("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW") | fn.#Fn)
						RestrictionType: *("blacklist" | "none" | "whitelist") | fn.#Fn
					} | fn.#If
				} | fn.#If
				S3Origin?: *{
					DNSName:               *string | fn.#Fn
					OriginAccessIdentity?: *string | fn.#Fn
				} | fn.#If
				ViewerCertificate?: *{
					AcmCertificateArn?:            *string | fn.#Fn
					CloudFrontDefaultCertificate?: *bool | fn.#Fn
					IamCertificateId?:             *string | fn.#Fn
					MinimumProtocolVersion?:       *("SSLv3" | "TLSv1" | "TLSv1.1_2016" | "TLSv1.2_2018" | "TLSv1.2_2019" | "TLSv1.2_2021" | "TLSv1_2016") | fn.#Fn
					SslSupportMethod?:             *("sni-only" | "static-ip" | "vip") | fn.#Fn
				} | fn.#If
				WebACLId?: *string | fn.#Fn
			} | fn.#If
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
	#OriginAccessControl: {
		Type: "AWS::CloudFront::OriginAccessControl"
		Properties: OriginAccessControlConfig: *{
			Description?:                  *string | fn.#Fn
			Name:                          *string | fn.#Fn
			OriginAccessControlOriginType: *(=~#"^(s3)$"#) | fn.#Fn
			SigningBehavior:               *(=~#"^(never|no-override|always)$"#) | fn.#Fn
			SigningProtocol:               *(=~#"^(sigv4)$"#) | fn.#Fn
		} | fn.#If
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
			ServerTimingHeadersConfig?: *{
				Enabled:       *bool | fn.#Fn
				SamplingRate?: *number | fn.#Fn
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
