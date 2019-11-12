package mesouth1

import "github.com/TangoGroup/fn"

ElasticLoadBalancing :: {
	LoadBalancer :: {
		Type: "AWS::ElasticLoadBalancing::LoadBalancer"
		Properties: {
			AccessLoggingPolicy?: {
				EmitInterval?:   int | fn.Fn
				Enabled:         bool | fn.Fn
				S3BucketName:    string | fn.Fn
				S3BucketPrefix?: string | fn.Fn
			}
			AppCookieStickinessPolicy?: [...{
				CookieName: string | fn.Fn
				PolicyName: string | fn.Fn
			}]
			AvailabilityZones?: [...(string | fn.Fn)]
			ConnectionDrainingPolicy?: {
				Enabled:  bool | fn.Fn
				Timeout?: int | fn.Fn
			}
			ConnectionSettings?: IdleTimeout: int | fn.Fn
			CrossZone?: bool | fn.Fn
			HealthCheck?: {
				HealthyThreshold:   string | fn.Fn
				Interval:           string | fn.Fn
				Target:             string | fn.Fn
				Timeout:            string | fn.Fn
				UnhealthyThreshold: string | fn.Fn
			}
			Instances?: [...(string | fn.Fn)]
			LBCookieStickinessPolicy?: [...{
				CookieExpirationPeriod?: string | fn.Fn
				PolicyName?:             string | fn.Fn
			}]
			Listeners: [...{
				InstancePort:      (string & (>=1 & <=65535)) | fn.Fn
				InstanceProtocol?: string | fn.Fn
				LoadBalancerPort:  (string & (>=1 & <=65535)) | fn.Fn
				PolicyNames?: [...(string | fn.Fn)]
				Protocol:          string | fn.Fn
				SSLCertificateId?: string | fn.Fn
			}]
			LoadBalancerName?: string | fn.Fn
			Policies?: [...{
				Attributes: [...({
				} | fn.Fn)]
				InstancePorts?: [...(string | fn.Fn)]
				LoadBalancerPorts?: [...(string | fn.Fn)]
				PolicyName: string | fn.Fn
				PolicyType: string | fn.Fn
			}]
			Scheme?: string | fn.Fn
			SecurityGroups?: [...(string | fn.Fn)]
			Subnets?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
}