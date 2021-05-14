package uswest2

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
	Resources: [=~"[a-zA-Z0-9]"]: #EC2.#CapacityReservation | #EC2.#CarrierGateway | #EC2.#ClientVpnAuthorizationRule | #EC2.#ClientVpnEndpoint | #EC2.#ClientVpnRoute | #EC2.#ClientVpnTargetNetworkAssociation | #EC2.#CustomerGateway | #EC2.#DHCPOptions | #EC2.#EC2Fleet | #EC2.#EIP | #EC2.#EIPAssociation | #EC2.#EgressOnlyInternetGateway | #EC2.#EnclaveCertificateIamRoleAssociation | #EC2.#FlowLog | #EC2.#GatewayRouteTableAssociation | #EC2.#Host | #EC2.#Instance | #EC2.#InternetGateway | #EC2.#LaunchTemplate | #EC2.#LocalGatewayRoute | #EC2.#LocalGatewayRouteTableVPCAssociation | #EC2.#NatGateway | #EC2.#NetworkAcl | #EC2.#NetworkAclEntry | #EC2.#NetworkInsightsAnalysis | #EC2.#NetworkInsightsPath | #EC2.#NetworkInterface | #EC2.#NetworkInterfaceAttachment | #EC2.#NetworkInterfacePermission | #EC2.#PlacementGroup | #EC2.#PrefixList | #EC2.#Route | #EC2.#RouteTable | #EC2.#SecurityGroup | #EC2.#SecurityGroupEgress | #EC2.#SecurityGroupIngress | #EC2.#SpotFleet | #EC2.#Subnet | #EC2.#SubnetCidrBlock | #EC2.#SubnetNetworkAclAssociation | #EC2.#SubnetRouteTableAssociation | #EC2.#TrafficMirrorFilter | #EC2.#TrafficMirrorFilterRule | #EC2.#TrafficMirrorSession | #EC2.#TrafficMirrorTarget | #EC2.#TransitGateway | #EC2.#TransitGatewayAttachment | #EC2.#TransitGatewayConnect | #EC2.#TransitGatewayMulticastDomain | #EC2.#TransitGatewayMulticastDomainAssociation | #EC2.#TransitGatewayMulticastGroupMember | #EC2.#TransitGatewayMulticastGroupSource | #EC2.#TransitGatewayRoute | #EC2.#TransitGatewayRouteTable | #EC2.#TransitGatewayRouteTableAssociation | #EC2.#TransitGatewayRouteTablePropagation | #EC2.#VPC | #EC2.#VPCCidrBlock | #EC2.#VPCDHCPOptionsAssociation | #EC2.#VPCEndpoint | #EC2.#VPCEndpointService | #EC2.#VPCEndpointServicePermissions | #EC2.#VPCGatewayAttachment | #EC2.#VPCPeeringConnection | #EC2.#VPNConnection | #EC2.#VPNConnectionRoute | #EC2.#VPNGateway | #EC2.#VPNGatewayRoutePropagation | #EC2.#Volume | #EC2.#VolumeAttachment | #S3.#AccessPoint | #S3.#Bucket | #S3.#BucketPolicy | #S3.#StorageLens
	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Condition?:   string
		Export?: Name: _
	}
}
