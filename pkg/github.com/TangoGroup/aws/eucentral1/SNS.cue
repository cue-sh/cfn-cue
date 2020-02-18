package eucentral1

import "github.com/TangoGroup/aws/fn"

SNS :: {
	Subscription :: {
		Type: "AWS::SNS::Subscription"
		Properties: {
			DeliveryPolicy?: {
				[string]: _
			} | fn.Fn
			Endpoint?:     string | fn.Fn
			FilterPolicy?: {
				[string]: _
			} | fn.Fn
			Protocol:            ("application" | "email-json" | "email" | "http" | "https" | "lambda" | "sms" | "sqs") | fn.Fn
			RawMessageDelivery?: bool | fn.Fn
			RedrivePolicy?:      {
				[string]: _
			} | fn.Fn
			Region?:  string | fn.Fn
			TopicArn: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Topic :: {
		Type: "AWS::SNS::Topic"
		Properties: {
			DisplayName?:    string | fn.Fn
			KmsMasterKeyId?: string | fn.Fn
			Subscription?:   [...close({
				Endpoint: string | fn.Fn
				Protocol: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TopicName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicPolicy :: {
		Type: "AWS::SNS::TopicPolicy"
		Properties: {
			PolicyDocument: {
				[string]: _
			} | fn.Fn
			Topics: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
