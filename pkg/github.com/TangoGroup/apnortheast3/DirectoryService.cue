package apnortheast3

import "github.com/TangoGroup/fn"

DirectoryService :: {
	MicrosoftAD :: {
		Type: "AWS::DirectoryService::MicrosoftAD"
		Properties: {
			CreateAlias?: bool | fn.Fn
			Edition?:     (string & ("Enterprise" | "Standard")) | fn.Fn
			EnableSso?:   bool | fn.Fn
			Name:         string | fn.Fn
			Password:     string | fn.Fn
			ShortName?:   string | fn.Fn
			VpcSettings: {
				SubnetIds: [...(string | fn.Fn)]
				VpcId: string | fn.Fn
			}
		}
	}
	SimpleAD :: {
		Type: "AWS::DirectoryService::SimpleAD"
		Properties: {
			CreateAlias?: bool | fn.Fn
			Description?: string | fn.Fn
			EnableSso?:   bool | fn.Fn
			Name:         string | fn.Fn
			Password:     string | fn.Fn
			ShortName?:   string | fn.Fn
			Size:         (string & ("Large" | "Small")) | fn.Fn
			VpcSettings: {
				SubnetIds: [...(string | fn.Fn)]
				VpcId: string | fn.Fn
			}
		}
	}
}
