package mecentral1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#EC2: {
	#CustomerGateway: {
		Type: "AWS::EC2::CustomerGateway"
		Properties: {
			BgpAsn:    *int | fn.#Fn
			IpAddress: *string | fn.#Fn
			Tags?:     *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type: *("ipsec.1") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DHCPOptions: {
		Type: "AWS::EC2::DHCPOptions"
		Properties: {
			DomainName?:         *string | fn.#Fn
			DomainNameServers?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			NetbiosNameServers?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			NetbiosNodeType?:    *(1 | 2 | 4 | 8) | fn.#Fn
			NtpServers?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
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
	#EC2Fleet: {
		Type: "AWS::EC2::EC2Fleet"
		Properties: {
			Context?:                         *string | fn.#Fn
			ExcessCapacityTerminationPolicy?: *("termination" | "no-termination") | fn.#Fn
			LaunchTemplateConfigs:            *[...{
				LaunchTemplateSpecification?: *{
					LaunchTemplateId?:   *string | fn.#Fn
					LaunchTemplateName?: *(strings.MinRunes(3) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9\(\)\.\-/_]+"#)) | fn.#Fn
					Version?:            *string | fn.#Fn
				} | fn.#If
				Overrides?: *[...{
					AvailabilityZone?:     *string | fn.#Fn
					InstanceRequirements?: *{
						AcceleratorCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						AcceleratorManufacturers?:  [...(*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)] | (*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)
						AcceleratorNames?:          [...(*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)] | (*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)
						AcceleratorTotalMemoryMiB?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						AcceleratorTypes?:         [...(*("gpu" | "fpga" | "inference") | fn.#Fn)] | (*("gpu" | "fpga" | "inference") | fn.#Fn)
						BareMetal?:                *("included" | "required" | "excluded") | fn.#Fn
						BaselineEbsBandwidthMbps?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						BurstablePerformance?:  *("included" | "required" | "excluded") | fn.#Fn
						CpuManufacturers?:      [...(*("intel" | "amd" | "amazon-web-services") | fn.#Fn)] | (*("intel" | "amd" | "amazon-web-services") | fn.#Fn)
						ExcludedInstanceTypes?: [...(*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)
						InstanceGenerations?:   [...(*("current" | "previous") | fn.#Fn)] | (*("current" | "previous") | fn.#Fn)
						LocalStorage?:          *("included" | "required" | "excluded") | fn.#Fn
						LocalStorageTypes?:     [...(*("hdd" | "ssd") | fn.#Fn)] | (*("hdd" | "ssd") | fn.#Fn)
						MemoryGiBPerVCpu?:      *{
							Max?: *number | fn.#Fn
							Min?: *number | fn.#Fn
						} | fn.#If
						MemoryMiB?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						NetworkInterfaceCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						OnDemandMaxPricePercentageOverLowestPrice?: *int | fn.#Fn
						RequireHibernateSupport?:                   *bool | fn.#Fn
						SpotMaxPricePercentageOverLowestPrice?:     *int | fn.#Fn
						TotalLocalStorageGB?:                       *{
							Max?: *number | fn.#Fn
							Min?: *number | fn.#Fn
						} | fn.#If
						VCpuCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
					} | fn.#If
					InstanceType?: *("c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "m6gd.12xlarge" | "m6gd.16xlarge" | "m6gd.2xlarge" | "m6gd.4xlarge" | "m6gd.8xlarge" | "m6gd.large" | "m6gd.medium" | "m6gd.metal" | "m6gd.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t4g.2xlarge" | "t4g.large" | "t4g.medium" | "t4g.micro" | "t4g.nano" | "t4g.small" | "t4g.xlarge") | fn.#Fn
					MaxPrice?:     *string | fn.#Fn
					Placement?:    *{
						Affinity?:             *string | fn.#Fn
						AvailabilityZone?:     *string | fn.#Fn
						GroupName?:            *string | fn.#Fn
						HostId?:               *string | fn.#Fn
						HostResourceGroupArn?: *string | fn.#Fn
						PartitionNumber?:      *int | fn.#Fn
						SpreadDomain?:         *string | fn.#Fn
						Tenancy?:              *string | fn.#Fn
					} | fn.#If
					Priority?:         *number | fn.#Fn
					SubnetId?:         *string | fn.#Fn
					WeightedCapacity?: *number | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			OnDemandOptions?: *{
				AllocationStrategy?:         *("lowest-price" | "prioritized") | fn.#Fn
				CapacityReservationOptions?: *{
					UsageStrategy?: *("use-capacity-reservations-first") | fn.#Fn
				} | fn.#If
				MaxTotalPrice?:          *string | fn.#Fn
				MinTargetCapacity?:      *int | fn.#Fn
				SingleAvailabilityZone?: *bool | fn.#Fn
				SingleInstanceType?:     *bool | fn.#Fn
			} | fn.#If
			ReplaceUnhealthyInstances?: *bool | fn.#Fn
			SpotOptions?:               *{
				AllocationStrategy?:           *("lowestPrice" | "diversified" | "capacityOptimized" | "capacityOptimizedPrioritized") | fn.#Fn
				InstanceInterruptionBehavior?: *("hibernate" | "stop" | "terminate") | fn.#Fn
				InstancePoolsToUseCount?:      *int | fn.#Fn
				MaintenanceStrategies?:        *{
					CapacityRebalance?: *{
						ReplacementStrategy?: *("launch" | "launch-before-terminate") | fn.#Fn
						TerminationDelay?:    *int | fn.#Fn
					} | fn.#If
				} | fn.#If
				MaxTotalPrice?:          *string | fn.#Fn
				MinTargetCapacity?:      *int | fn.#Fn
				SingleAvailabilityZone?: *bool | fn.#Fn
				SingleInstanceType?:     *bool | fn.#Fn
			} | fn.#If
			TagSpecifications?: *[...{
				ResourceType?: *("client-vpn-endpoint" | "customer-gateway" | "dedicated-host" | "dhcp-options" | "egress-only-internet-gateway" | "elastic-gpu" | "elastic-ip" | "export-image-task" | "export-instance-task" | "fleet" | "fpga-image" | "host-reservation" | "image" | "import-image-task" | "import-snapshot-task" | "instance" | "internet-gateway" | "key-pair" | "launch-template" | "local-gateway-route-table-vpc-association" | "natgateway" | "network-acl" | "network-insights-analysis" | "network-insights-path" | "network-interface" | "placement-group" | "reserved-instances" | "route-table" | "security-group" | "snapshot" | "spot-fleet-request" | "spot-instances-request" | "subnet" | "traffic-mirror-filter" | "traffic-mirror-session" | "traffic-mirror-target" | "transit-gateway" | "transit-gateway-attachment" | "transit-gateway-connect-peer" | "transit-gateway-multicast-domain" | "transit-gateway-route-table" | "volume" | "vpc" | "vpc-flow-log" | "vpc-peering-connection" | "vpn-connection" | "vpn-gateway") | fn.#Fn
				Tags?:         *[...{
					Key:   *string | fn.#Fn
					Value: *string | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			TargetCapacitySpecification: *{
				DefaultTargetCapacityType?: *("on-demand" | "spot") | fn.#Fn
				OnDemandTargetCapacity?:    *int | fn.#Fn
				SpotTargetCapacity?:        *int | fn.#Fn
				TargetCapacityUnitType?:    *("vcpu" | "memory-mib" | "units") | fn.#Fn
				TotalTargetCapacity:        *int | fn.#Fn
			} | fn.#If
			TerminateInstancesWithExpiration?: *bool | fn.#Fn
			Type?:                             *("maintain" | "request" | "instant") | fn.#Fn
			ValidFrom?:                        *string | fn.#Fn
			ValidUntil?:                       *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EIP: {
		Type: "AWS::EC2::EIP"
		Properties: {
			Domain?:             *("standard" | "vpc") | fn.#Fn
			InstanceId?:         *string | fn.#Fn
			NetworkBorderGroup?: *string | fn.#Fn
			PublicIpv4Pool?:     *string | fn.#Fn
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
	#EIPAssociation: {
		Type: "AWS::EC2::EIPAssociation"
		Properties: {
			AllocationId?:       *string | fn.#Fn
			EIP?:                *string | fn.#Fn
			InstanceId?:         *string | fn.#Fn
			NetworkInterfaceId?: *string | fn.#Fn
			PrivateIpAddress?:   *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EgressOnlyInternetGateway: {
		Type: "AWS::EC2::EgressOnlyInternetGateway"
		Properties: VpcId: *string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FlowLog: {
		Type: "AWS::EC2::FlowLog"
		Properties: {
			DeliverLogsPermissionArn?: *string | fn.#Fn
			DestinationOptions?:       *{
				[string]: _
			} | fn.#Fn
			LogDestination?:         *string | fn.#Fn
			LogDestinationType?:     *("cloud-watch-logs" | "s3" | "kinesis-data-firehose") | fn.#Fn
			LogFormat?:              *string | fn.#Fn
			LogGroupName?:           *string | fn.#Fn
			MaxAggregationInterval?: *int | fn.#Fn
			ResourceId:              *string | fn.#Fn
			ResourceType:            *("NetworkInterface" | "Subnet" | "VPC" | "TransitGateway" | "TransitGatewayAttachment") | fn.#Fn
			Tags?:                   *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TrafficType: *("ACCEPT" | "ALL" | "REJECT") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#GatewayRouteTableAssociation: {
		Type: "AWS::EC2::GatewayRouteTableAssociation"
		Properties: {
			GatewayId:    *string | fn.#Fn
			RouteTableId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Host: {
		Type: "AWS::EC2::Host"
		Properties: {
			AutoPlacement?:   *("off" | "on") | fn.#Fn
			AvailabilityZone: *(=~#"[a-z0-9-]+"#) | fn.#Fn
			HostRecovery?:    *string | fn.#Fn
			InstanceType:     *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Instance: {
		Type: "AWS::EC2::Instance"
		Properties: {
			AdditionalInfo?:      *string | fn.#Fn
			Affinity?:            *("default" | "host") | fn.#Fn
			AvailabilityZone?:    *(=~#"[a-z0-9-]+"#) | fn.#Fn
			BlockDeviceMappings?: *[...{
				DeviceName: *string | fn.#Fn
				Ebs?:       *{
					DeleteOnTermination?: *bool | fn.#Fn
					Encrypted?:           *bool | fn.#Fn
					Iops?:                *(>=100 & <=20000) | fn.#Fn
					KmsKeyId?:            *string | fn.#Fn
					SnapshotId?:          *string | fn.#Fn
					VolumeSize?:          *int | fn.#Fn
					VolumeType?:          *("gp2" | "gp3" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
				} | fn.#If
				NoDevice?:    *string | fn.#Fn
				VirtualName?: *string | fn.#Fn
			}] | fn.#If
			CpuOptions?: *{
				CoreCount?:      *int | fn.#Fn
				ThreadsPerCore?: *int | fn.#Fn
			} | fn.#If
			CreditSpecification?: *{
				CPUCredits?: *("standard" | "unlimited") | fn.#Fn
			} | fn.#If
			DisableApiTermination?:    *bool | fn.#Fn
			EbsOptimized?:             *bool | fn.#Fn
			ElasticGpuSpecifications?: *[...{
				Type: *string | fn.#Fn
			}] | fn.#If
			ElasticInferenceAccelerators?: *[...{
				Count?: *int | fn.#Fn
				Type:   *("eia1.large" | "eia1.medium" | "eia1.xlarge") | fn.#Fn
			}] | fn.#If
			EnclaveOptions?: *{
				Enabled?: *bool | fn.#Fn
			} | fn.#If
			HibernationOptions?: *{
				Configured?: *bool | fn.#Fn
			} | fn.#If
			HostId?:                            *string | fn.#Fn
			HostResourceGroupArn?:              *string | fn.#Fn
			IamInstanceProfile?:                *(=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.#Fn
			ImageId?:                           *string | fn.#Fn
			InstanceInitiatedShutdownBehavior?: *string | fn.#Fn
			InstanceType?:                      *("c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "m6gd.12xlarge" | "m6gd.16xlarge" | "m6gd.2xlarge" | "m6gd.4xlarge" | "m6gd.8xlarge" | "m6gd.large" | "m6gd.medium" | "m6gd.metal" | "m6gd.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t4g.2xlarge" | "t4g.large" | "t4g.medium" | "t4g.micro" | "t4g.nano" | "t4g.small" | "t4g.xlarge") | fn.#Fn
			Ipv6AddressCount?:                  *int | fn.#Fn
			Ipv6Addresses?:                     *[...{
				Ipv6Address: *string | fn.#Fn
			}] | fn.#If
			KernelId?:       *string | fn.#Fn
			KeyName?:        *string | fn.#Fn
			LaunchTemplate?: *{
				LaunchTemplateId?:   *string | fn.#Fn
				LaunchTemplateName?: *string | fn.#Fn
				Version:             *string | fn.#Fn
			} | fn.#If
			LicenseSpecifications?: *[...{
				LicenseConfigurationArn: *string | fn.#Fn
			}] | fn.#If
			Monitoring?:        *bool | fn.#Fn
			NetworkInterfaces?: *[...{
				AssociateCarrierIpAddress?: *bool | fn.#Fn
				AssociatePublicIpAddress?:  *bool | fn.#Fn
				DeleteOnTermination?:       *bool | fn.#Fn
				Description?:               *string | fn.#Fn
				DeviceIndex:                *string | fn.#Fn
				GroupSet?:                  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				Ipv6AddressCount?:          *int | fn.#Fn
				Ipv6Addresses?:             *[...{
					Ipv6Address: *string | fn.#Fn
				}] | fn.#If
				NetworkInterfaceId?: *string | fn.#Fn
				PrivateIpAddress?:   *string | fn.#Fn
				PrivateIpAddresses?: *[...{
					Primary:          *bool | fn.#Fn
					PrivateIpAddress: *string | fn.#Fn
				}] | fn.#If
				SecondaryPrivateIpAddressCount?: *int | fn.#Fn
				SubnetId?:                       *string | fn.#Fn
			}] | fn.#If
			PlacementGroupName?:    *string | fn.#Fn
			PrivateDnsNameOptions?: *{
				EnableResourceNameDnsAAAARecord?: *bool | fn.#Fn
				EnableResourceNameDnsARecord?:    *bool | fn.#Fn
				HostnameType?:                    *string | fn.#Fn
			} | fn.#If
			PrivateIpAddress?:                *string | fn.#Fn
			PropagateTagsToVolumeOnCreation?: *bool | fn.#Fn
			RamdiskId?:                       *string | fn.#Fn
			SecurityGroupIds?:                [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SecurityGroups?:                  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SourceDestCheck?:                 *bool | fn.#Fn
			SsmAssociations?:                 *[...{
				AssociationParameters?: *[...{
					Key:   *string | fn.#Fn
					Value: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
				}] | fn.#If
				DocumentName: *string | fn.#Fn
			}] | fn.#If
			SubnetId?: *string | fn.#Fn
			Tags?:     *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Tenancy?:  *("dedicated" | "default" | "host") | fn.#Fn
			UserData?: *string | fn.#Fn
			Volumes?:  *[...{
				Device:   *string | fn.#Fn
				VolumeId: *string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?: string | [...string]
		CreationPolicy?: {
			AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
			ResourceSignal?: {
				Count?:   int
				Timeout?: string
			}
		}
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#InternetGateway: {
		Type: "AWS::EC2::InternetGateway"
		Properties: Tags?: *[...{
			Key:   *string | fn.#Fn
			Value: *string | fn.#Fn
		}] | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#KeyPair: {
		Type: "AWS::EC2::KeyPair"
		Properties: {
			KeyName:            *string | fn.#Fn
			KeyType?:           *("rsa" | "ed25519") | fn.#Fn
			PublicKeyMaterial?: *string | fn.#Fn
			Tags?:              *[...{
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
	#NatGateway: {
		Type: "AWS::EC2::NatGateway"
		Properties: {
			AllocationId?:     *string | fn.#Fn
			ConnectivityType?: *string | fn.#Fn
			SubnetId:          *string | fn.#Fn
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
	#NetworkAcl: {
		Type: "AWS::EC2::NetworkAcl"
		Properties: {
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkAclEntry: {
		Type: "AWS::EC2::NetworkAclEntry"
		Properties: {
			CidrBlock?: *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			Egress?:    *bool | fn.#Fn
			Icmp?:      *{
				Code?: *int | fn.#Fn
				Type?: *int | fn.#Fn
			} | fn.#If
			Ipv6CidrBlock?: *string | fn.#Fn
			NetworkAclId:   *string | fn.#Fn
			PortRange?:     *{
				From?: *int | fn.#Fn
				To?:   *int | fn.#Fn
			} | fn.#If
			Protocol:   *int | fn.#Fn
			RuleAction: *("allow" | "deny") | fn.#Fn
			RuleNumber: *(>=1 & <=32766) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkInterface: {
		Type: "AWS::EC2::NetworkInterface"
		Properties: {
			Description?:      *string | fn.#Fn
			GroupSet?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			InterfaceType?:    *string | fn.#Fn
			Ipv6AddressCount?: *int | fn.#Fn
			Ipv6Addresses?:    *[...{
				Ipv6Address: *string | fn.#Fn
			}] | fn.#If
			PrivateIpAddress?:   *string | fn.#Fn
			PrivateIpAddresses?: *[...{
				Primary:          *bool | fn.#Fn
				PrivateIpAddress: *string | fn.#Fn
			}] | fn.#If
			SecondaryPrivateIpAddressCount?: *int | fn.#Fn
			SourceDestCheck?:                *bool | fn.#Fn
			SubnetId:                        *string | fn.#Fn
			Tags?:                           *[...{
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
	#NetworkInterfaceAttachment: {
		Type: "AWS::EC2::NetworkInterfaceAttachment"
		Properties: {
			DeleteOnTermination?: *bool | fn.#Fn
			DeviceIndex:          *string | fn.#Fn
			InstanceId:           *string | fn.#Fn
			NetworkInterfaceId:   *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkInterfacePermission: {
		Type: "AWS::EC2::NetworkInterfacePermission"
		Properties: {
			AwsAccountId:       *string | fn.#Fn
			NetworkInterfaceId: *string | fn.#Fn
			Permission:         *("EIP-ASSOCIATE" | "INSTANCE-ATTACH") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PlacementGroup: {
		Type: "AWS::EC2::PlacementGroup"
		Properties: Strategy?: *("cluster" | "partition" | "spread") | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Route: {
		Type: "AWS::EC2::Route"
		Properties: {
			CarrierGatewayId?:            *string | fn.#Fn
			DestinationCidrBlock?:        *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			DestinationIpv6CidrBlock?:    *string | fn.#Fn
			EgressOnlyInternetGatewayId?: *string | fn.#Fn
			GatewayId?:                   *string | fn.#Fn
			InstanceId?:                  *string | fn.#Fn
			LocalGatewayId?:              *string | fn.#Fn
			NatGatewayId?:                *string | fn.#Fn
			NetworkInterfaceId?:          *string | fn.#Fn
			RouteTableId:                 *string | fn.#Fn
			TransitGatewayId?:            *string | fn.#Fn
			VpcEndpointId?:               *string | fn.#Fn
			VpcPeeringConnectionId?:      *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RouteTable: {
		Type: "AWS::EC2::RouteTable"
		Properties: {
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroup: {
		Type: "AWS::EC2::SecurityGroup"
		Properties: {
			GroupDescription:     *(strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
			GroupName?:           *string | fn.#Fn
			SecurityGroupEgress?: *[...{
				CidrIp?:                     *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				CidrIpv6?:                   *string | fn.#Fn
				Description?:                *(strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
				DestinationPrefixListId?:    *string | fn.#Fn
				DestinationSecurityGroupId?: *string | fn.#Fn
				FromPort?:                   *int | fn.#Fn
				IpProtocol:                  *string | fn.#Fn
				ToPort?:                     *int | fn.#Fn
			}] | fn.#If
			SecurityGroupIngress?: *[...{
				CidrIp?:                     *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				CidrIpv6?:                   *string | fn.#Fn
				Description?:                *(strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
				FromPort?:                   *int | fn.#Fn
				IpProtocol:                  *string | fn.#Fn
				SourcePrefixListId?:         *string | fn.#Fn
				SourceSecurityGroupId?:      *string | fn.#Fn
				SourceSecurityGroupName?:    *string | fn.#Fn
				SourceSecurityGroupOwnerId?: *string | fn.#Fn
				ToPort?:                     *int | fn.#Fn
			}] | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroupEgress: {
		Type: "AWS::EC2::SecurityGroupEgress"
		Properties: {
			CidrIp?:                     *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			CidrIpv6?:                   *string | fn.#Fn
			Description?:                *string | fn.#Fn
			DestinationPrefixListId?:    *string | fn.#Fn
			DestinationSecurityGroupId?: *string | fn.#Fn
			FromPort?:                   *int | fn.#Fn
			GroupId:                     *string | fn.#Fn
			IpProtocol:                  *string | fn.#Fn
			ToPort?:                     *int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroupIngress: {
		Type: "AWS::EC2::SecurityGroupIngress"
		Properties: {
			CidrIp?:                     *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			CidrIpv6?:                   *string | fn.#Fn
			Description?:                *string | fn.#Fn
			FromPort?:                   *int | fn.#Fn
			GroupId?:                    *string | fn.#Fn
			GroupName?:                  *string | fn.#Fn
			IpProtocol:                  *string | fn.#Fn
			SourcePrefixListId?:         *string | fn.#Fn
			SourceSecurityGroupId?:      *string | fn.#Fn
			SourceSecurityGroupName?:    *string | fn.#Fn
			SourceSecurityGroupOwnerId?: *string | fn.#Fn
			ToPort?:                     *int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SpotFleet: {
		Type: "AWS::EC2::SpotFleet"
		Properties: SpotFleetRequestConfigData: *{
			AllocationStrategy?:              *("capacityOptimized" | "capacityOptimizedPrioritized" | "diversified" | "lowestPrice") | fn.#Fn
			Context?:                         *string | fn.#Fn
			ExcessCapacityTerminationPolicy?: *("Default" | "NoTermination" | "default" | "noTermination") | fn.#Fn
			IamFleetRole:                     *(=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
			InstanceInterruptionBehavior?:    *("hibernate" | "stop" | "terminate") | fn.#Fn
			InstancePoolsToUseCount?:         *int | fn.#Fn
			LaunchSpecifications?:            *[...{
				BlockDeviceMappings?: *[...{
					DeviceName: *string | fn.#Fn
					Ebs?:       *{
						DeleteOnTermination?: *bool | fn.#Fn
						Encrypted?:           *bool | fn.#Fn
						Iops?:                *int | fn.#Fn
						SnapshotId?:          *string | fn.#Fn
						VolumeSize?:          *int | fn.#Fn
						VolumeType?:          *("gp2" | "gp3" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
					} | fn.#If
					NoDevice?:    *string | fn.#Fn
					VirtualName?: *string | fn.#Fn
				}] | fn.#If
				EbsOptimized?:       *bool | fn.#Fn
				IamInstanceProfile?: *{
					Arn?: *string | fn.#Fn
				} | fn.#If
				ImageId:               *string | fn.#Fn
				InstanceRequirements?: *{
					AcceleratorCount?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
					AcceleratorManufacturers?:  [...(*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)] | (*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)
					AcceleratorNames?:          [...(*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)] | (*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)
					AcceleratorTotalMemoryMiB?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
					AcceleratorTypes?:         [...(*("gpu" | "fpga" | "inference") | fn.#Fn)] | (*("gpu" | "fpga" | "inference") | fn.#Fn)
					BareMetal?:                *("included" | "required" | "excluded") | fn.#Fn
					BaselineEbsBandwidthMbps?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
					BurstablePerformance?:  *("included" | "required" | "excluded") | fn.#Fn
					CpuManufacturers?:      [...(*("intel" | "amd" | "amazon-web-services") | fn.#Fn)] | (*("intel" | "amd" | "amazon-web-services") | fn.#Fn)
					ExcludedInstanceTypes?: [...(*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)
					InstanceGenerations?:   [...(*("current" | "previous") | fn.#Fn)] | (*("current" | "previous") | fn.#Fn)
					LocalStorage?:          *("included" | "required" | "excluded") | fn.#Fn
					LocalStorageTypes?:     [...(*("hdd" | "ssd") | fn.#Fn)] | (*("hdd" | "ssd") | fn.#Fn)
					MemoryGiBPerVCpu?:      *{
						Max?: *number | fn.#Fn
						Min?: *number | fn.#Fn
					} | fn.#If
					MemoryMiB?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
					NetworkInterfaceCount?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
					OnDemandMaxPricePercentageOverLowestPrice?: *int | fn.#Fn
					RequireHibernateSupport?:                   *bool | fn.#Fn
					SpotMaxPricePercentageOverLowestPrice?:     *int | fn.#Fn
					TotalLocalStorageGB?:                       *{
						Max?: *number | fn.#Fn
						Min?: *number | fn.#Fn
					} | fn.#If
					VCpuCount?: *{
						Max?: *int | fn.#Fn
						Min?: *int | fn.#Fn
					} | fn.#If
				} | fn.#If
				InstanceType?: *("c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "m6gd.12xlarge" | "m6gd.16xlarge" | "m6gd.2xlarge" | "m6gd.4xlarge" | "m6gd.8xlarge" | "m6gd.large" | "m6gd.medium" | "m6gd.metal" | "m6gd.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t4g.2xlarge" | "t4g.large" | "t4g.medium" | "t4g.micro" | "t4g.nano" | "t4g.small" | "t4g.xlarge") | fn.#Fn
				KernelId?:     *string | fn.#Fn
				KeyName?:      *string | fn.#Fn
				Monitoring?:   *{
					Enabled?: *bool | fn.#Fn
				} | fn.#If
				NetworkInterfaces?: *[...{
					AssociatePublicIpAddress?: *bool | fn.#Fn
					DeleteOnTermination?:      *bool | fn.#Fn
					Description?:              *string | fn.#Fn
					DeviceIndex?:              *int | fn.#Fn
					Groups?:                   [...(*string | fn.#Fn)] | (*string | fn.#Fn)
					Ipv6AddressCount?:         *int | fn.#Fn
					Ipv6Addresses?:            *[...{
						Ipv6Address: *string | fn.#Fn
					}] | fn.#If
					NetworkInterfaceId?: *string | fn.#Fn
					PrivateIpAddresses?: *[...{
						Primary?:         *bool | fn.#Fn
						PrivateIpAddress: *string | fn.#Fn
					}] | fn.#If
					SecondaryPrivateIpAddressCount?: *int | fn.#Fn
					SubnetId?:                       *string | fn.#Fn
				}] | fn.#If
				Placement?: *{
					AvailabilityZone?: *(=~#"[a-z0-9-]+"#) | fn.#Fn
					GroupName?:        *string | fn.#Fn
					Tenancy?:          *("dedicated" | "default" | "host") | fn.#Fn
				} | fn.#If
				RamdiskId?:      *string | fn.#Fn
				SecurityGroups?: *[...{
					GroupId: *string | fn.#Fn
				}] | fn.#If
				SpotPrice?:         *string | fn.#Fn
				SubnetId?:          *string | fn.#Fn
				TagSpecifications?: *[...{
					ResourceType?: *("client-vpn-endpoint" | "customer-gateway" | "dedicated-host" | "dhcp-options" | "egress-only-internet-gateway" | "elastic-gpu" | "elastic-ip" | "export-image-task" | "export-instance-task" | "fleet" | "fpga-image" | "host-reservation" | "image" | "import-image-task" | "import-snapshot-task" | "instance" | "internet-gateway" | "key-pair" | "launch-template" | "local-gateway-route-table-vpc-association" | "natgateway" | "network-acl" | "network-insights-analysis" | "network-insights-path" | "network-interface" | "placement-group" | "reserved-instances" | "route-table" | "security-group" | "snapshot" | "spot-fleet-request" | "spot-instances-request" | "subnet" | "traffic-mirror-filter" | "traffic-mirror-session" | "traffic-mirror-target" | "transit-gateway" | "transit-gateway-attachment" | "transit-gateway-connect-peer" | "transit-gateway-multicast-domain" | "transit-gateway-route-table" | "volume" | "vpc" | "vpc-flow-log" | "vpc-peering-connection" | "vpn-connection" | "vpn-gateway") | fn.#Fn
					Tags?:         *[...{
						Key:   *string | fn.#Fn
						Value: *string | fn.#Fn
					}] | fn.#If
				}] | fn.#If
				UserData?:         *string | fn.#Fn
				WeightedCapacity?: *number | fn.#Fn
			}] | fn.#If
			LaunchTemplateConfigs?: *[...{
				LaunchTemplateSpecification?: *{
					LaunchTemplateId?:   *string | fn.#Fn
					LaunchTemplateName?: *(strings.MinRunes(3) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9\(\)\.\-/_]+"#)) | fn.#Fn
					Version:             *string | fn.#Fn
				} | fn.#If
				Overrides?: *[...{
					AvailabilityZone?:     *(=~#"[a-z0-9-]+"#) | fn.#Fn
					InstanceRequirements?: *{
						AcceleratorCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						AcceleratorManufacturers?:  [...(*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)] | (*("nvidia" | "amd" | "amazon-web-services" | "xilinx") | fn.#Fn)
						AcceleratorNames?:          [...(*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)] | (*("a100" | "v100" | "k80" | "t4" | "m60" | "radeon-pro-v520" | "vu9p" | "inferentia" | "k520") | fn.#Fn)
						AcceleratorTotalMemoryMiB?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						AcceleratorTypes?:         [...(*("gpu" | "fpga" | "inference") | fn.#Fn)] | (*("gpu" | "fpga" | "inference") | fn.#Fn)
						BareMetal?:                *("included" | "required" | "excluded") | fn.#Fn
						BaselineEbsBandwidthMbps?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						BurstablePerformance?:  *("included" | "required" | "excluded") | fn.#Fn
						CpuManufacturers?:      [...(*("intel" | "amd" | "amazon-web-services") | fn.#Fn)] | (*("intel" | "amd" | "amazon-web-services") | fn.#Fn)
						ExcludedInstanceTypes?: [...(*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)] | (*(strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9\.\*]+"#)) | fn.#Fn)
						InstanceGenerations?:   [...(*("current" | "previous") | fn.#Fn)] | (*("current" | "previous") | fn.#Fn)
						LocalStorage?:          *("included" | "required" | "excluded") | fn.#Fn
						LocalStorageTypes?:     [...(*("hdd" | "ssd") | fn.#Fn)] | (*("hdd" | "ssd") | fn.#Fn)
						MemoryGiBPerVCpu?:      *{
							Max?: *number | fn.#Fn
							Min?: *number | fn.#Fn
						} | fn.#If
						MemoryMiB?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						NetworkInterfaceCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
						OnDemandMaxPricePercentageOverLowestPrice?: *int | fn.#Fn
						RequireHibernateSupport?:                   *bool | fn.#Fn
						SpotMaxPricePercentageOverLowestPrice?:     *int | fn.#Fn
						TotalLocalStorageGB?:                       *{
							Max?: *number | fn.#Fn
							Min?: *number | fn.#Fn
						} | fn.#If
						VCpuCount?: *{
							Max?: *int | fn.#Fn
							Min?: *int | fn.#Fn
						} | fn.#If
					} | fn.#If
					InstanceType?:     *string | fn.#Fn
					Priority?:         *number | fn.#Fn
					SpotPrice?:        *string | fn.#Fn
					SubnetId?:         *string | fn.#Fn
					WeightedCapacity?: *number | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			LoadBalancersConfig?: *{
				ClassicLoadBalancersConfig?: *{
					ClassicLoadBalancers: *[...{
						Name: *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				TargetGroupsConfig?: *{
					TargetGroups: *[...{
						Arn: *string | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			OnDemandAllocationStrategy?: *string | fn.#Fn
			OnDemandMaxTotalPrice?:      *string | fn.#Fn
			OnDemandTargetCapacity?:     *int | fn.#Fn
			ReplaceUnhealthyInstances?:  *bool | fn.#Fn
			SpotMaintenanceStrategies?:  *{
				CapacityRebalance?: *{
					ReplacementStrategy?: *("launch" | "launch-before-terminate") | fn.#Fn
					TerminationDelay?:    *int | fn.#Fn
				} | fn.#If
			} | fn.#If
			SpotMaxTotalPrice?: *string | fn.#Fn
			SpotPrice?:         *string | fn.#Fn
			TagSpecifications?: *[...{
				ResourceType?: *("client-vpn-endpoint" | "customer-gateway" | "dedicated-host" | "dhcp-options" | "egress-only-internet-gateway" | "elastic-gpu" | "elastic-ip" | "export-image-task" | "export-instance-task" | "fleet" | "fpga-image" | "host-reservation" | "image" | "import-image-task" | "import-snapshot-task" | "instance" | "internet-gateway" | "key-pair" | "launch-template" | "local-gateway-route-table-vpc-association" | "natgateway" | "network-acl" | "network-insights-analysis" | "network-insights-path" | "network-interface" | "placement-group" | "reserved-instances" | "route-table" | "security-group" | "snapshot" | "spot-fleet-request" | "spot-instances-request" | "subnet" | "traffic-mirror-filter" | "traffic-mirror-session" | "traffic-mirror-target" | "transit-gateway" | "transit-gateway-attachment" | "transit-gateway-connect-peer" | "transit-gateway-multicast-domain" | "transit-gateway-route-table" | "volume" | "vpc" | "vpc-flow-log" | "vpc-peering-connection" | "vpn-connection" | "vpn-gateway") | fn.#Fn
				Tags?:         *[...{
					Key:   *string | fn.#Fn
					Value: *string | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			TargetCapacity:                    *int | fn.#Fn
			TargetCapacityUnitType?:           *("vcpu" | "memory-mib" | "units") | fn.#Fn
			TerminateInstancesWithExpiration?: *bool | fn.#Fn
			Type?:                             *("maintain" | "request") | fn.#Fn
			ValidFrom?:                        *string | fn.#Fn
			ValidUntil?:                       *string | fn.#Fn
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Subnet: {
		Type: "AWS::EC2::Subnet"
		Properties: {
			AssignIpv6AddressOnCreation?:   *bool | fn.#Fn
			AvailabilityZone?:              *(=~#"[a-z0-9-]+"#) | fn.#Fn
			AvailabilityZoneId?:            *string | fn.#Fn
			CidrBlock?:                     *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			EnableDns64?:                   *bool | fn.#Fn
			Ipv6CidrBlock?:                 *string | fn.#Fn
			Ipv6Native?:                    *bool | fn.#Fn
			MapPublicIpOnLaunch?:           *bool | fn.#Fn
			OutpostArn?:                    *string | fn.#Fn
			PrivateDnsNameOptionsOnLaunch?: *{
				[string]: _
			} | fn.#Fn
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetCidrBlock: {
		Type: "AWS::EC2::SubnetCidrBlock"
		Properties: {
			Ipv6CidrBlock: *string | fn.#Fn
			SubnetId:      *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetNetworkAclAssociation: {
		Type: "AWS::EC2::SubnetNetworkAclAssociation"
		Properties: {
			NetworkAclId: *string | fn.#Fn
			SubnetId:     *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetRouteTableAssociation: {
		Type: "AWS::EC2::SubnetRouteTableAssociation"
		Properties: {
			RouteTableId: *string | fn.#Fn
			SubnetId:     *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPC: {
		Type: "AWS::EC2::VPC"
		Properties: {
			CidrBlock?:          *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			EnableDnsHostnames?: *bool | fn.#Fn
			EnableDnsSupport?:   *bool | fn.#Fn
			InstanceTenancy?:    *("dedicated" | "default") | fn.#Fn
			Ipv4IpamPoolId?:     *string | fn.#Fn
			Ipv4NetmaskLength?:  *int | fn.#Fn
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
	#VPCCidrBlock: {
		Type: "AWS::EC2::VPCCidrBlock"
		Properties: {
			AmazonProvidedIpv6CidrBlock?: *bool | fn.#Fn
			CidrBlock?:                   *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			Ipv4IpamPoolId?:              *string | fn.#Fn
			Ipv4NetmaskLength?:           *int | fn.#Fn
			Ipv6CidrBlock?:               *string | fn.#Fn
			Ipv6IpamPoolId?:              *string | fn.#Fn
			Ipv6NetmaskLength?:           *int | fn.#Fn
			Ipv6Pool?:                    *string | fn.#Fn
			VpcId:                        *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCDHCPOptionsAssociation: {
		Type: "AWS::EC2::VPCDHCPOptionsAssociation"
		Properties: {
			DhcpOptionsId: *string | fn.#Fn
			VpcId:         *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCEndpoint: {
		Type: "AWS::EC2::VPCEndpoint"
		Properties: {
			PolicyDocument?: *{
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			PrivateDnsEnabled?: *bool | fn.#Fn
			RouteTableIds?:     [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			SecurityGroupIds?:  [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			ServiceName:        *string | fn.#Fn
			SubnetIds?:         [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			VpcEndpointType?:   *string | fn.#Fn
			VpcId:              *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCGatewayAttachment: {
		Type: "AWS::EC2::VPCGatewayAttachment"
		Properties: {
			InternetGatewayId?: *string | fn.#Fn
			VpcId:              *string | fn.#Fn
			VpnGatewayId?:      *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCPeeringConnection: {
		Type: "AWS::EC2::VPCPeeringConnection"
		Properties: {
			PeerOwnerId?: *string | fn.#Fn
			PeerRegion?:  *string | fn.#Fn
			PeerRoleArn?: *string | fn.#Fn
			PeerVpcId:    *string | fn.#Fn
			Tags?:        *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VpcId: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNConnection: {
		Type: "AWS::EC2::VPNConnection"
		Properties: {
			CustomerGatewayId: *string | fn.#Fn
			StaticRoutesOnly?: *bool | fn.#Fn
			Tags?:             *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			TransitGatewayId?:               *string | fn.#Fn
			Type:                            *("ipsec.1") | fn.#Fn
			VpnGatewayId?:                   *string | fn.#Fn
			VpnTunnelOptionsSpecifications?: *[...{
				PreSharedKey?:     *string | fn.#Fn
				TunnelInsideCidr?: *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNConnectionRoute: {
		Type: "AWS::EC2::VPNConnectionRoute"
		Properties: {
			DestinationCidrBlock: *(=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			VpnConnectionId:      *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNGateway: {
		Type: "AWS::EC2::VPNGateway"
		Properties: {
			AmazonSideAsn?: *int | fn.#Fn
			Tags?:          *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Type: *("ipsec.1") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNGatewayRoutePropagation: {
		Type: "AWS::EC2::VPNGatewayRoutePropagation"
		Properties: {
			RouteTableIds: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
			VpnGatewayId:  *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Volume: {
		Type: "AWS::EC2::Volume"
		Properties: {
			AutoEnableIO?:       *bool | fn.#Fn
			AvailabilityZone:    *string | fn.#Fn
			Encrypted?:          *bool | fn.#Fn
			Iops?:               *int | fn.#Fn
			KmsKeyId?:           *string | fn.#Fn
			MultiAttachEnabled?: *bool | fn.#Fn
			OutpostArn?:         *string | fn.#Fn
			Size?:               *int | fn.#Fn
			SnapshotId?:         *string | fn.#Fn
			Tags?:               *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			Throughput?: *int | fn.#Fn
			VolumeType?: *("gp2" | "gp3" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#VolumeAttachment: {
		Type: "AWS::EC2::VolumeAttachment"
		Properties: {
			Device:     *string | fn.#Fn
			InstanceId: *string | fn.#Fn
			VolumeId:   *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
