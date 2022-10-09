package eucentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Rekognition: {
	#Collection: {
		Type: "AWS::Rekognition::Collection"
		Properties: {
			CollectionId: *(=~#"\A[a-zA-Z0-9_\.\-]+$"#) | fn.#Fn
			Tags?:        *[...{
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
	#Project: {
		Type: "AWS::Rekognition::Project"
		Properties: ProjectName: *(strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[a-zA-Z0-9][a-zA-Z0-9_\-]*"#)) | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StreamProcessor: {
		Type: "AWS::Rekognition::StreamProcessor"
		Properties: {
			BoundingBoxRegionsOfInterest?: *[...{
				Height: *number | fn.#Fn
				Left:   *number | fn.#Fn
				Top:    *number | fn.#Fn
				Width:  *number | fn.#Fn
			}] | fn.#If
			ConnectedHomeSettings?: *{
				Labels:         [...(*(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn)
				MinConfidence?: *number | fn.#Fn
			} | fn.#If
			DataSharingPreference?: *{
				OptIn: *bool | fn.#Fn
			} | fn.#If
			FaceSearchSettings?: *{
				CollectionId:        *(=~#"\A[a-zA-Z0-9_\.\-]+$"#) | fn.#Fn
				FaceMatchThreshold?: *number | fn.#Fn
			} | fn.#If
			KinesisDataStream?: *{
				Arn: *(=~#"(^arn:([a-z\d-]+):kinesis:([a-z\d-]+):\d{12}:.+$)"#) | fn.#Fn
			} | fn.#If
			KinesisVideoStream: *{
				Arn: *(=~#"(^arn:([a-z\d-]+):kinesisvideo:([a-z\d-]+):\d{12}:.+$)"#) | fn.#Fn
			} | fn.#If
			KmsKeyId?:            *string | fn.#Fn
			Name?:                *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9_.\-]+"#)) | fn.#Fn
			NotificationChannel?: *{
				Arn: *string | fn.#Fn
			} | fn.#If
			PolygonRegionsOfInterest?: *[...{
				Polygon: *[...{
					X: *number | fn.#Fn
					Y: *number | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			RoleArn:        *(=~#"arn:aws(-[\w]+)*:iam::[0-9]{12}:role/.*"#) | fn.#Fn
			S3Destination?: *{
				BucketName:       *string | fn.#Fn
				ObjectKeyPrefix?: *string | fn.#Fn
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
