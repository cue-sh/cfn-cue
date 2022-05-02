package uswest2

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#IoTTwinMaker: {
	#ComponentType: {
		Type: "AWS::IoTTwinMaker::ComponentType"
		Properties: {
			ComponentTypeId: *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z_\.\-0-9:]+"#)) | fn.#Fn
			Description?:    *string | fn.#Fn
			ExtendsFrom?:    [...(*(=~#"[a-zA-Z_\.\-0-9:]+"#) | fn.#Fn)] | (*(=~#"[a-zA-Z_\.\-0-9:]+"#) | fn.#Fn)
			Functions?:      *{
				[string]: {
					ImplementedBy?: *{
						IsNative?: *bool | fn.#Fn
						Lambda?:   *{
							Arn: *string | fn.#Fn
						} | fn.#If
					} | fn.#If
					RequiredProperties?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Scope?:              *string | fn.#Fn
				}
			} | fn.#If
			IsSingleton?:         *bool | fn.#Fn
			PropertyDefinitions?: *{
				[string]: {
					Configurations?: *{
						[string]: *string | fn.#Fn
					} | fn.#If
					DataType?:           *_#DataType | fn.#If
					DefaultValue?:       *_#DataValue | fn.#If
					IsExternalId?:       *bool | fn.#Fn
					IsRequiredInEntity?: *bool | fn.#Fn
					IsStoredExternally?: *bool | fn.#Fn
					IsTimeSeries?:       *bool | fn.#Fn
				}
			} | fn.#If
			Tags?: *{
				[string]: *string | fn.#Fn
			} | fn.#If
			WorkspaceId: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z_0-9][a-zA-Z_\-0-9]*[a-zA-Z0-9]+"#)) | fn.#Fn
			_#DataType: {
				AllowedValues?: *[..._#DataValue] | fn.#If
				NestedType?:    *_#DataType | fn.#If
				Relationship?:  *{
					RelationshipType?:      *string | fn.#Fn
					TargetComponentTypeId?: *string | fn.#Fn
				} | fn.#If
				Type:           *string | fn.#Fn
				UnitOfMeasure?: *string | fn.#Fn
			}
			_#DataValue: {
				BooleanValue?: *bool | fn.#Fn
				DoubleValue?:  *number | fn.#Fn
				Expression?:   *string | fn.#Fn
				IntegerValue?: *int | fn.#Fn
				ListValue?:    *[..._#DataValue] | fn.#If
				LongValue?:    *number | fn.#Fn
				MapValue?:     *{
					[string]: _#DataValue
				} | fn.#If
				RelationshipValue?: *{
					[string]: _
				} | fn.#Fn
				StringValue?: *string | fn.#Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Entity: {
		Type: "AWS::IoTTwinMaker::Entity"
		Properties: {
			Components?: *{
				[string]: {
					ComponentName?:   *string | fn.#Fn
					ComponentTypeId?: *string | fn.#Fn
					DefinedIn?:       *string | fn.#Fn
					Description?:     *string | fn.#Fn
					Properties?:      *{
						[string]: {
							Definition?: *{
								[string]: _
							} | fn.#Fn
							Value?: *_#DataValue | fn.#If
						}
					} | fn.#If
					Status?: *{
						Error?: *{
							[string]: _
						} | fn.#Fn
						State?: *("CREATING" | "UPDATING" | "DELETING" | "ACTIVE" | "ERROR") | fn.#Fn
					} | fn.#If
				}
			} | fn.#If
			Description?:    *string | fn.#Fn
			EntityId?:       *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}|^[a-zA-Z0-9][a-zA-Z_\-0-9.:]*[a-zA-Z0-9]+"#)) | fn.#Fn
			EntityName:      *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z_0-9-.][a-zA-Z_0-9-. ]*[a-zA-Z0-9]+"#)) | fn.#Fn
			ParentEntityId?: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"\$ROOT|^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}|^[a-zA-Z0-9][a-zA-Z_\-0-9.:]*[a-zA-Z0-9]+"#)) | fn.#Fn
			Tags?:           *{
				[string]: *string | fn.#Fn
			} | fn.#If
			WorkspaceId: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z_0-9][a-zA-Z_\-0-9]*[a-zA-Z0-9]+"#)) | fn.#Fn
			_#DataValue: {
				BooleanValue?: *bool | fn.#Fn
				DoubleValue?:  *number | fn.#Fn
				Expression?:   *string | fn.#Fn
				IntegerValue?: *int | fn.#Fn
				ListValue?:    *[..._#DataValue] | fn.#If
				LongValue?:    *number | fn.#Fn
				MapValue?:     *{
					[string]: _#DataValue
				} | fn.#If
				RelationshipValue?: *{
					[string]: _
				} | fn.#Fn
				StringValue?: *string | fn.#Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Scene: {
		Type: "AWS::IoTTwinMaker::Scene"
		Properties: {
			Capabilities?:   [...(*(=~#".*"#) | fn.#Fn)] | (*(=~#".*"#) | fn.#Fn)
			ContentLocation: *(=~#"[sS]3://[A-Za-z0-9._/-]+"#) | fn.#Fn
			Description?:    *string | fn.#Fn
			SceneId:         *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z_0-9][a-zA-Z_\-0-9]*[a-zA-Z0-9]+"#)) | fn.#Fn
			Tags?:           *{
				[string]: *string | fn.#Fn
			} | fn.#If
			WorkspaceId: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z_0-9][a-zA-Z_\-0-9]*[a-zA-Z0-9]+"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workspace: {
		Type: "AWS::IoTTwinMaker::Workspace"
		Properties: {
			Description?: *string | fn.#Fn
			Role:         *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:((aws)|(aws-cn)|(aws-us-gov)):iam::[0-9]{12}:role/.*"#)) | fn.#Fn
			S3Location:   *string | fn.#Fn
			Tags?:        *{
				[string]: *string | fn.#Fn
			} | fn.#If
			WorkspaceId: *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z_0-9][a-zA-Z_\-0-9]*[a-zA-Z0-9]+"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
