package apnortheast2

import "github.com/TangoGroup/aws/fn"

#ACMPCA: {
	#Certificate: {
		Type: "AWS::ACMPCA::Certificate"
		Properties: {
			ApiPassthrough?: {
				Extensions?: {
					CertificatePolicies?: {
						CertificatePolicyList?: [...{
							CertPolicyId:      string | fn.#Fn
							PolicyQualifiers?: {
								PolicyQualifierInfoList?: [...{
									PolicyQualifierId: string | fn.#Fn
									Qualifier:         {
										CpsUri: string | fn.#Fn
									} | fn.#If
								}] | fn.#If
							} | fn.#If
						}] | fn.#If
					} | fn.#If
					ExtendedKeyUsage?: {
						ExtendedKeyUsageList?: [...{
							ExtendedKeyUsageObjectIdentifier?: string | fn.#Fn
							ExtendedKeyUsageType?:             string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					KeyUsage?: {
						CRLSign?:          bool | fn.#Fn
						DataEncipherment?: bool | fn.#Fn
						DecipherOnly?:     bool | fn.#Fn
						DigitalSignature?: bool | fn.#Fn
						EncipherOnly?:     bool | fn.#Fn
						KeyAgreement?:     bool | fn.#Fn
						KeyCertSign?:      bool | fn.#Fn
						KeyEncipherment?:  bool | fn.#Fn
						NonRepudiation?:   bool | fn.#Fn
					} | fn.#If
					SubjectAlternativeNames?: {
						GeneralNameList?: [...{
							DirectoryName?: {
								CommonName?:                 string | fn.#Fn
								Country?:                    string | fn.#Fn
								DistinguishedNameQualifier?: string | fn.#Fn
								GenerationQualifier?:        string | fn.#Fn
								GivenName?:                  string | fn.#Fn
								Initials?:                   string | fn.#Fn
								Locality?:                   string | fn.#Fn
								Organization?:               string | fn.#Fn
								OrganizationalUnit?:         string | fn.#Fn
								Pseudonym?:                  string | fn.#Fn
								SerialNumber?:               string | fn.#Fn
								State?:                      string | fn.#Fn
								Surname?:                    string | fn.#Fn
								Title?:                      string | fn.#Fn
							} | fn.#If
							DnsName?:      string | fn.#Fn
							EdiPartyName?: {
								NameAssigner: string | fn.#Fn
								PartyName:    string | fn.#Fn
							} | fn.#If
							IpAddress?: string | fn.#Fn
							OtherName?: {
								TypeId: string | fn.#Fn
								Value:  string | fn.#Fn
							} | fn.#If
							RegisteredId?:              string | fn.#Fn
							Rfc822Name?:                string | fn.#Fn
							UniformResourceIdentifier?: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
				} | fn.#If
				Subject?: {
					CommonName?:                 string | fn.#Fn
					Country?:                    string | fn.#Fn
					DistinguishedNameQualifier?: string | fn.#Fn
					GenerationQualifier?:        string | fn.#Fn
					GivenName?:                  string | fn.#Fn
					Initials?:                   string | fn.#Fn
					Locality?:                   string | fn.#Fn
					Organization?:               string | fn.#Fn
					OrganizationalUnit?:         string | fn.#Fn
					Pseudonym?:                  string | fn.#Fn
					SerialNumber?:               string | fn.#Fn
					State?:                      string | fn.#Fn
					Surname?:                    string | fn.#Fn
					Title?:                      string | fn.#Fn
				} | fn.#If
			} | fn.#If
			CertificateAuthorityArn:   string | fn.#Fn
			CertificateSigningRequest: string | fn.#Fn
			SigningAlgorithm:          string | fn.#Fn
			TemplateArn?:              string | fn.#Fn
			Validity:                  {
				Type:  string | fn.#Fn
				Value: number | fn.#Fn
			} | fn.#If
			ValidityNotBefore?: {
				Type:  string | fn.#Fn
				Value: number | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#CertificateAuthority: {
		Type: "AWS::ACMPCA::CertificateAuthority"
		Properties: {
			CsrExtensions?: {
				KeyUsage?: {
					CRLSign?:          bool | fn.#Fn
					DataEncipherment?: bool | fn.#Fn
					DecipherOnly?:     bool | fn.#Fn
					DigitalSignature?: bool | fn.#Fn
					EncipherOnly?:     bool | fn.#Fn
					KeyAgreement?:     bool | fn.#Fn
					KeyCertSign?:      bool | fn.#Fn
					KeyEncipherment?:  bool | fn.#Fn
					NonRepudiation?:   bool | fn.#Fn
				} | fn.#If
				SubjectInformationAccess?: {
					SubjectInformationAccess?: [...{
						[string]: _
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			KeyAlgorithm:             string | fn.#Fn
			RevocationConfiguration?: {
				CrlConfiguration?: {
					CustomCname?:      string | fn.#Fn
					Enabled?:          bool | fn.#Fn
					ExpirationInDays?: int | fn.#Fn
					S3BucketName?:     string | fn.#Fn
				} | fn.#If
			} | fn.#If
			SigningAlgorithm: string | fn.#Fn
			Subject:          {
				CommonName?:                 string | fn.#Fn
				Country?:                    string | fn.#Fn
				DistinguishedNameQualifier?: string | fn.#Fn
				GenerationQualifier?:        string | fn.#Fn
				GivenName?:                  string | fn.#Fn
				Initials?:                   string | fn.#Fn
				Locality?:                   string | fn.#Fn
				Organization?:               string | fn.#Fn
				OrganizationalUnit?:         string | fn.#Fn
				Pseudonym?:                  string | fn.#Fn
				SerialNumber?:               string | fn.#Fn
				State?:                      string | fn.#Fn
				Surname?:                    string | fn.#Fn
				Title?:                      string | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			Type: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#CertificateAuthorityActivation: {
		Type: "AWS::ACMPCA::CertificateAuthorityActivation"
		Properties: {
			Certificate:             string | fn.#Fn
			CertificateAuthorityArn: string | fn.#Fn
			CertificateChain?:       string | fn.#Fn
			Status?:                 string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}