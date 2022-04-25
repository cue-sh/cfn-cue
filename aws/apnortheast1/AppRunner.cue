package apnortheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#AppRunner: {
	#ObservabilityConfiguration: {
		Type: "AWS::AppRunner::ObservabilityConfiguration"
		Properties: {
			ObservabilityConfigurationName?: *(strings.MinRunes(4) & strings.MaxRunes(32) & (=~#"[A-Za-z0-9][A-Za-z0-9\-_]{3,31}"#)) | fn.#Fn
			Tags?:                           *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TraceConfiguration?: *{
				Vendor: *("AWSXRAY") | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Service: {
		Type: "AWS::AppRunner::Service"
		Properties: {
			AutoScalingConfigurationArn?: *(strings.MinRunes(1) & strings.MaxRunes(1011) & (=~#"arn:aws(-[\w]+)*:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:[0-9]{12}:(\w|\/|-){1,1011}"#)) | fn.#Fn
			EncryptionConfiguration?:     *{
				KmsKey: *(=~#"arn:aws(-[\w]+)*:kms:[a-z\-]+-[0-9]{1}:[0-9]{12}:key\/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"#) | fn.#Fn
			} | fn.#If
			HealthCheckConfiguration?: *{
				HealthyThreshold?:   *(>=1 & <=20) | fn.#Fn
				Interval?:           *int | fn.#Fn
				Path?:               *string | fn.#Fn
				Protocol?:           *("TCP" | "HTTP") | fn.#Fn
				Timeout?:            *(>=1 & <=20) | fn.#Fn
				UnhealthyThreshold?: *(>=1 & <=20) | fn.#Fn
			} | fn.#If
			InstanceConfiguration?: *{
				Cpu?:             *(strings.MinRunes(4) & strings.MaxRunes(6) & (=~#"1024|2048|(1|2) vCPU"#)) | fn.#Fn
				InstanceRoleArn?: *(strings.MinRunes(29) & strings.MaxRunes(102) & (=~#"arn:(aws|aws-us-gov|aws-cn|aws-iso|aws-iso-b):iam::[0-9]{12}:role/[\w+=,.@-]{1,64}"#)) | fn.#Fn
				Memory?:          *(strings.MinRunes(4) & strings.MaxRunes(4) & (=~#"2048|3072|4096|(2|3|4) GB"#)) | fn.#Fn
			} | fn.#If
			NetworkConfiguration?: *{
				EgressConfiguration: *{
					EgressType:       *("DEFAULT" | "VPC") | fn.#Fn
					VpcConnectorArn?: *(strings.MinRunes(44) & strings.MaxRunes(1011) & (=~#"arn:aws(-[\w]+)*:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:[0-9]{12}:(\w|\/|-){1,1011}"#)) | fn.#Fn
				} | fn.#If
			} | fn.#If
			ObservabilityConfiguration?: *{
				ObservabilityConfigurationArn?: *(strings.MinRunes(1) & strings.MaxRunes(1011) & (=~#"arn:aws(-[\w]+)*:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[0-9]{12}:(\w|/|-){1,1011}"#)) | fn.#Fn
				ObservabilityEnabled:           *bool | fn.#Fn
			} | fn.#If
			ServiceName?:        *(strings.MinRunes(4) & strings.MaxRunes(40) & (=~#"[A-Za-z0-9][A-Za-z0-9-_]{3,39}"#)) | fn.#Fn
			SourceConfiguration: *{
				AuthenticationConfiguration?: *{
					AccessRoleArn?: *(strings.MinRunes(29) & strings.MaxRunes(102) & (=~#"arn:(aws|aws-us-gov|aws-cn|aws-iso|aws-iso-b):iam::[0-9]{12}:role/[\w+=,.@-]{1,64}"#)) | fn.#Fn
					ConnectionArn?: *(strings.MinRunes(1) & strings.MaxRunes(1011) & (=~#"arn:aws(-[\w]+)*:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:[0-9]{12}:(\w|\/|-){1,1011}"#)) | fn.#Fn
				} | fn.#If
				AutoDeploymentsEnabled?: *bool | fn.#Fn
				CodeRepository?:         *{
					CodeConfiguration?: *{
						CodeConfigurationValues?: *{
							BuildCommand?:                *string | fn.#Fn
							Port?:                        *string | fn.#Fn
							Runtime:                      *("PYTHON_3" | "NODEJS_12" | "NODEJS_14" | "CORRETTO_8" | "CORRETTO_11") | fn.#Fn
							RuntimeEnvironmentVariables?: *[...{
								Name?:  *string | fn.#Fn
								Value?: *string | fn.#Fn
							}] | fn.#If
							StartCommand?: *string | fn.#Fn
						} | fn.#If
						ConfigurationSource: *("REPOSITORY" | "API") | fn.#Fn
					} | fn.#If
					RepositoryUrl:     *string | fn.#Fn
					SourceCodeVersion: *{
						Type:  *("BRANCH") | fn.#Fn
						Value: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				ImageRepository?: *{
					ImageConfiguration?: *{
						Port?:                        *string | fn.#Fn
						RuntimeEnvironmentVariables?: *[...{
							Name?:  *string | fn.#Fn
							Value?: *string | fn.#Fn
						}] | fn.#If
						StartCommand?: *string | fn.#Fn
					} | fn.#If
					ImageIdentifier:     *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"([0-9]{12}.dkr.ecr.[a-z\-]+-[0-9]{1}.amazonaws.com\/.*)|(^public\.ecr\.aws\/.+\/.+)"#)) | fn.#Fn
					ImageRepositoryType: *("ECR" | "ECR_PUBLIC") | fn.#Fn
				} | fn.#If
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
	#VpcConnector: {
		Type: "AWS::AppRunner::VpcConnector"
		Properties: {
			SecurityGroups?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Subnets:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:           *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcConnectorName?: *(strings.MinRunes(4) & strings.MaxRunes(40) & (=~#"^[A-Za-z0-9][A-Za-z0-9-\\_]{3,39}$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
