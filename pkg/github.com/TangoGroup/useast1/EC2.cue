package useast1

import (
	"github.com/TangoGroup/fn"
	"strings"
)

EC2 :: {
	CapacityReservation :: {
		Type: "AWS::EC2::CapacityReservation"
		Properties: {
			AvailabilityZone:       string | fn.Fn
			EbsOptimized?:          bool | fn.Fn
			EndDate?:               string | fn.Fn
			EndDateType?:           (string & ("limited" | "unlimited")) | fn.Fn
			EphemeralStorage?:      bool | fn.Fn
			InstanceCount:          int | fn.Fn
			InstanceMatchCriteria?: (string & ("open" | "targeted")) | fn.Fn
			InstancePlatform:       (string & ("Linux/UNIX" | "Red Hat Enterprise Linux" | "SUSE Linux" | "Windows with SQL Server Enterprise" | "Windows with SQL Server Standard" | "Windows with SQL Server Web" | "Windows with SQL Server" | "Windows")) | fn.Fn
			InstanceType:           (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-18tb1.metal" | "u-24tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
			TagSpecifications?: [...{
				ResourceType?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}]
			Tenancy?: (string & ("dedicated" | "default")) | fn.Fn
		}
	}
	ClientVpnAuthorizationRule :: {
		Type: "AWS::EC2::ClientVpnAuthorizationRule"
		Properties: {
			AccessGroupId?:      string | fn.Fn
			AuthorizeAllGroups?: bool | fn.Fn
			ClientVpnEndpointId: string | fn.Fn
			Description?:        string | fn.Fn
			TargetNetworkCidr:   string | fn.Fn
		}
	}
	ClientVpnEndpoint :: {
		Type: "AWS::EC2::ClientVpnEndpoint"
		Properties: {
			AuthenticationOptions: [...{
				ActiveDirectory?: DirectoryId:                        string | fn.Fn
				MutualAuthentication?: ClientRootCertificateChainArn: string | fn.Fn
				Type: string | fn.Fn
			}]
			ClientCidrBlock: string | fn.Fn
			ConnectionLogOptions: {
				CloudwatchLogGroup?:  string | fn.Fn
				CloudwatchLogStream?: string | fn.Fn
				Enabled:              bool | fn.Fn
			}
			Description?: string | fn.Fn
			DnsServers?: [...(string | fn.Fn)]
			ServerCertificateArn: string | fn.Fn
			SplitTunnel?:         bool | fn.Fn
			TagSpecifications?: [...{
				ResourceType: string | fn.Fn
				Tags: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}]
			TransportProtocol?: string | fn.Fn
		}
	}
	ClientVpnRoute :: {
		Type: "AWS::EC2::ClientVpnRoute"
		Properties: {
			ClientVpnEndpointId:  string | fn.Fn
			Description?:         string | fn.Fn
			DestinationCidrBlock: string | fn.Fn
			TargetVpcSubnetId:    string | fn.Fn
		}
	}
	ClientVpnTargetNetworkAssociation :: {
		Type: "AWS::EC2::ClientVpnTargetNetworkAssociation"
		Properties: {
			ClientVpnEndpointId: string | fn.Fn
			SubnetId:            string | fn.Fn
		}
	}
	CustomerGateway :: {
		Type: "AWS::EC2::CustomerGateway"
		Properties: {
			BgpAsn:    int | fn.Fn
			IpAddress: string | fn.Fn
			Tags?: [...{
			}]
			Type: (string & ("ipsec.1")) | fn.Fn
		}
	}
	DHCPOptions :: {
		Type: "AWS::EC2::DHCPOptions"
		Properties: {
			DomainName?: string | fn.Fn
			DomainNameServers?: [...(string | fn.Fn)]
			NetbiosNameServers?: [...(string | fn.Fn)]
			NetbiosNodeType?: (int & (1 | 2 | 4 | 8)) | fn.Fn
			NtpServers?: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
	EC2Fleet :: {
		Type: "AWS::EC2::EC2Fleet"
		Properties: {
			ExcessCapacityTerminationPolicy?: (string & ("no-termination" | "termination")) | fn.Fn
			LaunchTemplateConfigs: [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}
				Overrides?: [...{
					AvailabilityZone?: string | fn.Fn
					InstanceType?:     (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-18tb1.metal" | "u-24tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
					MaxPrice?:         string | fn.Fn
					Priority?:         float | fn.Fn
					SubnetId?:         string | fn.Fn
					WeightedCapacity?: float | fn.Fn
				}]
			}]
			OnDemandOptions?: AllocationStrategy?: (string & ("lowest-price" | "prioritized")) | fn.Fn
			ReplaceUnhealthyInstances?: bool | fn.Fn
			SpotOptions?: {
				AllocationStrategy?:           (string & ("diversified" | "lowest-price")) | fn.Fn
				InstanceInterruptionBehavior?: (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
				InstancePoolsToUseCount?:      int | fn.Fn
			}
			TagSpecifications?: [...{
				ResourceType?: string | fn.Fn
				Tags?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
			}]
			TargetCapacitySpecification: {
				DefaultTargetCapacityType?: (string & ("on-demand" | "spot")) | fn.Fn
				OnDemandTargetCapacity?:    int | fn.Fn
				SpotTargetCapacity?:        int | fn.Fn
				TotalTargetCapacity:        int | fn.Fn
			}
			TerminateInstancesWithExpiration?: bool | fn.Fn
			Type?:                             (string & ("instant" | "maintain" | "request")) | fn.Fn
			ValidFrom?:                        string | fn.Fn
			ValidUntil?:                       string | fn.Fn
		}
	}
	EIP :: {
		Type: "AWS::EC2::EIP"
		Properties: {
			Domain?:         (string & ("standard" | "vpc")) | fn.Fn
			InstanceId?:     string | fn.Fn
			PublicIpv4Pool?: string | fn.Fn
		}
	}
	EIPAssociation :: {
		Type: "AWS::EC2::EIPAssociation"
		Properties: {
			AllocationId?:       string | fn.Fn
			EIP?:                string | fn.Fn
			InstanceId?:         string | fn.Fn
			NetworkInterfaceId?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
		}
	}
	EgressOnlyInternetGateway :: {
		Type: "AWS::EC2::EgressOnlyInternetGateway"
		Properties: VpcId: string | fn.Fn
	}
	FlowLog :: {
		Type: "AWS::EC2::FlowLog"
		Properties: {
			DeliverLogsPermissionArn?: string | fn.Fn
			LogDestination?:           string | fn.Fn
			LogDestinationType?:       (string & ("cloud-watch-logs" | "s3")) | fn.Fn
			LogGroupName?:             string | fn.Fn
			ResourceId:                string | fn.Fn
			ResourceType:              (string & ("NetworkInterface" | "Subnet" | "VPC")) | fn.Fn
			TrafficType:               (string & ("ACCEPT" | "ALL" | "REJECT")) | fn.Fn
		}
	}
	Host :: {
		Type: "AWS::EC2::Host"
		Properties: {
			AutoPlacement?:   (string & ("off" | "on")) | fn.Fn
			AvailabilityZone: string | fn.Fn
			HostRecovery?:    string | fn.Fn
			InstanceType:     string | fn.Fn
		}
	}
	Instance :: {
		Type: "AWS::EC2::Instance"
		Properties: {
			AdditionalInfo?:   string | fn.Fn
			Affinity?:         (string & ("default" | "host")) | fn.Fn
			AvailabilityZone?: string | fn.Fn
			BlockDeviceMappings?: [...{
				DeviceName: string | fn.Fn
				Ebs?: {
					DeleteOnTermination?: bool | fn.Fn
					Encrypted?:           bool | fn.Fn
					Iops?:                (int & (>=100 & <=20000)) | fn.Fn
					KmsKeyId?:            string | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
				}
				NoDevice?: {
				}
				VirtualName?: string | fn.Fn
			}]
			CpuOptions?: {
				CoreCount?:      int | fn.Fn
				ThreadsPerCore?: int | fn.Fn
			}
			CreditSpecification?: CPUCredits?: (string & ("standard" | "unlimited")) | fn.Fn
			DisableApiTermination?: bool | fn.Fn
			EbsOptimized?:          bool | fn.Fn
			ElasticGpuSpecifications?: [...{
				Type: string | fn.Fn
			}]
			ElasticInferenceAccelerators?: [...{
				Type: (string & ("eia1.large" | "eia1.medium" | "eia1.xlarge")) | fn.Fn
			}]
			HostId?:                            string | fn.Fn
			IamInstanceProfile?:                (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
			ImageId?:                           string | fn.Fn
			InstanceInitiatedShutdownBehavior?: string | fn.Fn
			InstanceType?:                      (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-18tb1.metal" | "u-24tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
			Ipv6AddressCount?:                  int | fn.Fn
			Ipv6Addresses?: [...{
				Ipv6Address: string | fn.Fn
			}]
			KernelId?: string | fn.Fn
			KeyName?:  string | fn.Fn
			LaunchTemplate?: {
				LaunchTemplateId?:   string | fn.Fn
				LaunchTemplateName?: string | fn.Fn
				Version:             string | fn.Fn
			}
			LicenseSpecifications?: [...{
				LicenseConfigurationArn: string | fn.Fn
			}]
			Monitoring?: bool | fn.Fn
			NetworkInterfaces?: [...{
				AssociatePublicIpAddress?: bool | fn.Fn
				DeleteOnTermination?:      bool | fn.Fn
				Description?:              string | fn.Fn
				DeviceIndex:               string | fn.Fn
				GroupSet?: [...(string | fn.Fn)]
				Ipv6AddressCount?: int | fn.Fn
				Ipv6Addresses?: [...{
					Ipv6Address: string | fn.Fn
				}]
				NetworkInterfaceId?: string | fn.Fn
				PrivateIpAddress?:   string | fn.Fn
				PrivateIpAddresses?: [...{
					Primary:          bool | fn.Fn
					PrivateIpAddress: string | fn.Fn
				}]
				SecondaryPrivateIpAddressCount?: int | fn.Fn
				SubnetId?:                       string | fn.Fn
			}]
			PlacementGroupName?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
			RamdiskId?:          string | fn.Fn
			SecurityGroupIds?: [...(string | fn.Fn)]
			SecurityGroups?: [...(string | fn.Fn)]
			SourceDestCheck?: bool | fn.Fn
			SsmAssociations?: [...{
				AssociationParameters?: [...{
					Key: string | fn.Fn
					Value: [...(string | fn.Fn)]
				}]
				DocumentName: string | fn.Fn
			}]
			SubnetId?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Tenancy?:  (string & ("dedicated" | "default" | "host")) | fn.Fn
			UserData?: string | fn.Fn
			Volumes?: [...{
				Device:   string | fn.Fn
				VolumeId: string | fn.Fn
			}]
		}
	}
	InternetGateway :: {
		Type: "AWS::EC2::InternetGateway"
		Properties: Tags?: [...{
		}]
	}
	LaunchTemplate :: {
		Type: "AWS::EC2::LaunchTemplate"
		Properties: {
			LaunchTemplateData?: {
				BlockDeviceMappings?: [...{
					DeviceName?: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						KmsKeyId?:            string | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				CapacityReservationSpecification?: {
					CapacityReservationPreference?: string | fn.Fn
					CapacityReservationTarget?: CapacityReservationId?: string | fn.Fn
				}
				CpuOptions?: {
					CoreCount?:      int | fn.Fn
					ThreadsPerCore?: int | fn.Fn
				}
				CreditSpecification?: CpuCredits?: (string & ("standard" | "unlimited")) | fn.Fn
				DisableApiTermination?: bool | fn.Fn
				EbsOptimized?:          bool | fn.Fn
				ElasticGpuSpecifications?: [...{
					Type?: string | fn.Fn
				}]
				ElasticInferenceAccelerators?: [...{
					Type?: string | fn.Fn
				}]
				HibernationOptions?: Configured?: bool | fn.Fn
				IamInstanceProfile?: {
					Arn?:  string | fn.Fn
					Name?: (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
				}
				ImageId?:                           string | fn.Fn
				InstanceInitiatedShutdownBehavior?: (string & ("stop" | "terminate")) | fn.Fn
				InstanceMarketOptions?: {
					MarketType?: (string & ("spot")) | fn.Fn
					SpotOptions?: {
						BlockDurationMinutes?:         int | fn.Fn
						InstanceInterruptionBehavior?: (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
						MaxPrice?:                     string | fn.Fn
						SpotInstanceType?:             (string & ("one-time" | "persistent")) | fn.Fn
						ValidUntil?:                   string | fn.Fn
					}
				}
				InstanceType?: (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-18tb1.metal" | "u-24tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
				KernelId?:     string | fn.Fn
				KeyName?:      string | fn.Fn
				LicenseSpecifications?: [...{
					LicenseConfigurationArn?: string | fn.Fn
				}]
				Monitoring?: Enabled?: bool | fn.Fn
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex?:              int | fn.Fn
					Groups?: [...(string | fn.Fn)]
					InterfaceType?:    string | fn.Fn
					Ipv6AddressCount?: int | fn.Fn
					Ipv6Addresses?: [...{
						Ipv6Address?: string | fn.Fn
					}]
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddress?:   string | fn.Fn
					PrivateIpAddresses?: [...{
						Primary?:          bool | fn.Fn
						PrivateIpAddress?: string | fn.Fn
					}]
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				}]
				Placement?: {
					Affinity?:         string | fn.Fn
					AvailabilityZone?: string | fn.Fn
					GroupName?:        string | fn.Fn
					HostId?:           string | fn.Fn
					Tenancy?:          (string & ("dedicated" | "default" | "host")) | fn.Fn
				}
				RamDiskId?: string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)]
				SecurityGroups?: [...(string | fn.Fn)]
				TagSpecifications?: [...{
					ResourceType: (string & ("instance" | "volume")) | fn.Fn
					Tags: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				UserData?: string | fn.Fn
			}
			LaunchTemplateName?: (string & (strings.MinRunes(3) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9().\-/_]+$"#)) | fn.Fn
		}
	}
	NatGateway :: {
		Type: "AWS::EC2::NatGateway"
		Properties: {
			AllocationId: string | fn.Fn
			SubnetId:     string | fn.Fn
			Tags?: [...{
			}]
		}
	}
	NetworkAcl :: {
		Type: "AWS::EC2::NetworkAcl"
		Properties: {
			Tags?: [...{
			}]
			VpcId: string | fn.Fn
		}
	}
	NetworkAclEntry :: {
		Type: "AWS::EC2::NetworkAclEntry"
		Properties: {
			CidrBlock?: (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
			Egress?:    bool | fn.Fn
			Icmp?: {
				Code?: int | fn.Fn
				Type?: int | fn.Fn
			}
			Ipv6CidrBlock?: string | fn.Fn
			NetworkAclId:   string | fn.Fn
			PortRange?: {
				From?: int | fn.Fn
				To?:   int | fn.Fn
			}
			Protocol:   int | fn.Fn
			RuleAction: (string & ("allow" | "deny")) | fn.Fn
			RuleNumber: (int & (>=1 & <=32766)) | fn.Fn
		}
	}
	NetworkInterface :: {
		Type: "AWS::EC2::NetworkInterface"
		Properties: {
			Description?: string | fn.Fn
			GroupSet?: [...(string | fn.Fn)]
			InterfaceType?:    string | fn.Fn
			Ipv6AddressCount?: int | fn.Fn
			Ipv6Addresses?: Ipv6Address: string | fn.Fn
			PrivateIpAddress?: string | fn.Fn
			PrivateIpAddresses?: [...{
				Primary:          bool | fn.Fn
				PrivateIpAddress: string | fn.Fn
			}]
			SecondaryPrivateIpAddressCount?: int | fn.Fn
			SourceDestCheck?:                bool | fn.Fn
			SubnetId:                        string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
	NetworkInterfaceAttachment :: {
		Type: "AWS::EC2::NetworkInterfaceAttachment"
		Properties: {
			DeleteOnTermination?: bool | fn.Fn
			DeviceIndex:          string | fn.Fn
			InstanceId:           string | fn.Fn
			NetworkInterfaceId:   string | fn.Fn
		}
	}
	NetworkInterfacePermission :: {
		Type: "AWS::EC2::NetworkInterfacePermission"
		Properties: {
			AwsAccountId:       string | fn.Fn
			NetworkInterfaceId: string | fn.Fn
			Permission:         (string & ("EIP-ASSOCIATE" | "INSTANCE-ATTACH")) | fn.Fn
		}
	}
	PlacementGroup :: {
		Type: "AWS::EC2::PlacementGroup"
		Properties: Strategy?: (string & ("cluster" | "partition" | "spread")) | fn.Fn
	}
	Route :: {
		Type: "AWS::EC2::Route"
		Properties: {
			DestinationCidrBlock?:        string | fn.Fn
			DestinationIpv6CidrBlock?:    string | fn.Fn
			EgressOnlyInternetGatewayId?: string | fn.Fn
			GatewayId?:                   string | fn.Fn
			InstanceId?:                  string | fn.Fn
			NatGatewayId?:                string | fn.Fn
			NetworkInterfaceId?:          string | fn.Fn
			RouteTableId:                 string | fn.Fn
			TransitGatewayId?:            string | fn.Fn
			VpcPeeringConnectionId?:      string | fn.Fn
		}
	}
	RouteTable :: {
		Type: "AWS::EC2::RouteTable"
		Properties: {
			Tags?: [...{
			}]
			VpcId: string | fn.Fn
		}
	}
	SecurityGroup :: {
		Type: "AWS::EC2::SecurityGroup"
		Properties: {
			GroupDescription: (string & (strings.MinRunes(0) & strings.MaxRunes(255)) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
			GroupName?:       string | fn.Fn
			SecurityGroupEgress?: [...{
				CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				DestinationPrefixListId?:    string | fn.Fn
				DestinationSecurityGroupId?: string | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				ToPort?:                     int | fn.Fn
			}]
			SecurityGroupIngress?: [...{
				CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				SourcePrefixListId?:         string | fn.Fn
				SourceSecurityGroupId?:      string | fn.Fn
				SourceSecurityGroupName?:    string | fn.Fn
				SourceSecurityGroupOwnerId?: string | fn.Fn
				ToPort?:                     int | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId?: string | fn.Fn
		}
	}
	SecurityGroupEgress :: {
		Type: "AWS::EC2::SecurityGroupEgress"
		Properties: {
			CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
			CidrIpv6?:                   string | fn.Fn
			Description?:                string | fn.Fn
			DestinationPrefixListId?:    string | fn.Fn
			DestinationSecurityGroupId?: string | fn.Fn
			FromPort?:                   int | fn.Fn
			GroupId:                     string | fn.Fn
			IpProtocol:                  string | fn.Fn
			ToPort?:                     int | fn.Fn
		}
	}
	SecurityGroupIngress :: {
		Type: "AWS::EC2::SecurityGroupIngress"
		Properties: {
			CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
			CidrIpv6?:                   string | fn.Fn
			Description?:                string | fn.Fn
			FromPort?:                   int | fn.Fn
			GroupId?:                    string | fn.Fn
			GroupName?:                  string | fn.Fn
			IpProtocol:                  string | fn.Fn
			SourcePrefixListId?:         string | fn.Fn
			SourceSecurityGroupId?:      string | fn.Fn
			SourceSecurityGroupName?:    string | fn.Fn
			SourceSecurityGroupOwnerId?: string | fn.Fn
			ToPort?:                     int | fn.Fn
		}
	}
	SpotFleet :: {
		Type: "AWS::EC2::SpotFleet"
		Properties: SpotFleetRequestConfigData: {
			AllocationStrategy?:              (string & ("diversified" | "lowestPrice")) | fn.Fn
			ExcessCapacityTerminationPolicy?: (string & ("default" | "noTermination")) | fn.Fn
			IamFleetRole:                     (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
			InstanceInterruptionBehavior?:    (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
			LaunchSpecifications?: [...{
				BlockDeviceMappings?: [...{
					DeviceName: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				EbsOptimized?: bool | fn.Fn
				IamInstanceProfile?: Arn?: string | fn.Fn
				ImageId:      string | fn.Fn
				InstanceType: (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "u-18tb1.metal" | "u-24tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
				KernelId?:    string | fn.Fn
				KeyName?:     string | fn.Fn
				Monitoring?: Enabled?: bool | fn.Fn
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex?:              int | fn.Fn
					Groups?: [...(string | fn.Fn)]
					Ipv6AddressCount?: int | fn.Fn
					Ipv6Addresses?: [...{
						Ipv6Address: string | fn.Fn
					}]
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddresses?: [...{
						Primary?:         bool | fn.Fn
						PrivateIpAddress: string | fn.Fn
					}]
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				}]
				Placement?: {
					AvailabilityZone?: string | fn.Fn
					GroupName?:        string | fn.Fn
					Tenancy?:          string | fn.Fn
				}
				RamdiskId?: string | fn.Fn
				SecurityGroups?: [...{
					GroupId: string | fn.Fn
				}]
				SpotPrice?: string | fn.Fn
				SubnetId?:  string | fn.Fn
				TagSpecifications?: [...{
					ResourceType?: string | fn.Fn
					Tags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				UserData?:         string | fn.Fn
				WeightedCapacity?: float | fn.Fn
			}]
			LaunchTemplateConfigs?: [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version:             string | fn.Fn
				}
				Overrides?: [...{
					AvailabilityZone?: string | fn.Fn
					InstanceType?:     string | fn.Fn
					SpotPrice?:        string | fn.Fn
					SubnetId?:         string | fn.Fn
					WeightedCapacity?: float | fn.Fn
				}]
			}]
			LoadBalancersConfig?: {
				ClassicLoadBalancersConfig?: ClassicLoadBalancers: [...{
					Name: string | fn.Fn
				}]
				TargetGroupsConfig?: TargetGroups: [...{
					Arn: string | fn.Fn
				}]
			}
			ReplaceUnhealthyInstances?:        bool | fn.Fn
			SpotPrice?:                        string | fn.Fn
			TargetCapacity:                    int | fn.Fn
			TerminateInstancesWithExpiration?: bool | fn.Fn
			Type?:                             (string & ("instant" | "maintain" | "request")) | fn.Fn
			ValidFrom?:                        string | fn.Fn
			ValidUntil?:                       string | fn.Fn
		}
	}
	Subnet :: {
		Type: "AWS::EC2::Subnet"
		Properties: {
			AssignIpv6AddressOnCreation?: bool | fn.Fn
			AvailabilityZone?:            string | fn.Fn
			CidrBlock:                    string | fn.Fn
			Ipv6CidrBlock?:               string | fn.Fn
			MapPublicIpOnLaunch?:         bool | fn.Fn
			Tags?: [...{
			}]
			VpcId: string | fn.Fn
		}
	}
	SubnetCidrBlock :: {
		Type: "AWS::EC2::SubnetCidrBlock"
		Properties: {
			Ipv6CidrBlock: string | fn.Fn
			SubnetId:      string | fn.Fn
		}
	}
	SubnetNetworkAclAssociation :: {
		Type: "AWS::EC2::SubnetNetworkAclAssociation"
		Properties: {
			NetworkAclId: string | fn.Fn
			SubnetId:     string | fn.Fn
		}
	}
	SubnetRouteTableAssociation :: {
		Type: "AWS::EC2::SubnetRouteTableAssociation"
		Properties: {
			RouteTableId: string | fn.Fn
			SubnetId:     string | fn.Fn
		}
	}
	TrafficMirrorFilter :: {
		Type: "AWS::EC2::TrafficMirrorFilter"
		Properties: {
			Description?: string | fn.Fn
			NetworkServices?: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
	TrafficMirrorFilterRule :: {
		Type: "AWS::EC2::TrafficMirrorFilterRule"
		Properties: {
			Description?:         string | fn.Fn
			DestinationCidrBlock: string | fn.Fn
			DestinationPortRange?: {
				FromPort: int | fn.Fn
				ToPort:   int | fn.Fn
			}
			Protocol?:       int | fn.Fn
			RuleAction:      string | fn.Fn
			RuleNumber:      int | fn.Fn
			SourceCidrBlock: string | fn.Fn
			SourcePortRange?: {
				FromPort: int | fn.Fn
				ToPort:   int | fn.Fn
			}
			TrafficDirection:      string | fn.Fn
			TrafficMirrorFilterId: string | fn.Fn
		}
	}
	TrafficMirrorSession :: {
		Type: "AWS::EC2::TrafficMirrorSession"
		Properties: {
			Description?:       string | fn.Fn
			NetworkInterfaceId: string | fn.Fn
			PacketLength?:      int | fn.Fn
			SessionNumber:      int | fn.Fn
			Tags?: [...{
			}]
			TrafficMirrorFilterId: string | fn.Fn
			TrafficMirrorTargetId: string | fn.Fn
			VirtualNetworkId?:     int | fn.Fn
		}
	}
	TrafficMirrorTarget :: {
		Type: "AWS::EC2::TrafficMirrorTarget"
		Properties: {
			Description?:            string | fn.Fn
			NetworkInterfaceId?:     string | fn.Fn
			NetworkLoadBalancerArn?: string | fn.Fn
			Tags?: [...{
			}]
		}
	}
	TransitGateway :: {
		Type: "AWS::EC2::TransitGateway"
		Properties: {
			AmazonSideAsn?:                int | fn.Fn
			AutoAcceptSharedAttachments?:  (string & ("disable" | "enable")) | fn.Fn
			DefaultRouteTableAssociation?: (string & ("disable" | "enable")) | fn.Fn
			DefaultRouteTablePropagation?: (string & ("disable" | "enable")) | fn.Fn
			Description?:                  string | fn.Fn
			DnsSupport?:                   (string & ("disable" | "enable")) | fn.Fn
			Tags?: [...{
			}]
			VpnEcmpSupport?: (string & ("disable" | "enable")) | fn.Fn
		}
	}
	TransitGatewayAttachment :: {
		Type: "AWS::EC2::TransitGatewayAttachment"
		Properties: {
			SubnetIds: [...(string | fn.Fn)]
			Tags?: [...{
			}]
			TransitGatewayId: string | fn.Fn
			VpcId:            string | fn.Fn
		}
	}
	TransitGatewayRoute :: {
		Type: "AWS::EC2::TransitGatewayRoute"
		Properties: {
			Blackhole?:                  bool | fn.Fn
			DestinationCidrBlock?:       string | fn.Fn
			TransitGatewayAttachmentId?: string | fn.Fn
			TransitGatewayRouteTableId:  string | fn.Fn
		}
	}
	TransitGatewayRouteTable :: {
		Type: "AWS::EC2::TransitGatewayRouteTable"
		Properties: {
			Tags?: [...{
			}]
			TransitGatewayId: string | fn.Fn
		}
	}
	TransitGatewayRouteTableAssociation :: {
		Type: "AWS::EC2::TransitGatewayRouteTableAssociation"
		Properties: {
			TransitGatewayAttachmentId: string | fn.Fn
			TransitGatewayRouteTableId: string | fn.Fn
		}
	}
	TransitGatewayRouteTablePropagation :: {
		Type: "AWS::EC2::TransitGatewayRouteTablePropagation"
		Properties: {
			TransitGatewayAttachmentId: string | fn.Fn
			TransitGatewayRouteTableId: string | fn.Fn
		}
	}
	VPC :: {
		Type: "AWS::EC2::VPC"
		Properties: {
			CidrBlock:           string | fn.Fn
			EnableDnsHostnames?: bool | fn.Fn
			EnableDnsSupport?:   bool | fn.Fn
			InstanceTenancy?:    (string & ("dedicated" | "default")) | fn.Fn
			Tags?: [...{
			}]
		}
	}
	VPCCidrBlock :: {
		Type: "AWS::EC2::VPCCidrBlock"
		Properties: {
			AmazonProvidedIpv6CidrBlock?: bool | fn.Fn
			CidrBlock?:                   string | fn.Fn
			VpcId:                        string | fn.Fn
		}
	}
	VPCDHCPOptionsAssociation :: {
		Type: "AWS::EC2::VPCDHCPOptionsAssociation"
		Properties: {
			DhcpOptionsId: string | fn.Fn
			VpcId:         string | fn.Fn
		}
	}
	VPCEndpoint :: {
		Type: "AWS::EC2::VPCEndpoint"
		Properties: {
			PolicyDocument?: {
			} | fn.Fn
			PrivateDnsEnabled?: bool | fn.Fn
			RouteTableIds?: [...(string | fn.Fn)]
			SecurityGroupIds?: [...(string | fn.Fn)]
			ServiceName: string | fn.Fn
			SubnetIds?: [...(string | fn.Fn)]
			VpcEndpointType?: (string & ("Gateway" | "Interface")) | fn.Fn
			VpcId:            string | fn.Fn
		}
	}
	VPCEndpointConnectionNotification :: {
		Type: "AWS::EC2::VPCEndpointConnectionNotification"
		Properties: {
			ConnectionEvents: [...((string & ("Accept" | "Connect" | "Delete" | "Reject")) | fn.Fn)]
			ConnectionNotificationArn: string | fn.Fn
			ServiceId?:                string | fn.Fn
			VPCEndpointId?:            string | fn.Fn
		}
	}
	VPCEndpointService :: {
		Type: "AWS::EC2::VPCEndpointService"
		Properties: {
			AcceptanceRequired?: bool | fn.Fn
			NetworkLoadBalancerArns: [...(string | fn.Fn)]
		}
	}
	VPCEndpointServicePermissions :: {
		Type: "AWS::EC2::VPCEndpointServicePermissions"
		Properties: {
			AllowedPrincipals?: [...(string | fn.Fn)]
			ServiceId: string | fn.Fn
		}
	}
	VPCGatewayAttachment :: {
		Type: "AWS::EC2::VPCGatewayAttachment"
		Properties: {
			InternetGatewayId?: string | fn.Fn
			VpcId:              string | fn.Fn
			VpnGatewayId?:      string | fn.Fn
		}
	}
	VPCPeeringConnection :: {
		Type: "AWS::EC2::VPCPeeringConnection"
		Properties: {
			PeerOwnerId?: string | fn.Fn
			PeerRegion?:  string | fn.Fn
			PeerRoleArn?: string | fn.Fn
			PeerVpcId:    string | fn.Fn
			Tags?: [...{
			}]
			VpcId: string | fn.Fn
		}
	}
	VPNConnection :: {
		Type: "AWS::EC2::VPNConnection"
		Properties: {
			CustomerGatewayId: string | fn.Fn
			StaticRoutesOnly?: bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TransitGatewayId?: string | fn.Fn
			Type:              (string & ("ipsec.1")) | fn.Fn
			VpnGatewayId?:     string | fn.Fn
			VpnTunnelOptionsSpecifications?: [...{
				PreSharedKey?:     string | fn.Fn
				TunnelInsideCidr?: string | fn.Fn
			}]
		}
	}
	VPNConnectionRoute :: {
		Type: "AWS::EC2::VPNConnectionRoute"
		Properties: {
			DestinationCidrBlock: string | fn.Fn
			VpnConnectionId:      string | fn.Fn
		}
	}
	VPNGateway :: {
		Type: "AWS::EC2::VPNGateway"
		Properties: {
			AmazonSideAsn?: int | fn.Fn
			Tags?: [...{
			}]
			Type: (string & ("ipsec.1")) | fn.Fn
		}
	}
	VPNGatewayRoutePropagation :: {
		Type: "AWS::EC2::VPNGatewayRoutePropagation"
		Properties: {
			RouteTableIds: [...(string | fn.Fn)]
			VpnGatewayId: string | fn.Fn
		}
	}
	Volume :: {
		Type: "AWS::EC2::Volume"
		Properties: {
			AutoEnableIO?:    bool | fn.Fn
			AvailabilityZone: string | fn.Fn
			Encrypted?:       bool | fn.Fn
			Iops?:            int | fn.Fn
			KmsKeyId?:        string | fn.Fn
			Size?:            int | fn.Fn
			SnapshotId?:      string | fn.Fn
			Tags?: [...{
			}]
			VolumeType?: (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
		}
	}
	VolumeAttachment :: {
		Type: "AWS::EC2::VolumeAttachment"
		Properties: {
			Device:     string | fn.Fn
			InstanceId: string | fn.Fn
			VolumeId:   string | fn.Fn
		}
	}
}