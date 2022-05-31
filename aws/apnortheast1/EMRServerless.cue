package apnortheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#EMRServerless: {
	#Application: {
		Type: "AWS::EMRServerless::Application"
		Properties: {
			AutoStartConfiguration?: *{
				Enabled?: *bool | fn.#Fn
			} | fn.#If
			AutoStopConfiguration?: *{
				Enabled?:            *bool | fn.#Fn
				IdleTimeoutMinutes?: *int | fn.#Fn
			} | fn.#If
			InitialCapacity?: *[...{
				Key:   *(strings.MinRunes(1) & strings.MaxRunes(50) & (=~#"^[a-zA-Z]+[-_]*[a-zA-Z]+$"#)) | fn.#Fn
				Value: *{
					WorkerConfiguration: *{
						Cpu:    *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(vCPU|vcpu|VCPU)?$"#)) | fn.#Fn
						Disk?:  *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(GB|gb|gB|Gb)$"#)) | fn.#Fn
						Memory: *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(GB|gb|gB|Gb)?$"#)) | fn.#Fn
					} | fn.#If
					WorkerCount: *(>=1 & <=1000000) | fn.#Fn
				} | fn.#If
			}] | fn.#If
			MaximumCapacity?: *{
				Cpu:    *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(vCPU|vcpu|VCPU)?$"#)) | fn.#Fn
				Disk?:  *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(GB|gb|gB|Gb)$"#)) | fn.#Fn
				Memory: *(strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^[1-9][0-9]*(\s)?(GB|gb|gB|Gb)?$"#)) | fn.#Fn
			} | fn.#If
			Name?:                 *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[A-Za-z0-9._\/#-]+$"#)) | fn.#Fn
			NetworkConfiguration?: *{
				SecurityGroupIds?: [...(*(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[-0-9a-zA-Z]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[-0-9a-zA-Z]+"#)) | fn.#Fn)
				SubnetIds?:        [...(*(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[-0-9a-zA-Z]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"^[-0-9a-zA-Z]+"#)) | fn.#Fn)
			} | fn.#If
			ReleaseLabel: *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[A-Za-z0-9._/-]+$"#)) | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
