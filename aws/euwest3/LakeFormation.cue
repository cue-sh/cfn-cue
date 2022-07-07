package euwest3

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#LakeFormation: {
	#DataCellsFilter: {
		Type: "AWS::LakeFormation::DataCellsFilter"
		Properties: {
			ColumnNames?:    [...(*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)
			ColumnWildcard?: *{
				ExcludedColumnNames?: [...(*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)
			} | fn.#If
			DatabaseName: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
			Name:         *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
			RowFilter?:   *{
				AllRowsWildcard?: *{
					[string]: _
				} | fn.#Fn
				FilterExpression?: *string | fn.#Fn
			} | fn.#If
			TableCatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
			TableName:      *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PrincipalPermissions: {
		Type: "AWS::LakeFormation::PrincipalPermissions"
		Properties: {
			Catalog?:                   *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
			Permissions:                [...(*("ALL" | "SELECT" | "ALTER" | "DROP" | "DELETE" | "INSERT" | "DESCRIBE" | "CREATE_DATABASE" | "CREATE_TABLE" | "DATA_LOCATION_ACCESS" | "CREATE_TAG" | "ASSOCIATE") | fn.#Fn)] | (*("ALL" | "SELECT" | "ALTER" | "DROP" | "DELETE" | "INSERT" | "DESCRIBE" | "CREATE_DATABASE" | "CREATE_TABLE" | "DATA_LOCATION_ACCESS" | "CREATE_TAG" | "ASSOCIATE") | fn.#Fn)
			PermissionsWithGrantOption: [...(*("ALL" | "SELECT" | "ALTER" | "DROP" | "DELETE" | "INSERT" | "DESCRIBE" | "CREATE_DATABASE" | "CREATE_TABLE" | "DATA_LOCATION_ACCESS" | "CREATE_TAG" | "ASSOCIATE") | fn.#Fn)] | (*("ALL" | "SELECT" | "ALTER" | "DROP" | "DELETE" | "INSERT" | "DESCRIBE" | "CREATE_DATABASE" | "CREATE_TABLE" | "DATA_LOCATION_ACCESS" | "CREATE_TAG" | "ASSOCIATE") | fn.#Fn)
			Principal:                  *{
				DataLakePrincipalIdentifier?: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
			} | fn.#If
			Resource: *{
				Catalog?:         *{} | fn.#If
				DataCellsFilter?: *{
					DatabaseName:   *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Name:           *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					TableCatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					TableName:      *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				} | fn.#If
				DataLocation?: *{
					CatalogId:   *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					ResourceArn: *string | fn.#Fn
				} | fn.#If
				Database?: *{
					CatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					Name:      *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				} | fn.#If
				LFTag?: *{
					CatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					TagKey:    *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					TagValues: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				} | fn.#If
				LFTagPolicy?: *{
					CatalogId:  *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					Expression: *[...{
						TagKey?:    *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
						TagValues?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					}] | fn.#If
					ResourceType: *("DATABASE" | "TABLE") | fn.#Fn
				} | fn.#If
				Table?: *{
					CatalogId:      *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					DatabaseName:   *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Name?:          *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					TableWildcard?: *{} | fn.#If
				} | fn.#If
				TableWithColumns?: *{
					CatalogId:       *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					ColumnNames?:    [...(*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)
					ColumnWildcard?: *{
						ExcludedColumnNames?: [...(*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)
					} | fn.#If
					DatabaseName: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Name:         *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Tag: {
		Type: "AWS::LakeFormation::Tag"
		Properties: {
			CatalogId?: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
			TagKey:     *(strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^([{a-zA-Z}{\s}{0-9}_.:\/=+\-@%]*)$"#)) | fn.#Fn
			TagValues:  [...(*(=~#"^([{a-zA-Z}{\s}{0-9}_.:\*\/=+\-@%]*)$"#) | fn.#Fn)] | (*(=~#"^([{a-zA-Z}{\s}{0-9}_.:\*\/=+\-@%]*)$"#) | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TagAssociation: {
		Type: "AWS::LakeFormation::TagAssociation"
		Properties: {
			LFTags: *[...{
				CatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
				TagKey:    *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				TagValues: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			Resource: *{
				Catalog?:  *{} | fn.#If
				Database?: *{
					CatalogId: *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					Name:      *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				} | fn.#If
				Table?: *{
					CatalogId:      *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					DatabaseName:   *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Name?:          *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					TableWildcard?: *{} | fn.#If
				} | fn.#If
				TableWithColumns?: *{
					CatalogId:    *(strings.MinRunes(12) & strings.MaxRunes(12)) | fn.#Fn
					ColumnNames:  [...(*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn)
					DatabaseName: *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
					Name:         *(strings.MinRunes(1) & strings.MaxRunes(255)) | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
