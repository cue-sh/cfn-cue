import aws "github.com/cue-sh/cfn-cue/aws/full/ec2s3/uswest2"

template: aws.#Template & {
	Resources: EC2Instance: aws.#EC2.#Instance & {
		Type: "AWS::EC2::Instance"
		Properties: {
			InstanceType: Ref: "InstanceType"
			ImageId: Ref:      "LatestAmiId"
		}
	}
}
