package usgovwest1

import "github.com/cue-sh/cfn-cue/aws/fn"

#SageMaker: {
	#NotebookInstance: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			AdditionalCodeRepositories?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			DefaultCodeRepository?:      *string | fn.#Fn
			DirectInternetAccess?:       *string | fn.#Fn
			InstanceType:                *string | fn.#Fn
			KmsKeyId?:                   *string | fn.#Fn
			LifecycleConfigName?:        *string | fn.#Fn
			NotebookInstanceName?:       *string | fn.#Fn
			RoleArn:                     *string | fn.#Fn
			RootAccess?:                 *string | fn.#Fn
			SecurityGroupIds?:           [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SubnetId?:                   *string | fn.#Fn
			Tags?:                       *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VolumeSizeInGB?: *(>=5 & <=16384) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
