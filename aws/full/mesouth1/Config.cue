package mesouth1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Config: {
	#AggregationAuthorization: {
		Type: "AWS::Config::AggregationAuthorization"
		Properties: {
			AuthorizedAccountId: *string | fn.#Fn
			AuthorizedAwsRegion: *("af-south-1" | "ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" | "ap-south-1" | "ap-southeast-1" | "ap-southeast-2" | "ca-central-1" | "eu-central-1" | "eu-north-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "sa-east-1" | "us-east-1" | "us-east-2" | "us-gov-east-1" | "us-gov-west-1" | "us-west-1" | "us-west-2") | fn.#Fn
			Tags?:               *[...{
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
	#ConfigRule: {
		Type: "AWS::Config::ConfigRule"
		Properties: {
			ConfigRuleName?:  *string | fn.#Fn
			Description?:     *(strings.MinRunes(1) & strings.MaxRunes(256)) | fn.#Fn
			InputParameters?: *{
				[string]: _
			} | fn.#Fn
			MaximumExecutionFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
			Scope?:                     *{
				ComplianceResourceId?:    *string | fn.#Fn
				ComplianceResourceTypes?: [...(*("AWS::ACM::Certificate" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::Stage" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::Config::ConformancePackCompliance" | "AWS::Config::ResourceCompliance" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RegisteredHAInstance" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::VPC" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::EC2::Volume" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::NetworkFirewall::Firewall" | "AWS::NetworkFirewall::FirewallPolicy" | "AWS::NetworkFirewall::RuleGroup" | "AWS::QLDB::Ledger" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterSnapshot" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::AccountPublicAccessBlock" | "AWS::S3::Bucket" | "AWS::SNS::Topic" | "AWS::SQS::Queue" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::FileData" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::SecretsManager::Secret" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::ManagedRuleSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::XRay::EncryptionConfig") | fn.#Fn)] | (*("AWS::ACM::Certificate" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::Stage" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::Config::ConformancePackCompliance" | "AWS::Config::ResourceCompliance" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RegisteredHAInstance" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::VPC" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::EC2::Volume" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::NetworkFirewall::Firewall" | "AWS::NetworkFirewall::FirewallPolicy" | "AWS::NetworkFirewall::RuleGroup" | "AWS::QLDB::Ledger" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterSnapshot" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::AccountPublicAccessBlock" | "AWS::S3::Bucket" | "AWS::SNS::Topic" | "AWS::SQS::Queue" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::FileData" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::SecretsManager::Secret" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::ManagedRuleSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::XRay::EncryptionConfig") | fn.#Fn)
				TagKey?:                  *string | fn.#Fn
				TagValue?:                *string | fn.#Fn
			} | fn.#If
			Source: *{
				Owner:          *("AWS" | "CUSTOM_LAMBDA") | fn.#Fn
				SourceDetails?: *[...{
					EventSource:                *("aws.config") | fn.#Fn
					MaximumExecutionFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
					MessageType:                *("ConfigurationItemChangeNotification" | "ConfigurationSnapshotDeliveryCompleted" | "OversizedConfigurationItemChangeNotification" | "ScheduledNotification") | fn.#Fn
				}] | fn.#If
				SourceIdentifier: *string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConfigurationAggregator: {
		Type: "AWS::Config::ConfigurationAggregator"
		Properties: {
			AccountAggregationSources?: *[...{
				AccountIds:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				AllAwsRegions?: *bool | fn.#Fn
				AwsRegions?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			}] | fn.#If
			ConfigurationAggregatorName:    *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[\w\-]+"#)) | fn.#Fn
			OrganizationAggregationSource?: *{
				AllAwsRegions?: *bool | fn.#Fn
				AwsRegions?:    [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				RoleArn:        *string | fn.#Fn
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
	#ConfigurationRecorder: {
		Type: "AWS::Config::ConfigurationRecorder"
		Properties: {
			Name?:           *string | fn.#Fn
			RecordingGroup?: *{
				AllSupported?:               *bool | fn.#Fn
				IncludeGlobalResourceTypes?: *bool | fn.#Fn
				ResourceTypes?:              [...(*("AWS::ACM::Certificate" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::Stage" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::Config::ConformancePackCompliance" | "AWS::Config::ResourceCompliance" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RegisteredHAInstance" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::VPC" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::EC2::Volume" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::NetworkFirewall::Firewall" | "AWS::NetworkFirewall::FirewallPolicy" | "AWS::NetworkFirewall::RuleGroup" | "AWS::QLDB::Ledger" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterSnapshot" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::AccountPublicAccessBlock" | "AWS::S3::Bucket" | "AWS::SNS::Topic" | "AWS::SQS::Queue" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::FileData" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::SecretsManager::Secret" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::ManagedRuleSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::XRay::EncryptionConfig") | fn.#Fn)] | (*("AWS::ACM::Certificate" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::Stage" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::Config::ConformancePackCompliance" | "AWS::Config::ResourceCompliance" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RegisteredHAInstance" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::VPC" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::EC2::Volume" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::NetworkFirewall::Firewall" | "AWS::NetworkFirewall::FirewallPolicy" | "AWS::NetworkFirewall::RuleGroup" | "AWS::QLDB::Ledger" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterSnapshot" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::AccountPublicAccessBlock" | "AWS::S3::Bucket" | "AWS::SNS::Topic" | "AWS::SQS::Queue" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::FileData" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::SecretsManager::Secret" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::ManagedRuleSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::XRay::EncryptionConfig") | fn.#Fn)
			} | fn.#If
			RoleARN: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConformancePack: {
		Type: "AWS::Config::ConformancePack"
		Properties: {
			ConformancePackInputParameters?: *[...{
				ParameterName:  *string | fn.#Fn
				ParameterValue: *string | fn.#Fn
			}] | fn.#If
			ConformancePackName:  *(strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z][-a-zA-Z0-9]*"#)) | fn.#Fn
			DeliveryS3Bucket?:    *string | fn.#Fn
			DeliveryS3KeyPrefix?: *string | fn.#Fn
			TemplateBody?:        *(strings.MinRunes(1) & strings.MaxRunes(51200)) | fn.#Fn
			TemplateS3Uri?:       *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"s3://.*"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeliveryChannel: {
		Type: "AWS::Config::DeliveryChannel"
		Properties: {
			ConfigSnapshotDeliveryProperties?: *{
				DeliveryFrequency?: *("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours") | fn.#Fn
			} | fn.#If
			Name?:        *string | fn.#Fn
			S3BucketName: *string | fn.#Fn
			S3KeyPrefix?: *string | fn.#Fn
			S3KmsKeyArn?: *string | fn.#Fn
			SnsTopicARN?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StoredQuery: {
		Type: "AWS::Config::StoredQuery"
		Properties: {
			QueryDescription?: *(=~#"[\s\S]*"#) | fn.#Fn
			QueryExpression:   *(strings.MinRunes(1) & strings.MaxRunes(4096) & (=~#"[\s\S]*"#)) | fn.#Fn
			QueryName:         *(strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9-_]+$"#)) | fn.#Fn
			Tags?:             *[...{
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
