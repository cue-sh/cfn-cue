package eucentral1

import "github.com/TangoGroup/aws/fn"

#SNS: {
	#Subscription: {
		Type: "AWS::SNS::Subscription"
		Properties: {
			DeliveryPolicy?: *{
				[string]: _
			} | fn.#Fn
			Endpoint?:     *string | fn.#Fn
			FilterPolicy?: *{
				[string]: _
			} | fn.#Fn
			Protocol:            *("application" | "email-json" | "email" | "firehose" | "http" | "https" | "lambda" | "sms" | "sqs") | fn.#Fn
			RawMessageDelivery?: *bool | fn.#Fn
			RedrivePolicy?:      *{
				[string]: _
			} | fn.#Fn
			Region?:              *string | fn.#Fn
			SubscriptionRoleArn?: *string | fn.#Fn
			TopicArn:             *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Topic: {
		Type: "AWS::SNS::Topic"
		Properties: {
			ContentBasedDeduplication?: *bool | fn.#Fn
			DisplayName?:               *string | fn.#Fn
			FifoTopic?:                 *bool | fn.#Fn
			KmsMasterKeyId?:            *string | fn.#Fn
			Subscription?:              *[...{
				Endpoint: *string | fn.#Fn
				Protocol: *string | fn.#Fn
			}] | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TopicName?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TopicPolicy: {
		Type: "AWS::SNS::TopicPolicy"
		Properties: {
			PolicyDocument: *{
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			Topics: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
