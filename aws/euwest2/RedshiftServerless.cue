package euwest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#RedshiftServerless: {
	#Namespace: {
		Type: "AWS::RedshiftServerless::Namespace"
		Properties: {
			AdminUserPassword?:            *(strings.MinRunes(8) & strings.MaxRunes(64) & (=~#"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^\x00-\x20\x22\x27\x2f\x40\x5c\x7f-\uffff]+"#)) | fn.#Fn
			AdminUsername?:                *(=~#"[a-zA-Z][a-zA-Z_0-9+.@-]*"#) | fn.#Fn
			DbName?:                       *(=~#"[a-zA-Z][a-zA-Z_0-9+.@-]*"#) | fn.#Fn
			DefaultIamRoleArn?:            *string | fn.#Fn
			FinalSnapshotName?:            *(=~#"[a-z][a-z0-9]*(-[a-z0-9]+)*"#) | fn.#Fn
			FinalSnapshotRetentionPeriod?: *int | fn.#Fn
			IamRoles?:                     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			KmsKeyId?:                     *string | fn.#Fn
			LogExports?:                   [...(*("useractivitylog" | "userlog" | "connectionlog") | fn.#Fn)] | (*("useractivitylog" | "userlog" | "connectionlog") | fn.#Fn)
			NamespaceName:                 *(strings.MinRunes(3) & strings.MaxRunes(64) & (=~#"^[a-z0-9-]+$"#)) | fn.#Fn
			Tags?:                         *[...{
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
