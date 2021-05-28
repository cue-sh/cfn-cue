package apeast1

import "github.com/cue-sh/cfn-cue/aws/fn"

#ResourceSpecificationVersion: "37.1.0"
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
		Type:         "AWS::ACMPCA::Certificate" | "AWS::ACMPCA::CertificateAuthority" | "AWS::ACMPCA::CertificateAuthorityActivation" | "AWS::AccessAnalyzer::Analyzer" | "AWS::AmazonMQ::Broker" | "AWS::AmazonMQ::Configuration" | "AWS::AmazonMQ::ConfigurationAssociation" | "AWS::ApiGateway::Account" | "AWS::ApiGateway::ApiKey" | "AWS::ApiGateway::Authorizer" | "AWS::ApiGateway::BasePathMapping" | "AWS::ApiGateway::ClientCertificate" | "AWS::ApiGateway::Deployment" | "AWS::ApiGateway::DocumentationPart" | "AWS::ApiGateway::DocumentationVersion" | "AWS::ApiGateway::DomainName" | "AWS::ApiGateway::GatewayResponse" | "AWS::ApiGateway::Method" | "AWS::ApiGateway::Model" | "AWS::ApiGateway::RequestValidator" | "AWS::ApiGateway::Resource" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGateway::UsagePlan" | "AWS::ApiGateway::UsagePlanKey" | "AWS::ApiGateway::VpcLink" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::ApiMapping" | "AWS::ApiGatewayV2::Authorizer" | "AWS::ApiGatewayV2::Deployment" | "AWS::ApiGatewayV2::DomainName" | "AWS::ApiGatewayV2::Integration" | "AWS::ApiGatewayV2::IntegrationResponse" | "AWS::ApiGatewayV2::Model" | "AWS::ApiGatewayV2::Route" | "AWS::ApiGatewayV2::RouteResponse" | "AWS::ApiGatewayV2::Stage" | "AWS::AppMesh::GatewayRoute" | "AWS::AppMesh::VirtualGateway" | "AWS::AppSync::ApiCache" | "AWS::AppSync::ApiKey" | "AWS::AppSync::DataSource" | "AWS::AppSync::FunctionConfiguration" | "AWS::AppSync::GraphQLApi" | "AWS::AppSync::GraphQLSchema" | "AWS::AppSync::Resolver" | "AWS::ApplicationAutoScaling::ScalableTarget" | "AWS::ApplicationAutoScaling::ScalingPolicy" | "AWS::ApplicationInsights::Application" | "AWS::Athena::DataCatalog" | "AWS::Athena::NamedQuery" | "AWS::Athena::WorkGroup" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::LifecycleHook" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::AutoScaling::WarmPool" | "AWS::AutoScalingPlans::ScalingPlan" | "AWS::Backup::BackupPlan" | "AWS::Backup::BackupSelection" | "AWS::Backup::BackupVault" | "AWS::Batch::ComputeEnvironment" | "AWS::CDK::Metadata" | "AWS::CE::CostCategory" | "AWS::Cassandra::Keyspace" | "AWS::Cassandra::Table" | "AWS::CertificateManager::Account" | "AWS::CertificateManager::Certificate" | "AWS::Chatbot::SlackChannelConfiguration" | "AWS::Cloud9::EnvironmentEC2" | "AWS::CloudFormation::CustomResource" | "AWS::CloudFormation::Macro" | "AWS::CloudFormation::ModuleDefaultVersion" | "AWS::CloudFormation::ModuleVersion" | "AWS::CloudFormation::ResourceDefaultVersion" | "AWS::CloudFormation::ResourceVersion" | "AWS::CloudFormation::Stack" | "AWS::CloudFormation::StackSet" | "AWS::CloudFormation::WaitCondition" | "AWS::CloudFormation::WaitConditionHandle" | "AWS::CloudFront::CachePolicy" | "AWS::CloudFront::Function" | "AWS::CloudFront::KeyGroup" | "AWS::CloudFront::OriginRequestPolicy" | "AWS::CloudFront::PublicKey" | "AWS::CloudFront::RealtimeLogConfig" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CloudWatch::AnomalyDetector" | "AWS::CloudWatch::CompositeAlarm" | "AWS::CloudWatch::Dashboard" | "AWS::CloudWatch::InsightRule" | "AWS::CloudWatch::MetricStream" | "AWS::CodeBuild::Project" | "AWS::CodeBuild::ReportGroup" | "AWS::CodeBuild::SourceCredential" | "AWS::CodeCommit::Repository" | "AWS::CodeDeploy::Application" | "AWS::CodeDeploy::DeploymentConfig" | "AWS::CodeDeploy::DeploymentGroup" | "AWS::CodePipeline::CustomActionType" | "AWS::CodePipeline::Pipeline" | "AWS::CodeStarNotifications::NotificationRule" | "AWS::Config::AggregationAuthorization" | "AWS::Config::ConfigRule" | "AWS::Config::ConfigurationAggregator" | "AWS::Config::ConfigurationRecorder" | "AWS::Config::ConformancePack" | "AWS::Config::DeliveryChannel" | "AWS::Config::RemediationConfiguration" | "AWS::Config::StoredQuery" | "AWS::DMS::Certificate" | "AWS::DMS::Endpoint" | "AWS::DMS::EventSubscription" | "AWS::DMS::ReplicationInstance" | "AWS::DMS::ReplicationSubnetGroup" | "AWS::DMS::ReplicationTask" | "AWS::DataSync::Agent" | "AWS::DataSync::LocationEFS" | "AWS::DataSync::LocationFSxWindows" | "AWS::DataSync::LocationNFS" | "AWS::DataSync::LocationObjectStorage" | "AWS::DataSync::LocationS3" | "AWS::DataSync::LocationSMB" | "AWS::DataSync::Task" | "AWS::Detective::Graph" | "AWS::Detective::MemberInvitation" | "AWS::DirectoryService::MicrosoftAD" | "AWS::DirectoryService::SimpleAD" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::DHCPOptions" | "AWS::EC2::EC2Fleet" | "AWS::EC2::EIP" | "AWS::EC2::EIPAssociation" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::EnclaveCertificateIamRoleAssociation" | "AWS::EC2::FlowLog" | "AWS::EC2::GatewayRouteTableAssociation" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::LaunchTemplate" | "AWS::EC2::LocalGatewayRoute" | "AWS::EC2::LocalGatewayRouteTableVPCAssociation" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkAclEntry" | "AWS::EC2::NetworkInsightsAnalysis" | "AWS::EC2::NetworkInsightsPath" | "AWS::EC2::NetworkInterface" | "AWS::EC2::NetworkInterfaceAttachment" | "AWS::EC2::NetworkInterfacePermission" | "AWS::EC2::PlacementGroup" | "AWS::EC2::PrefixList" | "AWS::EC2::Route" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::SecurityGroupEgress" | "AWS::EC2::SecurityGroupIngress" | "AWS::EC2::SpotFleet" | "AWS::EC2::Subnet" | "AWS::EC2::SubnetCidrBlock" | "AWS::EC2::SubnetNetworkAclAssociation" | "AWS::EC2::SubnetRouteTableAssociation" | "AWS::EC2::TrafficMirrorFilter" | "AWS::EC2::TrafficMirrorFilterRule" | "AWS::EC2::TrafficMirrorSession" | "AWS::EC2::TrafficMirrorTarget" | "AWS::EC2::VPC" | "AWS::EC2::VPCCidrBlock" | "AWS::EC2::VPCDHCPOptionsAssociation" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointConnectionNotification" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCEndpointServicePermissions" | "AWS::EC2::VPCGatewayAttachment" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNConnectionRoute" | "AWS::EC2::VPNGateway" | "AWS::EC2::VPNGatewayRoutePropagation" | "AWS::EC2::Volume" | "AWS::EC2::VolumeAttachment" | "AWS::ECR::RegistryPolicy" | "AWS::ECR::ReplicationConfiguration" | "AWS::ECR::Repository" | "AWS::ECS::CapacityProvider" | "AWS::ECS::Cluster" | "AWS::ECS::ClusterCapacityProviderAssociations" | "AWS::ECS::PrimaryTaskSet" | "AWS::ECS::Service" | "AWS::ECS::TaskDefinition" | "AWS::ECS::TaskSet" | "AWS::EFS::AccessPoint" | "AWS::EFS::FileSystem" | "AWS::EFS::MountTarget" | "AWS::EKS::Addon" | "AWS::EKS::Cluster" | "AWS::EKS::FargateProfile" | "AWS::EKS::Nodegroup" | "AWS::EMR::Cluster" | "AWS::EMR::InstanceFleetConfig" | "AWS::EMR::InstanceGroupConfig" | "AWS::EMR::SecurityConfiguration" | "AWS::EMR::Step" | "AWS::ElastiCache::CacheCluster" | "AWS::ElastiCache::ParameterGroup" | "AWS::ElastiCache::ReplicationGroup" | "AWS::ElastiCache::SecurityGroup" | "AWS::ElastiCache::SecurityGroupIngress" | "AWS::ElastiCache::SubnetGroup" | "AWS::ElastiCache::User" | "AWS::ElastiCache::UserGroup" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::ConfigurationTemplate" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::Listener" | "AWS::ElasticLoadBalancingV2::ListenerCertificate" | "AWS::ElasticLoadBalancingV2::ListenerRule" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::ElasticLoadBalancingV2::TargetGroup" | "AWS::Elasticsearch::Domain" | "AWS::EventSchemas::RegistryPolicy" | "AWS::Events::ApiDestination" | "AWS::Events::Archive" | "AWS::Events::Connection" | "AWS::Events::EventBus" | "AWS::Events::EventBusPolicy" | "AWS::Events::Rule" | "AWS::FIS::ExperimentTemplate" | "AWS::FMS::NotificationChannel" | "AWS::FMS::Policy" | "AWS::FSx::FileSystem" | "AWS::GameLift::Alias" | "AWS::GameLift::Build" | "AWS::GameLift::Fleet" | "AWS::GlobalAccelerator::Accelerator" | "AWS::GlobalAccelerator::EndpointGroup" | "AWS::GlobalAccelerator::Listener" | "AWS::Glue::Registry" | "AWS::Glue::Schema" | "AWS::Glue::SchemaVersion" | "AWS::Glue::SchemaVersionMetadata" | "AWS::GuardDuty::Detector" | "AWS::GuardDuty::Filter" | "AWS::GuardDuty::IPSet" | "AWS::GuardDuty::Master" | "AWS::GuardDuty::Member" | "AWS::GuardDuty::ThreatIntelSet" | "AWS::IAM::AccessKey" | "AWS::IAM::Group" | "AWS::IAM::InstanceProfile" | "AWS::IAM::ManagedPolicy" | "AWS::IAM::OIDCProvider" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::SAMLProvider" | "AWS::IAM::ServerCertificate" | "AWS::IAM::User" | "AWS::IAM::UserToGroupAddition" | "AWS::IAM::VirtualMFADevice" | "AWS::ImageBuilder::Component" | "AWS::ImageBuilder::ContainerRecipe" | "AWS::ImageBuilder::DistributionConfiguration" | "AWS::ImageBuilder::Image" | "AWS::ImageBuilder::ImagePipeline" | "AWS::ImageBuilder::ImageRecipe" | "AWS::ImageBuilder::InfrastructureConfiguration" | "AWS::IoT::AccountAuditConfiguration" | "AWS::IoT::Authorizer" | "AWS::IoT::Certificate" | "AWS::IoT::CustomMetric" | "AWS::IoT::Dimension" | "AWS::IoT::DomainConfiguration" | "AWS::IoT::MitigationAction" | "AWS::IoT::Policy" | "AWS::IoT::PolicyPrincipalAttachment" | "AWS::IoT::ProvisioningTemplate" | "AWS::IoT::ScheduledAudit" | "AWS::IoT::SecurityProfile" | "AWS::IoT::Thing" | "AWS::IoT::ThingPrincipalAttachment" | "AWS::IoT::TopicRule" | "AWS::IoT::TopicRuleDestination" | "AWS::KMS::Alias" | "AWS::KMS::Key" | "AWS::Kinesis::Stream" | "AWS::KinesisAnalytics::Application" | "AWS::KinesisAnalytics::ApplicationOutput" | "AWS::KinesisAnalytics::ApplicationReferenceDataSource" | "AWS::KinesisAnalyticsV2::Application" | "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption" | "AWS::KinesisAnalyticsV2::ApplicationOutput" | "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource" | "AWS::KinesisFirehose::DeliveryStream" | "AWS::Lambda::Alias" | "AWS::Lambda::CodeSigningConfig" | "AWS::Lambda::EventInvokeConfig" | "AWS::Lambda::EventSourceMapping" | "AWS::Lambda::Function" | "AWS::Lambda::Permission" | "AWS::Lambda::Version" | "AWS::Logs::Destination" | "AWS::Logs::LogGroup" | "AWS::Logs::LogStream" | "AWS::Logs::MetricFilter" | "AWS::Logs::QueryDefinition" | "AWS::Logs::SubscriptionFilter" | "AWS::MSK::Cluster" | "AWS::Macie::CustomDataIdentifier" | "AWS::Macie::FindingsFilter" | "AWS::Macie::Session" | "AWS::MediaConnect::Flow" | "AWS::MediaConnect::FlowEntitlement" | "AWS::MediaConnect::FlowOutput" | "AWS::MediaConnect::FlowSource" | "AWS::MediaConnect::FlowVpcInterface" | "AWS::Neptune::DBCluster" | "AWS::Neptune::DBClusterParameterGroup" | "AWS::Neptune::DBInstance" | "AWS::Neptune::DBParameterGroup" | "AWS::Neptune::DBSubnetGroup" | "AWS::NetworkFirewall::Firewall" | "AWS::NetworkFirewall::FirewallPolicy" | "AWS::NetworkFirewall::LoggingConfiguration" | "AWS::NetworkFirewall::RuleGroup" | "AWS::NetworkManager::CustomerGatewayAssociation" | "AWS::NetworkManager::Device" | "AWS::NetworkManager::GlobalNetwork" | "AWS::NetworkManager::Link" | "AWS::NetworkManager::LinkAssociation" | "AWS::NetworkManager::Site" | "AWS::NetworkManager::TransitGatewayRegistration" | "AWS::RAM::ResourceShare" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterParameterGroup" | "AWS::RDS::DBInstance" | "AWS::RDS::DBParameterGroup" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSecurityGroupIngress" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::RDS::OptionGroup" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSecurityGroupIngress" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::ResourceGroups::Group" | "AWS::Route53::HealthCheck" | "AWS::Route53::HostedZone" | "AWS::Route53::RecordSet" | "AWS::Route53::RecordSetGroup" | "AWS::Route53Resolver::FirewallDomainList" | "AWS::Route53Resolver::FirewallRuleGroup" | "AWS::Route53Resolver::FirewallRuleGroupAssociation" | "AWS::Route53Resolver::ResolverDNSSECConfig" | "AWS::Route53Resolver::ResolverEndpoint" | "AWS::Route53Resolver::ResolverQueryLoggingConfig" | "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation" | "AWS::Route53Resolver::ResolverRule" | "AWS::Route53Resolver::ResolverRuleAssociation" | "AWS::S3::AccessPoint" | "AWS::S3::Bucket" | "AWS::S3::BucketPolicy" | "AWS::S3ObjectLambda::AccessPoint" | "AWS::S3ObjectLambda::AccessPointPolicy" | "AWS::S3Outposts::AccessPoint" | "AWS::S3Outposts::Bucket" | "AWS::S3Outposts::BucketPolicy" | "AWS::S3Outposts::Endpoint" | "AWS::SNS::Subscription" | "AWS::SNS::Topic" | "AWS::SNS::TopicPolicy" | "AWS::SQS::Queue" | "AWS::SQS::QueuePolicy" | "AWS::SSM::Association" | "AWS::SSM::Document" | "AWS::SSM::MaintenanceWindowTarget" | "AWS::SageMaker::App" | "AWS::SageMaker::AppImageConfig" | "AWS::SageMaker::DataQualityJobDefinition" | "AWS::SageMaker::Domain" | "AWS::SageMaker::FeatureGroup" | "AWS::SageMaker::Image" | "AWS::SageMaker::ImageVersion" | "AWS::SageMaker::ModelBiasJobDefinition" | "AWS::SageMaker::ModelExplainabilityJobDefinition" | "AWS::SageMaker::ModelPackageGroup" | "AWS::SageMaker::ModelQualityJobDefinition" | "AWS::SageMaker::MonitoringSchedule" | "AWS::SageMaker::Pipeline" | "AWS::SageMaker::UserProfile" | "AWS::SecretsManager::ResourcePolicy" | "AWS::SecretsManager::RotationSchedule" | "AWS::SecretsManager::Secret" | "AWS::SecretsManager::SecretTargetAttachment" | "AWS::ServiceCatalog::AcceptedPortfolioShare" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::LaunchNotificationConstraint" | "AWS::ServiceCatalog::LaunchRoleConstraint" | "AWS::ServiceCatalog::LaunchTemplateConstraint" | "AWS::ServiceCatalog::Portfolio" | "AWS::ServiceCatalog::PortfolioPrincipalAssociation" | "AWS::ServiceCatalog::PortfolioProductAssociation" | "AWS::ServiceCatalog::PortfolioShare" | "AWS::ServiceCatalog::ResourceUpdateConstraint" | "AWS::ServiceCatalog::ServiceAction" | "AWS::ServiceCatalog::ServiceActionAssociation" | "AWS::ServiceCatalog::StackSetConstraint" | "AWS::ServiceCatalog::TagOption" | "AWS::ServiceCatalog::TagOptionAssociation" | "AWS::ServiceDiscovery::HttpNamespace" | "AWS::ServiceDiscovery::Instance" | "AWS::ServiceDiscovery::PrivateDnsNamespace" | "AWS::ServiceDiscovery::PublicDnsNamespace" | "AWS::ServiceDiscovery::Service" | "AWS::Signer::ProfilePermission" | "AWS::Signer::SigningProfile" | "AWS::StepFunctions::Activity" | "AWS::StepFunctions::StateMachine" | "AWS::Synthetics::Canary" | "AWS::Transfer::Server" | "AWS::Transfer::User" | "AWS::WAF::ByteMatchSet" | "AWS::WAF::IPSet" | "AWS::WAF::Rule" | "AWS::WAF::SizeConstraintSet" | "AWS::WAF::SqlInjectionMatchSet" | "AWS::WAF::WebACL" | "AWS::WAF::XssMatchSet" | "AWS::WAFRegional::ByteMatchSet" | "AWS::WAFRegional::GeoMatchSet" | "AWS::WAFRegional::IPSet" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::RegexPatternSet" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::SizeConstraintSet" | "AWS::WAFRegional::SqlInjectionMatchSet" | "AWS::WAFRegional::WebACL" | "AWS::WAFRegional::WebACLAssociation" | "AWS::WAFRegional::XssMatchSet" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::WAFv2::WebACLAssociation" | "AWS::XRay::Group" | "AWS::XRay::SamplingRule" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
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
