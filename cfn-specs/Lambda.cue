package Lambda

Alias :: {
  Type: "AWS::Lambda::Alias"
  Properties: {
    Description?:    string
    FunctionName:    string
    FunctionVersion: string
    Name:            string
    RoutingConfig?:  __AliasRoutingConfiguration
  }
  __AliasRoutingConfiguration = {
    AdditionalVersionWeights: [...__VersionWeight]
  }
  __VersionWeight = {
    FunctionVersion: string
    FunctionWeight:  float
  }
}
EventSourceMapping :: {
  Type: "AWS::Lambda::EventSourceMapping"
  Properties: {
    BatchSize?:                      int
    Enabled?:                        bool
    EventSourceArn:                  string
    FunctionName:                    string
    MaximumBatchingWindowInSeconds?: int
    StartingPosition?:               string
  }
}
Function :: {
  Type: "AWS::Lambda::Function"
  Properties: {
    Code:              __Code
    DeadLetterConfig?: __DeadLetterConfig
    Description?:      string
    Environment?:      __Environment
    FunctionName?:     string
    Handler:           string
    KmsKeyArn?:        string
    Layers?: [...string]
    MemorySize?:                   int
    ReservedConcurrentExecutions?: int
    Role:                          string
    Runtime:                       string
    Tags?: [...__Tag]
    Timeout?:       int
    TracingConfig?: __TracingConfig
    VpcConfig?:     __VpcConfig
  }
  __Code = {
    S3Bucket?:        string
    S3Key?:           string
    S3ObjectVersion?: string
    ZipFile?:         string
  }
  __DeadLetterConfig = {
    TargetArn?: string
  }
  __Environment = {
    Variables?: {
    }
  }
  __TracingConfig = {
    Mode?: string
  }
  __VpcConfig = {
    SecurityGroupIds: [...string]
    SubnetIds: [...string]
  }
}
LayerVersion :: {
  Type: "AWS::Lambda::LayerVersion"
  Properties: {
    CompatibleRuntimes?: [...string]
    Content:      __Content
    Description?: string
    LayerName?:   string
    LicenseInfo?: string
  }
  __Content = {
    S3Bucket:         string
    S3Key:            string
    S3ObjectVersion?: string
  }
}
LayerVersionPermission :: {
  Type: "AWS::Lambda::LayerVersionPermission"
  Properties: {
    Action:          string
    LayerVersionArn: string
    OrganizationId?: string
    Principal:       string
  }
}
Permission :: {
  Type: "AWS::Lambda::Permission"
  Properties: {
    Action:            string
    EventSourceToken?: string
    FunctionName:      string
    Principal:         string
    SourceAccount?:    string
    SourceArn?:        string
  }
}
Version :: {
  Type: "AWS::Lambda::Version"
  Properties: {
    CodeSha256?:  string
    Description?: string
    FunctionName: string
  }
}
