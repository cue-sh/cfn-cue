package apsoutheast1

import "github.com/cue-sh/cfn-cue/aws/fn"

#RoboMaker: {
	#Fleet: {
		Type: "AWS::RoboMaker::Fleet"
		Properties: {
			Name?: *string | fn.#Fn
			Tags?: *{
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Robot: {
		Type: "AWS::RoboMaker::Robot"
		Properties: {
			Architecture:      *string | fn.#Fn
			Fleet?:            *string | fn.#Fn
			GreengrassGroupId: *string | fn.#Fn
			Name?:             *string | fn.#Fn
			Tags?:             *{
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RobotApplication: {
		Type: "AWS::RoboMaker::RobotApplication"
		Properties: {
			CurrentRevisionId?: *string | fn.#Fn
			Name?:              *string | fn.#Fn
			RobotSoftwareSuite: *{
				Name:    *string | fn.#Fn
				Version: *string | fn.#Fn
			} | fn.#If
			Sources: *[...{
				Architecture: *string | fn.#Fn
				S3Bucket:     *string | fn.#Fn
				S3Key:        *string | fn.#Fn
			}] | fn.#If
			Tags?: *{
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RobotApplicationVersion: {
		Type: "AWS::RoboMaker::RobotApplicationVersion"
		Properties: {
			Application:        *string | fn.#Fn
			CurrentRevisionId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SimulationApplication: {
		Type: "AWS::RoboMaker::SimulationApplication"
		Properties: {
			CurrentRevisionId?: *string | fn.#Fn
			Name?:              *string | fn.#Fn
			RenderingEngine:    *{
				Name:    *string | fn.#Fn
				Version: *string | fn.#Fn
			} | fn.#If
			RobotSoftwareSuite: *{
				Name:    *string | fn.#Fn
				Version: *string | fn.#Fn
			} | fn.#If
			SimulationSoftwareSuite: *{
				Name:    *string | fn.#Fn
				Version: *string | fn.#Fn
			} | fn.#If
			Sources: *[...{
				Architecture: *string | fn.#Fn
				S3Bucket:     *string | fn.#Fn
				S3Key:        *string | fn.#Fn
			}] | fn.#If
			Tags?: *{
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SimulationApplicationVersion: {
		Type: "AWS::RoboMaker::SimulationApplicationVersion"
		Properties: {
			Application:        *string | fn.#Fn
			CurrentRevisionId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
