package usgoveast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#GreengrassV2: {
	#ComponentVersion: {
		Type: "AWS::GreengrassV2::ComponentVersion"
		Properties: {
			InlineRecipe?:   *string | fn.#Fn
			LambdaFunction?: *{
				ComponentDependencies?: *{
					[string]: {
						DependencyType?:     *string | fn.#Fn
						VersionRequirement?: *string | fn.#Fn
					}
				} | fn.#If
				ComponentLambdaParameters?: *{
					EnvironmentVariables?: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					EventSources?: *[...{
						Topic?: *string | fn.#Fn
						Type?:  *("PUB_SUB" | "IOT_CORE") | fn.#Fn
					}] | fn.#If
					ExecArgs?:                 [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					InputPayloadEncodingType?: *("json" | "binary") | fn.#Fn
					LinuxProcessParams?:       *{
						ContainerParams?: *{
							Devices?: *[...{
								AddGroupOwner?: *bool | fn.#Fn
								Path?:          *string | fn.#Fn
								Permission?:    *("ro" | "rw") | fn.#Fn
							}] | fn.#If
							MemorySizeInKB?: *int | fn.#Fn
							MountROSysfs?:   *bool | fn.#Fn
							Volumes?:        *[...{
								AddGroupOwner?:   *bool | fn.#Fn
								DestinationPath?: *string | fn.#Fn
								Permission?:      *("ro" | "rw") | fn.#Fn
								SourcePath?:      *string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						IsolationMode?: *("GreengrassContainer" | "NoContainer") | fn.#Fn
					} | fn.#If
					MaxIdleTimeInSeconds?:   *int | fn.#Fn
					MaxInstancesCount?:      *int | fn.#Fn
					MaxQueueSize?:           *int | fn.#Fn
					Pinned?:                 *bool | fn.#Fn
					StatusTimeoutInSeconds?: *int | fn.#Fn
					TimeoutInSeconds?:       *int | fn.#Fn
				} | fn.#If
				ComponentName?:      *string | fn.#Fn
				ComponentPlatforms?: *[...{
					Attributes?: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					Name?: *string | fn.#Fn
				}] | fn.#If
				ComponentVersion?: *string | fn.#Fn
				LambdaArn?:        *(=~#"^arn:aws(-(cn|us-gov))?:lambda:(([a-z]+-)+[0-9])?:([0-9]{12})?:[^.]+$"#) | fn.#Fn
			} | fn.#If
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Deployment: {
		Type: "AWS::GreengrassV2::Deployment"
		Properties: {
			Components?: *{
				[string]: {
					ComponentVersion?:    *string | fn.#Fn
					ConfigurationUpdate?: *{
						Merge?: *string | fn.#Fn
						Reset?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					} | fn.#If
					RunWith?: *{
						PosixUser?:            *string | fn.#Fn
						SystemResourceLimits?: *{
							Cpus?:   *number | fn.#Fn
							Memory?: *int | fn.#Fn
						} | fn.#If
						WindowsUser?: *string | fn.#Fn
					} | fn.#If
				}
			} | fn.#If
			DeploymentName?:     *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			DeploymentPolicies?: *{
				ComponentUpdatePolicy?: *{
					Action?:           *("NOTIFY_COMPONENTS" | "SKIP_NOTIFY_COMPONENTS") | fn.#Fn
					TimeoutInSeconds?: *(>=1 & <=2147483647) | fn.#Fn
				} | fn.#If
				ConfigurationValidationPolicy?: *{
					TimeoutInSeconds?: *(>=1 & <=2147483647) | fn.#Fn
				} | fn.#If
				FailureHandlingPolicy?: *("ROLLBACK" | "DO_NOTHING") | fn.#Fn
			} | fn.#If
			IotJobConfiguration?: *{
				AbortConfig?: *{
					CriteriaList: *[...{
						Action:                    *("CANCEL") | fn.#Fn
						FailureType:               *("FAILED" | "REJECTED" | "TIMED_OUT" | "ALL") | fn.#Fn
						MinNumberOfExecutedThings: *(>=1 & <=2147483647) | fn.#Fn
						ThresholdPercentage:       *number | fn.#Fn
					}] | fn.#If
				} | fn.#If
				JobExecutionsRolloutConfig?: *{
					ExponentialRate?: *{
						BaseRatePerMinute:    *(>=1 & <=1000) | fn.#Fn
						IncrementFactor:      *(>=1 & <=5) | fn.#Fn
						RateIncreaseCriteria: *{} | fn.#If
					} | fn.#If
					MaximumPerMinute?: *(>=1 & <=1000) | fn.#Fn
				} | fn.#If
				TimeoutConfig?: *{
					InProgressTimeoutInMinutes?: *int | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			TargetArn: *(=~#"arn:[^:]*:iot:[^:]*:[0-9]+:(thing|thinggroup)/.+"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
