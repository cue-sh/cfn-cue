package apsoutheast1

import "github.com/TangoGroup/aws/fn"

RAM :: {
	ResourceShare :: {
		Type: "AWS::RAM::ResourceShare"
		Properties: {
			AllowExternalPrincipals?: bool | fn.Fn
			Name:                     string | fn.Fn
			Principals?: [...(string | fn.Fn)]
			ResourceArns?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
