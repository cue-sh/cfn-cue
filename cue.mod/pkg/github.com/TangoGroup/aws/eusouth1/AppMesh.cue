package eusouth1

import "github.com/TangoGroup/aws/fn"

#AppMesh: {
	#Mesh: {
		Type: "AWS::AppMesh::Mesh"
		Properties: {
			MeshName?: *string | fn.#Fn
			Spec?:     *{
				EgressFilter?: *{
					Type: *string | fn.#Fn
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
}
