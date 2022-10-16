package useast2

import "github.com/cue-sh/cfn-cue/aws/fn"

#Pinpoint: {
	#InAppTemplate: {
		Type: "AWS::Pinpoint::InAppTemplate"
		Properties: {
			Content?: *[...{
				BackgroundColor?: *string | fn.#Fn
				BodyConfig?:      *{
					Alignment?: *("LEFT" | "CENTER" | "RIGHT") | fn.#Fn
					Body?:      *string | fn.#Fn
					TextColor?: *string | fn.#Fn
				} | fn.#If
				HeaderConfig?: *{
					Alignment?: *("LEFT" | "CENTER" | "RIGHT") | fn.#Fn
					Header?:    *string | fn.#Fn
					TextColor?: *string | fn.#Fn
				} | fn.#If
				ImageUrl?:   *string | fn.#Fn
				PrimaryBtn?: *{
					Android?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
					DefaultConfig?: *{
						BackgroundColor?: *string | fn.#Fn
						BorderRadius?:    *int | fn.#Fn
						ButtonAction?:    *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:            *string | fn.#Fn
						Text?:            *string | fn.#Fn
						TextColor?:       *string | fn.#Fn
					} | fn.#If
					IOS?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
					Web?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				SecondaryBtn?: *{
					Android?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
					DefaultConfig?: *{
						BackgroundColor?: *string | fn.#Fn
						BorderRadius?:    *int | fn.#Fn
						ButtonAction?:    *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:            *string | fn.#Fn
						Text?:            *string | fn.#Fn
						TextColor?:       *string | fn.#Fn
					} | fn.#If
					IOS?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
					Web?: *{
						ButtonAction?: *("LINK" | "DEEP_LINK" | "CLOSE") | fn.#Fn
						Link?:         *string | fn.#Fn
					} | fn.#If
				} | fn.#If
			}] | fn.#If
			CustomConfig?: *{
				[string]: _
			} | fn.#Fn
			Layout?: *("BOTTOM_BANNER" | "TOP_BANNER" | "OVERLAYS" | "MOBILE_FEED" | "MIDDLE_BANNER" | "CAROUSEL") | fn.#Fn
			Tags?:   *{
				[string]: _
			} | fn.#Fn
			TemplateDescription?: *string | fn.#Fn
			TemplateName:         *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
