package useast1

import "github.com/cue-sh/cfn-cue/aws/fn"

#ResourceExplorer2: {
	#DefaultViewAssociation: {
		Type: "AWS::ResourceExplorer2::DefaultViewAssociation"
		Properties: ViewArn: *string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Index: {
		Type: "AWS::ResourceExplorer2::Index"
		Properties: {
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			Type: *("LOCAL" | "AGGREGATOR") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#View: {
		Type: "AWS::ResourceExplorer2::View"
		Properties: {
			Filters?: *{
				FilterString: *string | fn.#Fn
			} | fn.#If
			IncludedProperties?: *[...{
				Name: *string | fn.#Fn
			}] | fn.#If
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			ViewName: *(=~#"^[a-zA-Z0-9\-]{1,64}$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
