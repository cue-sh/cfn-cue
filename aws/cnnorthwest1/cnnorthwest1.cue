package cnnorthwest1

import "github.com/cue-sh/cfn-cue/aws/fn"

#ResourceSpecificationVersion: "61.0.0"
#Template: {
	AWSTemplateFormatVersion?: "2010-09-09"
	Description?:              string
	Metadata?: [string]: _
	Mappings?: [string]: [string]: [=~"[a-zA-Z0-9]"]: string | int | bool | [...(string | int | bool)]
	Conditions?: [string]: fn.#And | fn.#Equals | fn.#If | fn.#Not | fn.#Or
	Parameters?: [=~"[a-zA-Z0-9]"]: {
		Type:                   "AWS::EC2::AvailabilityZone::Name" | "AWS::EC2::Image::Id" | "AWS::EC2::Instance::Id" | "AWS::EC2::KeyPair::KeyName" | "AWS::EC2::SecurityGroup::GroupName" | "AWS::EC2::SecurityGroup::Id" | "AWS::EC2::Subnet::Id" | "AWS::EC2::VPC::Id" | "AWS::EC2::Volume::Id" | "AWS::Route53::HostedZone::Id" | "AWS::SSM::Parameter::Name" | "AWS::SSM::Parameter::Value<AWS::EC2::AvailabilityZone::Name>" | "AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Instance::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::KeyPair::KeyName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::GroupName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Subnet::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Volume::Id>" | "AWS::SSM::Parameter::Value<AWS::Route53::HostedZone::Id>" | "AWS::SSM::Parameter::Value<CommaDelimitedList>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::AvailabilityZone::Name>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Image::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Instance::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::KeyPair::KeyName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::GroupName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Subnet::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::VPC::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Volume::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::Route53::HostedZone::Id>>" | "AWS::SSM::Parameter::Value<List<String>>" | "AWS::SSM::Parameter::Value<String>" | "CommaDelimitedList" | "List<AWS::EC2::AvailabilityZone::Name>" | "List<AWS::EC2::Image::Id>" | "List<AWS::EC2::Instance::Id>" | "List<AWS::EC2::SecurityGroup::GroupName>" | "List<AWS::EC2::SecurityGroup::Id>" | "List<AWS::EC2::Subnet::Id>" | "List<AWS::EC2::VPC::Id>" | "List<AWS::EC2::Volume::Id>" | "List<AWS::Route53::HostedZone::Id>" | "List<Number>" | "Number" | "String"
		AllowedPattern?:        string
		AllowedValues?:         [...(string | number | bool)]
		ConstraintDescription?: string
		Default?:               string | number | bool
		Description?:           string
		MaxLength?:             int | =~"^[0-9]+$"
		MaxValue?:              int | =~"^[0-9]+$"
		MinLength?:             int | =~"^[0-9]+$"
		MinValue?:              int | =~"^[0-9]+$"
		NoEcho?:                bool | =~"^(true|false)$"
	}
	Resources: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Type:         "AWS::AccessAnalyzer::Analyzer" | "AWS::AmazonMQ::Broker" | "AWS::AmazonMQ::Configuration" | "AWS::AmazonMQ::ConfigurationAssociation" | "AWS::ApiGateway::Account" | "AWS::ApiGateway::ApiKey" | "AWS::ApiGateway::Authorizer" | "AWS::ApiGateway::BasePathMapping" | "AWS::ApiGateway::ClientCertificate" | "AWS::ApiGateway::Deployment" | "AWS::ApiGateway::DocumentationPart" | "AWS::ApiGateway::DocumentationVersion" | "AWS::ApiGateway::DomainName" | "AWS::ApiGateway::GatewayResponse" | "AWS::ApiGateway::Method" | "AWS::ApiGateway::Model" | "AWS::ApiGateway::RequestValidator" | "AWS::ApiGateway::Resource" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGateway::UsagePlan" | "AWS::ApiGateway::UsagePlanKey" | "AWS::ApiGateway::VpcLink" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::ApiGatewayManagedOverrides" | "AWS::ApiGatewayV2::ApiMapping" | "AWS::ApiGatewayV2::Authorizer" | "AWS::ApiGatewayV2::Deployment" | "AWS::ApiGatewayV2::DomainName" | "AWS::ApiGatewayV2::Integration" | "AWS::ApiGatewayV2::IntegrationResponse" | "AWS::ApiGatewayV2::Model" | "AWS::ApiGatewayV2::Route" | "AWS::ApiGatewayV2::RouteResponse" | "AWS::ApiGatewayV2::Stage" | "AWS::ApiGatewayV2::VpcLink" | "AWS::AppConfig::Application" | "AWS::AppConfig::ConfigurationProfile" | "AWS::AppConfig::Deployment" | "AWS::AppConfig::DeploymentStrategy" | "AWS::AppConfig::Environment" | "AWS::AppConfig::HostedConfigurationVersion" | "AWS::AppSync::ApiCache" | "AWS::AppSync::ApiKey" | "AWS::AppSync::DataSource" | "AWS::AppSync::FunctionConfiguration" | "AWS::AppSync::GraphQLApi" | "AWS::AppSync::GraphQLSchema" | "AWS::AppSync::Resolver" | "AWS::ApplicationAutoScaling::ScalableTarget" | "AWS::ApplicationAutoScaling::ScalingPolicy" | "AWS::ApplicationInsights::Application" | "AWS::Athena::DataCatalog" | "AWS::Athena::NamedQuery" | "AWS::Athena::PreparedStatement" | "AWS::Athena::WorkGroup" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::LifecycleHook" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::AutoScaling::WarmPool" | "AWS::AutoScalingPlans::ScalingPlan" | "AWS::Backup::BackupPlan" | "AWS::Backup::BackupSelection" | "AWS::Backup::BackupVault" | "AWS::Batch::ComputeEnvironment" | "AWS::Batch::JobDefinition" | "AWS::Batch::JobQueue" | "AWS::Batch::SchedulingPolicy" | "AWS::Budgets::Budget" | "AWS::Budgets::BudgetsAction" | "AWS::CDK::Metadata" | "AWS::CE::CostCategory" | "AWS::CUR::ReportDefinition" | "AWS::Cassandra::Keyspace" | "AWS::Cassandra::Table" | "AWS::CertificateManager::Account" | "AWS::CertificateManager::Certificate" | "AWS::CloudFormation::CustomResource" | "AWS::CloudFormation::Macro" | "AWS::CloudFormation::ModuleDefaultVersion" | "AWS::CloudFormation::ModuleVersion" | "AWS::CloudFormation::ResourceDefaultVersion" | "AWS::CloudFormation::ResourceVersion" | "AWS::CloudFormation::Stack" | "AWS::CloudFormation::StackSet" | "AWS::CloudFormation::WaitCondition" | "AWS::CloudFormation::WaitConditionHandle" | "AWS::CloudFront::CachePolicy" | "AWS::CloudFront::CloudFrontOriginAccessIdentity" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::KeyGroup" | "AWS::CloudFront::OriginRequestPolicy" | "AWS::CloudFront::PublicKey" | "AWS::CloudFront::RealtimeLogConfig" | "AWS::CloudFront::ResponseHeadersPolicy" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CloudWatch::AnomalyDetector" | "AWS::CloudWatch::CompositeAlarm" | "AWS::CloudWatch::Dashboard" | "AWS::CloudWatch::InsightRule" | "AWS::CodeBuild::Project" | "AWS::CodeBuild::ReportGroup" | "AWS::CodeBuild::SourceCredential" | "AWS::CodeCommit::Repository" | "AWS::CodeDeploy::Application" | "AWS::CodeDeploy::DeploymentConfig" | "AWS::CodeDeploy::DeploymentGroup" | "AWS::CodePipeline::CustomActionType" | "AWS::CodePipeline::Pipeline" | "AWS::Config::AggregationAuthorization" | "AWS::Config::ConfigRule" | "AWS::Config::ConfigurationRecorder" | "AWS::Config::DeliveryChannel" | "AWS::Config::OrganizationConfigRule" | "AWS::Config::RemediationConfiguration" | "AWS::DAX::Cluster" | "AWS::DAX::ParameterGroup" | "AWS::DAX::SubnetGroup" | "AWS::DLM::LifecyclePolicy" | "AWS::DMS::Certificate" | "AWS::DMS::Endpoint" | "AWS::DMS::EventSubscription" | "AWS::DMS::ReplicationInstance" | "AWS::DMS::ReplicationSubnetGroup" | "AWS::DMS::ReplicationTask" | "AWS::DataBrew::Dataset" | "AWS::DataBrew::Job" | "AWS::DataBrew::Project" | "AWS::DataBrew::Recipe" | "AWS::DataBrew::Ruleset" | "AWS::DataBrew::Schedule" | "AWS::DirectoryService::MicrosoftAD" | "AWS::DirectoryService::SimpleAD" | "AWS::DocDB::DBCluster" | "AWS::DocDB::DBClusterParameterGroup" | "AWS::DocDB::DBInstance" | "AWS::DocDB::DBSubnetGroup" | "AWS::DynamoDB::GlobalTable" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::DHCPOptions" | "AWS::EC2::EC2Fleet" | "AWS::EC2::EIP" | "AWS::EC2::EIPAssociation" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::GatewayRouteTableAssociation" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::LaunchTemplate" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkAclEntry" | "AWS::EC2::NetworkInterface" | "AWS::EC2::NetworkInterfaceAttachment" | "AWS::EC2::NetworkInterfacePermission" | "AWS::EC2::PlacementGroup" | "AWS::EC2::Route" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::SecurityGroupEgress" | "AWS::EC2::SecurityGroupIngress" | "AWS::EC2::SpotFleet" | "AWS::EC2::Subnet" | "AWS::EC2::SubnetCidrBlock" | "AWS::EC2::SubnetNetworkAclAssociation" | "AWS::EC2::SubnetRouteTableAssociation" | "AWS::EC2::TrafficMirrorFilter" | "AWS::EC2::TrafficMirrorFilterRule" | "AWS::EC2::TrafficMirrorSession" | "AWS::EC2::TrafficMirrorTarget" | "AWS::EC2::TransitGateway" | "AWS::EC2::TransitGatewayAttachment" | "AWS::EC2::TransitGatewayRoute" | "AWS::EC2::TransitGatewayRouteTable" | "AWS::EC2::TransitGatewayRouteTableAssociation" | "AWS::EC2::TransitGatewayRouteTablePropagation" | "AWS::EC2::VPC" | "AWS::EC2::VPCCidrBlock" | "AWS::EC2::VPCDHCPOptionsAssociation" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointConnectionNotification" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCEndpointServicePermissions" | "AWS::EC2::VPCGatewayAttachment" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNConnectionRoute" | "AWS::EC2::VPNGateway" | "AWS::EC2::VPNGatewayRoutePropagation" | "AWS::EC2::Volume" | "AWS::EC2::VolumeAttachment" | "AWS::ECR::Repository" | "AWS::ECS::CapacityProvider" | "AWS::ECS::Cluster" | "AWS::ECS::ClusterCapacityProviderAssociations" | "AWS::ECS::PrimaryTaskSet" | "AWS::ECS::Service" | "AWS::ECS::TaskDefinition" | "AWS::ECS::TaskSet" | "AWS::EFS::AccessPoint" | "AWS::EFS::FileSystem" | "AWS::EFS::MountTarget" | "AWS::EKS::Addon" | "AWS::EKS::Cluster" | "AWS::EKS::IdentityProviderConfig" | "AWS::EKS::Nodegroup" | "AWS::EMR::Cluster" | "AWS::EMR::InstanceFleetConfig" | "AWS::EMR::InstanceGroupConfig" | "AWS::EMR::SecurityConfiguration" | "AWS::EMR::Step" | "AWS::ElastiCache::CacheCluster" | "AWS::ElastiCache::GlobalReplicationGroup" | "AWS::ElastiCache::ParameterGroup" | "AWS::ElastiCache::ReplicationGroup" | "AWS::ElastiCache::SecurityGroup" | "AWS::ElastiCache::SecurityGroupIngress" | "AWS::ElastiCache::SubnetGroup" | "AWS::ElastiCache::User" | "AWS::ElastiCache::UserGroup" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::ConfigurationTemplate" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::Listener" | "AWS::ElasticLoadBalancingV2::ListenerCertificate" | "AWS::ElasticLoadBalancingV2::ListenerRule" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::ElasticLoadBalancingV2::TargetGroup" | "AWS::Elasticsearch::Domain" | "AWS::Events::EventBus" | "AWS::Events::EventBusPolicy" | "AWS::Events::Rule" | "AWS::FSx::FileSystem" | "AWS::GameLift::Alias" | "AWS::GameLift::Build" | "AWS::GameLift::Fleet" | "AWS::GameLift::GameServerGroup" | "AWS::GameLift::GameSessionQueue" | "AWS::GameLift::MatchmakingConfiguration" | "AWS::GameLift::MatchmakingRuleSet" | "AWS::GameLift::Script" | "AWS::Glue::Classifier" | "AWS::Glue::Connection" | "AWS::Glue::Crawler" | "AWS::Glue::DataCatalogEncryptionSettings" | "AWS::Glue::Database" | "AWS::Glue::DevEndpoint" | "AWS::Glue::Job" | "AWS::Glue::Partition" | "AWS::Glue::Registry" | "AWS::Glue::Schema" | "AWS::Glue::SchemaVersion" | "AWS::Glue::SchemaVersionMetadata" | "AWS::Glue::SecurityConfiguration" | "AWS::Glue::Table" | "AWS::Glue::Trigger" | "AWS::Glue::Workflow" | "AWS::GuardDuty::Detector" | "AWS::GuardDuty::Filter" | "AWS::GuardDuty::IPSet" | "AWS::GuardDuty::Master" | "AWS::GuardDuty::Member" | "AWS::GuardDuty::ThreatIntelSet" | "AWS::IAM::AccessKey" | "AWS::IAM::Group" | "AWS::IAM::InstanceProfile" | "AWS::IAM::ManagedPolicy" | "AWS::IAM::OIDCProvider" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::SAMLProvider" | "AWS::IAM::ServerCertificate" | "AWS::IAM::ServiceLinkedRole" | "AWS::IAM::User" | "AWS::IAM::UserToGroupAddition" | "AWS::IAM::VirtualMFADevice" | "AWS::ImageBuilder::Component" | "AWS::ImageBuilder::ContainerRecipe" | "AWS::ImageBuilder::DistributionConfiguration" | "AWS::ImageBuilder::Image" | "AWS::ImageBuilder::ImagePipeline" | "AWS::ImageBuilder::ImageRecipe" | "AWS::ImageBuilder::InfrastructureConfiguration" | "AWS::IoT::AccountAuditConfiguration" | "AWS::IoT::Authorizer" | "AWS::IoT::Certificate" | "AWS::IoT::CustomMetric" | "AWS::IoT::Dimension" | "AWS::IoT::DomainConfiguration" | "AWS::IoT::FleetMetric" | "AWS::IoT::JobTemplate" | "AWS::IoT::Logging" | "AWS::IoT::MitigationAction" | "AWS::IoT::Policy" | "AWS::IoT::PolicyPrincipalAttachment" | "AWS::IoT::ProvisioningTemplate" | "AWS::IoT::ResourceSpecificLogging" | "AWS::IoT::ScheduledAudit" | "AWS::IoT::SecurityProfile" | "AWS::IoT::Thing" | "AWS::IoT::ThingPrincipalAttachment" | "AWS::IoT::TopicRule" | "AWS::IoT::TopicRuleDestination" | "AWS::KMS::Alias" | "AWS::KMS::Key" | "AWS::Kinesis::Stream" | "AWS::Kinesis::StreamConsumer" | "AWS::KinesisAnalytics::Application" | "AWS::KinesisAnalytics::ApplicationOutput" | "AWS::KinesisAnalytics::ApplicationReferenceDataSource" | "AWS::KinesisAnalyticsV2::Application" | "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption" | "AWS::KinesisAnalyticsV2::ApplicationOutput" | "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource" | "AWS::KinesisFirehose::DeliveryStream" | "AWS::Lambda::Alias" | "AWS::Lambda::EventInvokeConfig" | "AWS::Lambda::EventSourceMapping" | "AWS::Lambda::Function" | "AWS::Lambda::LayerVersion" | "AWS::Lambda::LayerVersionPermission" | "AWS::Lambda::Permission" | "AWS::Lambda::Version" | "AWS::Logs::Destination" | "AWS::Logs::LogGroup" | "AWS::Logs::LogStream" | "AWS::Logs::MetricFilter" | "AWS::Logs::SubscriptionFilter" | "AWS::MSK::BatchScramSecret" | "AWS::MSK::Cluster" | "AWS::MSK::Configuration" | "AWS::MediaConvert::JobTemplate" | "AWS::MediaConvert::Preset" | "AWS::MediaConvert::Queue" | "AWS::Neptune::DBCluster" | "AWS::Neptune::DBClusterParameterGroup" | "AWS::Neptune::DBInstance" | "AWS::Neptune::DBParameterGroup" | "AWS::Neptune::DBSubnetGroup" | "AWS::OpenSearchService::Domain" | "AWS::RAM::ResourceShare" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterParameterGroup" | "AWS::RDS::DBInstance" | "AWS::RDS::DBParameterGroup" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSecurityGroupIngress" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::RDS::OptionGroup" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSecurityGroupIngress" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::ResourceGroups::Group" | "AWS::Route53::HealthCheck" | "AWS::Route53::HostedZone" | "AWS::Route53::RecordSet" | "AWS::Route53::RecordSetGroup" | "AWS::Route53Resolver::ResolverConfig" | "AWS::Route53Resolver::ResolverEndpoint" | "AWS::Route53Resolver::ResolverRule" | "AWS::Route53Resolver::ResolverRuleAssociation" | "AWS::S3::AccessPoint" | "AWS::S3::Bucket" | "AWS::S3::BucketPolicy" | "AWS::S3ObjectLambda::AccessPoint" | "AWS::S3ObjectLambda::AccessPointPolicy" | "AWS::SNS::Subscription" | "AWS::SNS::Topic" | "AWS::SNS::TopicPolicy" | "AWS::SQS::Queue" | "AWS::SQS::QueuePolicy" | "AWS::SSM::Association" | "AWS::SSM::Document" | "AWS::SSM::MaintenanceWindow" | "AWS::SSM::MaintenanceWindowTarget" | "AWS::SSM::MaintenanceWindowTask" | "AWS::SSM::Parameter" | "AWS::SSM::PatchBaseline" | "AWS::SSM::ResourceDataSync" | "AWS::SageMaker::App" | "AWS::SageMaker::AppImageConfig" | "AWS::SageMaker::CodeRepository" | "AWS::SageMaker::Domain" | "AWS::SageMaker::Endpoint" | "AWS::SageMaker::EndpointConfig" | "AWS::SageMaker::Image" | "AWS::SageMaker::ImageVersion" | "AWS::SageMaker::Model" | "AWS::SageMaker::MonitoringSchedule" | "AWS::SageMaker::NotebookInstance" | "AWS::SageMaker::NotebookInstanceLifecycleConfig" | "AWS::SageMaker::UserProfile" | "AWS::SageMaker::Workteam" | "AWS::SecretsManager::ResourcePolicy" | "AWS::SecretsManager::RotationSchedule" | "AWS::SecretsManager::Secret" | "AWS::SecretsManager::SecretTargetAttachment" | "AWS::SecurityHub::Hub" | "AWS::ServiceCatalog::AcceptedPortfolioShare" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::LaunchNotificationConstraint" | "AWS::ServiceCatalog::LaunchRoleConstraint" | "AWS::ServiceCatalog::LaunchTemplateConstraint" | "AWS::ServiceCatalog::Portfolio" | "AWS::ServiceCatalog::PortfolioPrincipalAssociation" | "AWS::ServiceCatalog::PortfolioProductAssociation" | "AWS::ServiceCatalog::PortfolioShare" | "AWS::ServiceCatalog::ResourceUpdateConstraint" | "AWS::ServiceCatalog::StackSetConstraint" | "AWS::ServiceCatalog::TagOption" | "AWS::ServiceCatalog::TagOptionAssociation" | "AWS::ServiceDiscovery::HttpNamespace" | "AWS::ServiceDiscovery::Instance" | "AWS::ServiceDiscovery::PrivateDnsNamespace" | "AWS::ServiceDiscovery::PublicDnsNamespace" | "AWS::ServiceDiscovery::Service" | "AWS::StepFunctions::Activity" | "AWS::StepFunctions::StateMachine" | "AWS::Synthetics::Canary" | "AWS::Transfer::User" | "AWS::Transfer::Workflow" | "AWS::WAF::ByteMatchSet" | "AWS::WAF::IPSet" | "AWS::WAF::Rule" | "AWS::WAF::SizeConstraintSet" | "AWS::WAF::SqlInjectionMatchSet" | "AWS::WAF::WebACL" | "AWS::WAF::XssMatchSet" | "AWS::WAFRegional::ByteMatchSet" | "AWS::WAFRegional::GeoMatchSet" | "AWS::WAFRegional::IPSet" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::RegexPatternSet" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::SizeConstraintSet" | "AWS::WAFRegional::SqlInjectionMatchSet" | "AWS::WAFRegional::WebACL" | "AWS::WAFRegional::WebACLAssociation" | "AWS::WAFRegional::XssMatchSet" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::LoggingConfiguration" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::WAFv2::WebACLAssociation" | "AWS::WorkSpaces::Workspace" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: [string]: _
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		CreationPolicy?:      _
		UpdatePolicy?:        _
		Metadata?: [string]: _
		Condition?: string
	}
	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Condition?:   string
		Export?: Name: _
	}
}
