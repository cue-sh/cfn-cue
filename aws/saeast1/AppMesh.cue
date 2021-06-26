package saeast1

import "github.com/cue-sh/cfn-cue/aws/fn"

#AppMesh: {
	#GatewayRoute: {
		Type: "AWS::AppMesh::GatewayRoute"
		Properties: {
			GatewayRouteName?: *string | fn.#Fn
			MeshName:          *string | fn.#Fn
			MeshOwner?:        *string | fn.#Fn
			Spec:              *{
				GrpcRoute?: *{
					Action: *{
						Rewrite?: *{
							Hostname?: *{
								DefaultTargetHostname?: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						Target: *{
							VirtualService: *{
								VirtualServiceName: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Match: *{
						Hostname?: *{
							Exact?:  *string | fn.#Fn
							Suffix?: *string | fn.#Fn
						} | fn.#If
						Metadata?: *[...{
							Invert?: *bool | fn.#Fn
							Match?:  *{
								Exact?:  *string | fn.#Fn
								Prefix?: *string | fn.#Fn
								Range?:  *{
									End:   *int | fn.#Fn
									Start: *int | fn.#Fn
								} | fn.#If
								Regex?:  *string | fn.#Fn
								Suffix?: *string | fn.#Fn
							} | fn.#If
							Name: *string | fn.#Fn
						}] | fn.#If
						ServiceName?: *string | fn.#Fn
					} | fn.#If
				} | fn.#If
				Http2Route?: *{
					Action: *{
						Rewrite?: *{
							Hostname?: *{
								DefaultTargetHostname?: *string | fn.#Fn
							} | fn.#If
							Path?: *{
								Exact?: *string | fn.#Fn
							} | fn.#If
							Prefix?: *{
								DefaultPrefix?: *string | fn.#Fn
								Value?:         *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						Target: *{
							VirtualService: *{
								VirtualServiceName: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Match: *{
						Headers?: *[...{
							Invert?: *bool | fn.#Fn
							Match?:  *{
								Exact?:  *string | fn.#Fn
								Prefix?: *string | fn.#Fn
								Range?:  *{
									End:   *int | fn.#Fn
									Start: *int | fn.#Fn
								} | fn.#If
								Regex?:  *string | fn.#Fn
								Suffix?: *string | fn.#Fn
							} | fn.#If
							Name: *string | fn.#Fn
						}] | fn.#If
						Hostname?: *{
							Exact?:  *string | fn.#Fn
							Suffix?: *string | fn.#Fn
						} | fn.#If
						Method?: *string | fn.#Fn
						Path?:   *{
							Exact?: *string | fn.#Fn
							Regex?: *string | fn.#Fn
						} | fn.#If
						Prefix?:          *string | fn.#Fn
						QueryParameters?: *[...{
							Match?: *{
								Exact?: *string | fn.#Fn
							} | fn.#If
							Name: *string | fn.#Fn
						}] | fn.#If
					} | fn.#If
				} | fn.#If
				HttpRoute?: *{
					Action: *{
						Rewrite?: *{
							Hostname?: *{
								DefaultTargetHostname?: *string | fn.#Fn
							} | fn.#If
							Path?: *{
								Exact?: *string | fn.#Fn
							} | fn.#If
							Prefix?: *{
								DefaultPrefix?: *string | fn.#Fn
								Value?:         *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						Target: *{
							VirtualService: *{
								VirtualServiceName: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Match: *{
						Headers?: *[...{
							Invert?: *bool | fn.#Fn
							Match?:  *{
								Exact?:  *string | fn.#Fn
								Prefix?: *string | fn.#Fn
								Range?:  *{
									End:   *int | fn.#Fn
									Start: *int | fn.#Fn
								} | fn.#If
								Regex?:  *string | fn.#Fn
								Suffix?: *string | fn.#Fn
							} | fn.#If
							Name: *string | fn.#Fn
						}] | fn.#If
						Hostname?: *{
							Exact?:  *string | fn.#Fn
							Suffix?: *string | fn.#Fn
						} | fn.#If
						Method?: *string | fn.#Fn
						Path?:   *{
							Exact?: *string | fn.#Fn
							Regex?: *string | fn.#Fn
						} | fn.#If
						Prefix?:          *string | fn.#Fn
						QueryParameters?: *[...{
							Match?: *{
								Exact?: *string | fn.#Fn
							} | fn.#If
							Name: *string | fn.#Fn
						}] | fn.#If
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VirtualGatewayName: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VirtualGateway: {
		Type: "AWS::AppMesh::VirtualGateway"
		Properties: {
			MeshName:   *string | fn.#Fn
			MeshOwner?: *string | fn.#Fn
			Spec:       *{
				BackendDefaults?: *{
					ClientPolicy?: *{
						TLS?: *{
							Certificate?: *{
								File?: *{
									CertificateChain: *string | fn.#Fn
									PrivateKey:       *string | fn.#Fn
								} | fn.#If
								SDS?: *{
									SecretName: *string | fn.#Fn
								} | fn.#If
							} | fn.#If
							Enforce?:   *bool | fn.#Fn
							Ports?:     [...(*int | fn.#Fn)] | (*int | fn.#Fn)
							Validation: *{
								SubjectAlternativeNames?: *{
									Match: *{
										Exact?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
									} | fn.#If
								} | fn.#If
								Trust: *{
									ACM?: *{
										CertificateAuthorityArns: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
									} | fn.#If
									File?: *{
										CertificateChain: *string | fn.#Fn
									} | fn.#If
									SDS?: *{
										SecretName: *string | fn.#Fn
									} | fn.#If
								} | fn.#If
							} | fn.#If
						} | fn.#If
					} | fn.#If
				} | fn.#If
				Listeners: *[...{
					ConnectionPool?: *{
						GRPC?: *{
							MaxRequests: *int | fn.#Fn
						} | fn.#If
						HTTP?: *{
							MaxConnections:      *int | fn.#Fn
							MaxPendingRequests?: *int | fn.#Fn
						} | fn.#If
						HTTP2?: *{
							MaxRequests: *int | fn.#Fn
						} | fn.#If
					} | fn.#If
					HealthCheck?: *{
						HealthyThreshold:   *int | fn.#Fn
						IntervalMillis:     *int | fn.#Fn
						Path?:              *string | fn.#Fn
						Port?:              *int | fn.#Fn
						Protocol:           *string | fn.#Fn
						TimeoutMillis:      *int | fn.#Fn
						UnhealthyThreshold: *int | fn.#Fn
					} | fn.#If
					PortMapping: *{
						Port:     *int | fn.#Fn
						Protocol: *string | fn.#Fn
					} | fn.#If
					TLS?: *{
						Certificate: *{
							ACM?: *{
								CertificateArn: *string | fn.#Fn
							} | fn.#If
							File?: *{
								CertificateChain: *string | fn.#Fn
								PrivateKey:       *string | fn.#Fn
							} | fn.#If
							SDS?: *{
								SecretName: *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						Mode:        *string | fn.#Fn
						Validation?: *{
							SubjectAlternativeNames?: *{
								Match: *{
									Exact?: [...(*string | fn.#Fn)] | (*string | fn.#Fn)
								} | fn.#If
							} | fn.#If
							Trust: *{
								File?: *{
									CertificateChain: *string | fn.#Fn
								} | fn.#If
								SDS?: *{
									SecretName: *string | fn.#Fn
								} | fn.#If
							} | fn.#If
						} | fn.#If
					} | fn.#If
				}] | fn.#If
				Logging?: *{
					AccessLog?: *{
						File?: *{
							Path: *string | fn.#Fn
						} | fn.#If
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			VirtualGatewayName?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
