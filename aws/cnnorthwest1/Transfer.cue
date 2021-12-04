package cnnorthwest1

import "github.com/cue-sh/cfn-cue/aws/fn"

#Transfer: {
	#User: {
		Type: "AWS::Transfer::User"
		Properties: {
			HomeDirectory?:         *string | fn.#Fn
			HomeDirectoryMappings?: *[...{
				Entry:  *string | fn.#Fn
				Target: *string | fn.#Fn
			}] | fn.#If
			HomeDirectoryType?: *string | fn.#Fn
			Policy?:            *string | fn.#Fn
			PosixProfile?:      *{
				Gid:            *number | fn.#Fn
				SecondaryGids?: [...(*number | fn.#Fn)] | (*number | fn.#Fn)
				Uid:            *number | fn.#Fn
			} | fn.#If
			Role:           *string | fn.#Fn
			ServerId:       *string | fn.#Fn
			SshPublicKeys?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			Tags?:          *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			UserName: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workflow: {
		Type: "AWS::Transfer::Workflow"
		Properties: {
			Description?:      *(=~#"^[\w\- ]*$"#) | fn.#Fn
			OnExceptionSteps?: *[...{
				CopyStepDetails?: *{
					[string]: _
				} | fn.#Fn
				CustomStepDetails?: *{
					[string]: _
				} | fn.#Fn
				DeleteStepDetails?: *{
					[string]: _
				} | fn.#Fn
				TagStepDetails?: *{
					[string]: _
				} | fn.#Fn
				Type?: *("COPY" | "CUSTOM" | "DELETE" | "TAG") | fn.#Fn
			}] | fn.#If
			Steps: *[...{
				CopyStepDetails?: *{
					[string]: _
				} | fn.#Fn
				CustomStepDetails?: *{
					[string]: _
				} | fn.#Fn
				DeleteStepDetails?: *{
					[string]: _
				} | fn.#Fn
				TagStepDetails?: *{
					[string]: _
				} | fn.#Fn
				Type?: *("COPY" | "CUSTOM" | "DELETE" | "TAG") | fn.#Fn
			}] | fn.#If
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
}
