import aws "github.com/cue-sh/cfn-cue/aws/full/ec2s3/uswest2"

template: aws.#Template & {
	Resources: S3Bucket1: {
		Type: "AWS::S3::Bucket"
		Properties: BucketName: "the-bucket"
		Properties: AccessControl: Ref: "S3AccessControl"
	}
	Resources: EC2Instance: {
		Type: "AWS::EC2::Instance"
		Properties: {
			InstanceType: Ref: "InstanceType"
			ImageId: Ref:      "LatestAmiId"
		}
	}
}
