package euwest3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#InspectorV2: {
	#Filter: {
		Type: "AWS::InspectorV2::Filter"
		Properties: {
			Description?:   *(strings.MinRunes(1) & strings.MaxRunes(512)) | fn.#Fn
			FilterAction:   *("NONE" | "SUPPRESS") | fn.#Fn
			FilterCriteria: *{
				AwsAccountId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				ComponentId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				ComponentType?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				Ec2InstanceImageId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				Ec2InstanceSubnetId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				Ec2InstanceVpcId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				EcrImageArchitecture?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				EcrImageHash?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				EcrImagePushedAt?: *[...{
					EndInclusive?:   *int | fn.#Fn
					StartInclusive?: *int | fn.#Fn
				}] | fn.#If
				EcrImageRegistry?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				EcrImageRepositoryName?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				EcrImageTags?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				FindingArn?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				FindingStatus?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				FindingType?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				FirstObservedAt?: *[...{
					EndInclusive?:   *int | fn.#Fn
					StartInclusive?: *int | fn.#Fn
				}] | fn.#If
				InspectorScore?: *[...{
					LowerInclusive?: *number | fn.#Fn
					UpperInclusive?: *number | fn.#Fn
				}] | fn.#If
				LastObservedAt?: *[...{
					EndInclusive?:   *int | fn.#Fn
					StartInclusive?: *int | fn.#Fn
				}] | fn.#If
				NetworkProtocol?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				PortRange?: *[...{
					BeginInclusive?: *int | fn.#Fn
					EndInclusive?:   *int | fn.#Fn
				}] | fn.#If
				RelatedVulnerabilities?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				ResourceId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				ResourceTags?: *[...{
					Comparison: *("EQUALS") | fn.#Fn
					Key?:       *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
					Value?:     *string | fn.#Fn
				}] | fn.#If
				ResourceType?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				Severity?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				Title?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				UpdatedAt?: *[...{
					EndInclusive?:   *int | fn.#Fn
					StartInclusive?: *int | fn.#Fn
				}] | fn.#If
				VendorSeverity?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				VulnerabilityId?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				VulnerabilitySource?: *[...{
					Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
					Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
				}] | fn.#If
				VulnerablePackages?: *[...{
					Architecture?: *{
						Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
						Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					} | fn.#If
					Epoch?: *{
						LowerInclusive?: *number | fn.#Fn
						UpperInclusive?: *number | fn.#Fn
					} | fn.#If
					Name?: *{
						Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
						Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					} | fn.#If
					Release?: *{
						Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
						Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					} | fn.#If
					SourceLayerHash?: *{
						Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
						Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					} | fn.#If
					Version?: *{
						Comparison: *("EQUALS" | "PREFIX" | "NOT_EQUALS") | fn.#Fn
						Value:      *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			Name: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
