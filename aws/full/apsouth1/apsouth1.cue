package apsouth1

import "github.com/cue-sh/cfn-cue/aws/fn"

#ResourceSpecificationVersion: "35.2.0"
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
	Resources: [=~"[a-zA-Z0-9]"]: #ACMPCA.#Certificate | #ACMPCA.#CertificateAuthority | #ACMPCA.#CertificateAuthorityActivation | #ASK.#Skill | #AccessAnalyzer.#Analyzer | #AmazonMQ.#Broker | #AmazonMQ.#Configuration | #AmazonMQ.#ConfigurationAssociation | #Amplify.#App | #Amplify.#Branch | #Amplify.#Domain | #ApiGateway.#Account | #ApiGateway.#ApiKey | #ApiGateway.#Authorizer | #ApiGateway.#BasePathMapping | #ApiGateway.#ClientCertificate | #ApiGateway.#Deployment | #ApiGateway.#DocumentationPart | #ApiGateway.#DocumentationVersion | #ApiGateway.#DomainName | #ApiGateway.#GatewayResponse | #ApiGateway.#Method | #ApiGateway.#Model | #ApiGateway.#RequestValidator | #ApiGateway.#Resource | #ApiGateway.#RestApi | #ApiGateway.#Stage | #ApiGateway.#UsagePlan | #ApiGateway.#UsagePlanKey | #ApiGateway.#VpcLink | #ApiGatewayV2.#Api | #ApiGatewayV2.#ApiMapping | #ApiGatewayV2.#Authorizer | #ApiGatewayV2.#Deployment | #ApiGatewayV2.#DomainName | #ApiGatewayV2.#Integration | #ApiGatewayV2.#IntegrationResponse | #ApiGatewayV2.#Model | #ApiGatewayV2.#Route | #ApiGatewayV2.#RouteResponse | #ApiGatewayV2.#Stage | #AppConfig.#HostedConfigurationVersion | #AppFlow.#ConnectorProfile | #AppFlow.#Flow | #AppMesh.#GatewayRoute | #AppMesh.#Mesh | #AppMesh.#Route | #AppMesh.#VirtualGateway | #AppMesh.#VirtualNode | #AppMesh.#VirtualRouter | #AppMesh.#VirtualService | #AppStream.#DirectoryConfig | #AppStream.#Fleet | #AppStream.#ImageBuilder | #AppStream.#Stack | #AppStream.#StackFleetAssociation | #AppStream.#StackUserAssociation | #AppStream.#User | #AppSync.#ApiCache | #AppSync.#DataSource | #AppSync.#FunctionConfiguration | #AppSync.#GraphQLApi | #AppSync.#Resolver | #ApplicationAutoScaling.#ScalableTarget | #ApplicationAutoScaling.#ScalingPolicy | #ApplicationInsights.#Application | #Athena.#DataCatalog | #Athena.#NamedQuery | #Athena.#WorkGroup | #AutoScaling.#AutoScalingGroup | #AutoScaling.#LaunchConfiguration | #AutoScaling.#LifecycleHook | #AutoScaling.#ScalingPolicy | #AutoScaling.#ScheduledAction | #AutoScaling.#WarmPool | #AutoScalingPlans.#ScalingPlan | #Backup.#BackupPlan | #Backup.#BackupSelection | #Backup.#BackupVault | #Batch.#ComputeEnvironment | #Batch.#JobDefinition | #Budgets.#Budget | #Budgets.#BudgetsAction | #CDK.#Metadata | #CE.#CostCategory | #Cassandra.#Keyspace | #Cassandra.#Table | #CertificateManager.#Account | #CertificateManager.#Certificate | #Chatbot.#SlackChannelConfiguration | #Cloud9.#EnvironmentEC2 | #CloudFormation.#CustomResource | #CloudFormation.#Macro | #CloudFormation.#ModuleDefaultVersion | #CloudFormation.#ModuleVersion | #CloudFormation.#ResourceDefaultVersion | #CloudFormation.#ResourceVersion | #CloudFormation.#Stack | #CloudFormation.#StackSet | #CloudFormation.#WaitCondition | #CloudFormation.#WaitConditionHandle | #CloudFront.#CachePolicy | #CloudFront.#CloudFrontOriginAccessIdentity | #CloudFront.#Distribution | #CloudFront.#KeyGroup | #CloudFront.#OriginRequestPolicy | #CloudFront.#PublicKey | #CloudFront.#RealtimeLogConfig | #CloudFront.#StreamingDistribution | #CloudTrail.#Trail | #CloudWatch.#Alarm | #CloudWatch.#AnomalyDetector | #CloudWatch.#CompositeAlarm | #CloudWatch.#Dashboard | #CloudWatch.#InsightRule | #CloudWatch.#MetricStream | #CodeArtifact.#Domain | #CodeArtifact.#Repository | #CodeBuild.#Project | #CodeBuild.#ReportGroup | #CodeBuild.#SourceCredential | #CodeCommit.#Repository | #CodeDeploy.#Application | #CodeDeploy.#DeploymentConfig | #CodeDeploy.#DeploymentGroup | #CodePipeline.#CustomActionType | #CodePipeline.#Pipeline | #CodePipeline.#Webhook | #CodeStar.#GitHubRepository | #CodeStarConnections.#Connection | #CodeStarNotifications.#NotificationRule | #Cognito.#IdentityPoolRoleAttachment | #Cognito.#UserPool | #Cognito.#UserPoolClient | #Cognito.#UserPoolDomain | #Cognito.#UserPoolIdentityProvider | #Cognito.#UserPoolResourceServer | #Cognito.#UserPoolRiskConfigurationAttachment | #Cognito.#UserPoolUICustomizationAttachment | #Config.#ConfigRule | #Config.#ConfigurationRecorder | #Config.#ConformancePack | #Config.#DeliveryChannel | #Config.#OrganizationConfigRule | #Config.#OrganizationConformancePack | #Config.#RemediationConfiguration | #Config.#StoredQuery | #DAX.#Cluster | #DAX.#ParameterGroup | #DAX.#SubnetGroup | #DLM.#LifecyclePolicy | #DMS.#Certificate | #DMS.#Endpoint | #DMS.#EventSubscription | #DMS.#ReplicationInstance | #DMS.#ReplicationSubnetGroup | #DMS.#ReplicationTask | #DataBrew.#Dataset | #DataBrew.#Job | #DataBrew.#Project | #DataBrew.#Recipe | #DataBrew.#Schedule | #DataSync.#Agent | #DataSync.#LocationEFS | #DataSync.#LocationFSxWindows | #DataSync.#LocationNFS | #DataSync.#LocationObjectStorage | #DataSync.#LocationS3 | #DataSync.#LocationSMB | #DataSync.#Task | #Detective.#Graph | #Detective.#MemberInvitation | #DirectoryService.#MicrosoftAD | #DirectoryService.#SimpleAD | #DocDB.#DBCluster | #DocDB.#DBClusterParameterGroup | #DocDB.#DBInstance | #DocDB.#DBSubnetGroup | #DynamoDB.#Table | #EC2.#CapacityReservation | #EC2.#ClientVpnAuthorizationRule | #EC2.#ClientVpnEndpoint | #EC2.#ClientVpnRoute | #EC2.#ClientVpnTargetNetworkAssociation | #EC2.#CustomerGateway | #EC2.#DHCPOptions | #EC2.#EC2Fleet | #EC2.#EIP | #EC2.#EIPAssociation | #EC2.#EgressOnlyInternetGateway | #EC2.#EnclaveCertificateIamRoleAssociation | #EC2.#FlowLog | #EC2.#GatewayRouteTableAssociation | #EC2.#Host | #EC2.#Instance | #EC2.#InternetGateway | #EC2.#LaunchTemplate | #EC2.#LocalGatewayRoute | #EC2.#LocalGatewayRouteTableVPCAssociation | #EC2.#NatGateway | #EC2.#NetworkAcl | #EC2.#NetworkAclEntry | #EC2.#NetworkInsightsAnalysis | #EC2.#NetworkInsightsPath | #EC2.#NetworkInterface | #EC2.#NetworkInterfaceAttachment | #EC2.#NetworkInterfacePermission | #EC2.#PlacementGroup | #EC2.#PrefixList | #EC2.#Route | #EC2.#RouteTable | #EC2.#SecurityGroup | #EC2.#SecurityGroupEgress | #EC2.#SecurityGroupIngress | #EC2.#SpotFleet | #EC2.#Subnet | #EC2.#SubnetCidrBlock | #EC2.#SubnetNetworkAclAssociation | #EC2.#SubnetRouteTableAssociation | #EC2.#TrafficMirrorFilter | #EC2.#TrafficMirrorFilterRule | #EC2.#TrafficMirrorSession | #EC2.#TrafficMirrorTarget | #EC2.#TransitGateway | #EC2.#TransitGatewayAttachment | #EC2.#TransitGatewayMulticastDomain | #EC2.#TransitGatewayMulticastDomainAssociation | #EC2.#TransitGatewayMulticastGroupMember | #EC2.#TransitGatewayMulticastGroupSource | #EC2.#TransitGatewayRoute | #EC2.#TransitGatewayRouteTable | #EC2.#TransitGatewayRouteTableAssociation | #EC2.#TransitGatewayRouteTablePropagation | #EC2.#VPC | #EC2.#VPCCidrBlock | #EC2.#VPCDHCPOptionsAssociation | #EC2.#VPCEndpoint | #EC2.#VPCEndpointService | #EC2.#VPCEndpointServicePermissions | #EC2.#VPCGatewayAttachment | #EC2.#VPCPeeringConnection | #EC2.#VPNConnection | #EC2.#VPNConnectionRoute | #EC2.#VPNGateway | #EC2.#VPNGatewayRoutePropagation | #EC2.#Volume | #EC2.#VolumeAttachment | #ECR.#RegistryPolicy | #ECR.#ReplicationConfiguration | #ECR.#Repository | #ECS.#CapacityProvider | #ECS.#Cluster | #ECS.#ClusterCapacityProviderAssociations | #ECS.#PrimaryTaskSet | #ECS.#Service | #ECS.#TaskDefinition | #ECS.#TaskSet | #EFS.#AccessPoint | #EFS.#FileSystem | #EFS.#MountTarget | #EKS.#Addon | #EKS.#Cluster | #EKS.#FargateProfile | #EKS.#Nodegroup | #EMR.#Cluster | #EMR.#InstanceFleetConfig | #EMR.#InstanceGroupConfig | #EMR.#SecurityConfiguration | #EMR.#Step | #EMR.#Studio | #EMR.#StudioSessionMapping | #EMRContainers.#VirtualCluster | #ElastiCache.#CacheCluster | #ElastiCache.#GlobalReplicationGroup | #ElastiCache.#ParameterGroup | #ElastiCache.#ReplicationGroup | #ElastiCache.#SecurityGroup | #ElastiCache.#SecurityGroupIngress | #ElastiCache.#SubnetGroup | #ElastiCache.#User | #ElastiCache.#UserGroup | #ElasticBeanstalk.#Application | #ElasticBeanstalk.#ApplicationVersion | #ElasticBeanstalk.#ConfigurationTemplate | #ElasticBeanstalk.#Environment | #ElasticLoadBalancing.#LoadBalancer | #ElasticLoadBalancingV2.#Listener | #ElasticLoadBalancingV2.#ListenerCertificate | #ElasticLoadBalancingV2.#ListenerRule | #ElasticLoadBalancingV2.#LoadBalancer | #ElasticLoadBalancingV2.#TargetGroup | #Elasticsearch.#Domain | #EventSchemas.#RegistryPolicy | #Events.#ApiDestination | #Events.#Archive | #Events.#Connection | #Events.#EventBus | #Events.#EventBusPolicy | #Events.#Rule | #FIS.#ExperimentTemplate | #FMS.#NotificationChannel | #FMS.#Policy | #FSx.#FileSystem | #GameLift.#Alias | #GameLift.#Build | #GameLift.#Fleet | #GameLift.#GameServerGroup | #GameLift.#GameSessionQueue | #GameLift.#MatchmakingConfiguration | #GameLift.#MatchmakingRuleSet | #GameLift.#Script | #GlobalAccelerator.#Accelerator | #GlobalAccelerator.#EndpointGroup | #GlobalAccelerator.#Listener | #Glue.#Classifier | #Glue.#Connection | #Glue.#Crawler | #Glue.#DataCatalogEncryptionSettings | #Glue.#Database | #Glue.#DevEndpoint | #Glue.#Job | #Glue.#MLTransform | #Glue.#Partition | #Glue.#Registry | #Glue.#Schema | #Glue.#SchemaVersion | #Glue.#SchemaVersionMetadata | #Glue.#SecurityConfiguration | #Glue.#Table | #Glue.#Trigger | #Glue.#Workflow | #Greengrass.#ConnectorDefinition | #Greengrass.#ConnectorDefinitionVersion | #Greengrass.#CoreDefinition | #Greengrass.#CoreDefinitionVersion | #Greengrass.#DeviceDefinition | #Greengrass.#DeviceDefinitionVersion | #Greengrass.#FunctionDefinition | #Greengrass.#FunctionDefinitionVersion | #Greengrass.#Group | #Greengrass.#GroupVersion | #Greengrass.#LoggerDefinition | #Greengrass.#LoggerDefinitionVersion | #Greengrass.#ResourceDefinition | #Greengrass.#ResourceDefinitionVersion | #Greengrass.#SubscriptionDefinition | #Greengrass.#SubscriptionDefinitionVersion | #GreengrassV2.#ComponentVersion | #GuardDuty.#Detector | #GuardDuty.#Filter | #GuardDuty.#IPSet | #GuardDuty.#Master | #GuardDuty.#Member | #GuardDuty.#ThreatIntelSet | #IAM.#AccessKey | #IAM.#Group | #IAM.#InstanceProfile | #IAM.#ManagedPolicy | #IAM.#OIDCProvider | #IAM.#Policy | #IAM.#Role | #IAM.#SAMLProvider | #IAM.#ServerCertificate | #IAM.#ServiceLinkedRole | #IAM.#User | #IAM.#UserToGroupAddition | #IAM.#VirtualMFADevice | #ImageBuilder.#Component | #ImageBuilder.#ContainerRecipe | #ImageBuilder.#DistributionConfiguration | #ImageBuilder.#Image | #ImageBuilder.#ImagePipeline | #ImageBuilder.#ImageRecipe | #ImageBuilder.#InfrastructureConfiguration | #Inspector.#AssessmentTarget | #Inspector.#AssessmentTemplate | #Inspector.#ResourceGroup | #IoT.#AccountAuditConfiguration | #IoT.#Authorizer | #IoT.#Certificate | #IoT.#CustomMetric | #IoT.#Dimension | #IoT.#DomainConfiguration | #IoT.#MitigationAction | #IoT.#Policy | #IoT.#PolicyPrincipalAttachment | #IoT.#ProvisioningTemplate | #IoT.#ScheduledAudit | #IoT.#SecurityProfile | #IoT.#Thing | #IoT.#ThingPrincipalAttachment | #IoT.#TopicRule | #IoT.#TopicRuleDestination | #IoTFleetHub.#Application | #KMS.#Alias | #KMS.#Key | #Kinesis.#Stream | #Kinesis.#StreamConsumer | #KinesisAnalytics.#Application | #KinesisAnalytics.#ApplicationOutput | #KinesisAnalytics.#ApplicationReferenceDataSource | #KinesisAnalyticsV2.#Application | #KinesisAnalyticsV2.#ApplicationCloudWatchLoggingOption | #KinesisAnalyticsV2.#ApplicationOutput | #KinesisAnalyticsV2.#ApplicationReferenceDataSource | #KinesisFirehose.#DeliveryStream | #Lambda.#Alias | #Lambda.#CodeSigningConfig | #Lambda.#EventInvokeConfig | #Lambda.#EventSourceMapping | #Lambda.#Function | #Lambda.#LayerVersion | #Lambda.#LayerVersionPermission | #Lambda.#Permission | #Lambda.#Version | #LicenseManager.#Grant | #LicenseManager.#License | #Logs.#Destination | #Logs.#LogGroup | #Logs.#LogStream | #Logs.#MetricFilter | #Logs.#QueryDefinition | #Logs.#SubscriptionFilter | #MSK.#Cluster | #Macie.#CustomDataIdentifier | #Macie.#FindingsFilter | #Macie.#Session | #MediaConnect.#Flow | #MediaConnect.#FlowEntitlement | #MediaConnect.#FlowOutput | #MediaConnect.#FlowSource | #MediaConnect.#FlowVpcInterface | #MediaConvert.#JobTemplate | #MediaConvert.#Preset | #MediaConvert.#Queue | #MediaLive.#Channel | #MediaLive.#Input | #MediaLive.#InputSecurityGroup | #MediaPackage.#Asset | #MediaPackage.#Channel | #MediaPackage.#OriginEndpoint | #MediaPackage.#PackagingConfiguration | #MediaPackage.#PackagingGroup | #Neptune.#DBCluster | #Neptune.#DBClusterParameterGroup | #Neptune.#DBInstance | #Neptune.#DBParameterGroup | #Neptune.#DBSubnetGroup | #NetworkFirewall.#Firewall | #NetworkFirewall.#FirewallPolicy | #NetworkFirewall.#LoggingConfiguration | #NetworkFirewall.#RuleGroup | #NetworkManager.#CustomerGatewayAssociation | #NetworkManager.#Device | #NetworkManager.#GlobalNetwork | #NetworkManager.#Link | #NetworkManager.#LinkAssociation | #NetworkManager.#Site | #NetworkManager.#TransitGatewayRegistration | #OpsWorks.#App | #OpsWorks.#ElasticLoadBalancerAttachment | #OpsWorks.#Instance | #OpsWorks.#Layer | #OpsWorks.#Stack | #OpsWorks.#UserProfile | #OpsWorks.#Volume | #Pinpoint.#ADMChannel | #Pinpoint.#APNSChannel | #Pinpoint.#APNSSandboxChannel | #Pinpoint.#APNSVoipChannel | #Pinpoint.#APNSVoipSandboxChannel | #Pinpoint.#App | #Pinpoint.#ApplicationSettings | #Pinpoint.#BaiduChannel | #Pinpoint.#Campaign | #Pinpoint.#EmailChannel | #Pinpoint.#EmailTemplate | #Pinpoint.#EventStream | #Pinpoint.#GCMChannel | #Pinpoint.#PushTemplate | #Pinpoint.#SMSChannel | #Pinpoint.#Segment | #Pinpoint.#SmsTemplate | #Pinpoint.#VoiceChannel | #PinpointEmail.#ConfigurationSet | #PinpointEmail.#ConfigurationSetEventDestination | #PinpointEmail.#DedicatedIpPool | #PinpointEmail.#Identity | #QuickSight.#Analysis | #QuickSight.#Dashboard | #QuickSight.#DataSet | #QuickSight.#DataSource | #QuickSight.#Template | #QuickSight.#Theme | #RAM.#ResourceShare | #RDS.#DBCluster | #RDS.#DBClusterParameterGroup | #RDS.#DBInstance | #RDS.#DBParameterGroup | #RDS.#DBProxy | #RDS.#DBProxyEndpoint | #RDS.#DBProxyTargetGroup | #RDS.#DBSecurityGroup | #RDS.#DBSecurityGroupIngress | #RDS.#DBSubnetGroup | #RDS.#EventSubscription | #RDS.#GlobalCluster | #RDS.#OptionGroup | #Redshift.#Cluster | #Redshift.#ClusterParameterGroup | #Redshift.#ClusterSecurityGroup | #Redshift.#ClusterSecurityGroupIngress | #Redshift.#ClusterSubnetGroup | #ResourceGroups.#Group | #Route53.#DNSSEC | #Route53.#HealthCheck | #Route53.#HostedZone | #Route53.#KeySigningKey | #Route53.#RecordSet | #Route53.#RecordSetGroup | #Route53Resolver.#FirewallDomainList | #Route53Resolver.#FirewallRuleGroup | #Route53Resolver.#FirewallRuleGroupAssociation | #Route53Resolver.#ResolverDNSSECConfig | #Route53Resolver.#ResolverEndpoint | #Route53Resolver.#ResolverQueryLoggingConfig | #Route53Resolver.#ResolverQueryLoggingConfigAssociation | #Route53Resolver.#ResolverRule | #Route53Resolver.#ResolverRuleAssociation | #S3.#AccessPoint | #S3.#Bucket | #S3.#BucketPolicy | #S3.#StorageLens | #S3ObjectLambda.#AccessPoint | #S3ObjectLambda.#AccessPointPolicy | #S3Outposts.#AccessPoint | #S3Outposts.#Bucket | #S3Outposts.#BucketPolicy | #S3Outposts.#Endpoint | #SES.#ConfigurationSet | #SES.#ContactList | #SNS.#Subscription | #SNS.#Topic | #SNS.#TopicPolicy | #SQS.#Queue | #SQS.#QueuePolicy | #SSM.#Association | #SSM.#Document | #SSM.#MaintenanceWindow | #SSM.#MaintenanceWindowTarget | #SSM.#MaintenanceWindowTask | #SSM.#Parameter | #SSM.#PatchBaseline | #SSM.#ResourceDataSync | #SSO.#Assignment | #SSO.#InstanceAccessControlAttributeConfiguration | #SSO.#PermissionSet | #SageMaker.#App | #SageMaker.#AppImageConfig | #SageMaker.#CodeRepository | #SageMaker.#DataQualityJobDefinition | #SageMaker.#Domain | #SageMaker.#FeatureGroup | #SageMaker.#Image | #SageMaker.#ImageVersion | #SageMaker.#Model | #SageMaker.#ModelBiasJobDefinition | #SageMaker.#ModelExplainabilityJobDefinition | #SageMaker.#ModelPackageGroup | #SageMaker.#ModelQualityJobDefinition | #SageMaker.#MonitoringSchedule | #SageMaker.#NotebookInstance | #SageMaker.#Pipeline | #SageMaker.#Project | #SageMaker.#UserProfile | #SecretsManager.#ResourcePolicy | #SecretsManager.#RotationSchedule | #SecretsManager.#Secret | #SecretsManager.#SecretTargetAttachment | #SecurityHub.#Hub | #ServiceCatalog.#AcceptedPortfolioShare | #ServiceCatalog.#CloudFormationProduct | #ServiceCatalog.#CloudFormationProvisionedProduct | #ServiceCatalog.#LaunchNotificationConstraint | #ServiceCatalog.#LaunchRoleConstraint | #ServiceCatalog.#LaunchTemplateConstraint | #ServiceCatalog.#Portfolio | #ServiceCatalog.#PortfolioPrincipalAssociation | #ServiceCatalog.#PortfolioProductAssociation | #ServiceCatalog.#PortfolioShare | #ServiceCatalog.#ResourceUpdateConstraint | #ServiceCatalog.#ServiceAction | #ServiceCatalog.#ServiceActionAssociation | #ServiceCatalog.#StackSetConstraint | #ServiceCatalog.#TagOption | #ServiceCatalog.#TagOptionAssociation | #ServiceCatalogAppRegistry.#Application | #ServiceCatalogAppRegistry.#AttributeGroup | #ServiceCatalogAppRegistry.#AttributeGroupAssociation | #ServiceCatalogAppRegistry.#ResourceAssociation | #ServiceDiscovery.#HttpNamespace | #ServiceDiscovery.#Instance | #ServiceDiscovery.#PrivateDnsNamespace | #ServiceDiscovery.#PublicDnsNamespace | #ServiceDiscovery.#Service | #Signer.#ProfilePermission | #Signer.#SigningProfile | #StepFunctions.#Activity | #StepFunctions.#StateMachine | #Synthetics.#Canary | #Transfer.#Server | #Transfer.#User | #WAF.#ByteMatchSet | #WAF.#IPSet | #WAF.#Rule | #WAF.#SizeConstraintSet | #WAF.#SqlInjectionMatchSet | #WAF.#WebACL | #WAF.#XssMatchSet | #WAFRegional.#ByteMatchSet | #WAFRegional.#GeoMatchSet | #WAFRegional.#IPSet | #WAFRegional.#RateBasedRule | #WAFRegional.#RegexPatternSet | #WAFRegional.#Rule | #WAFRegional.#SizeConstraintSet | #WAFRegional.#SqlInjectionMatchSet | #WAFRegional.#WebACL | #WAFRegional.#WebACLAssociation | #WAFRegional.#XssMatchSet | #WAFv2.#IPSet | #WAFv2.#RegexPatternSet | #WAFv2.#RuleGroup | #WAFv2.#WebACL | #WAFv2.#WebACLAssociation | #WorkSpaces.#Workspace | #XRay.#Group | #XRay.#SamplingRule
	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Condition?:   string
		Export?: Name: _
	}
}
