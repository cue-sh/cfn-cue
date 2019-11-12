package useast1

import "github.com/TangoGroup/fn"

Athena :: {
	NamedQuery :: {
		Type: "AWS::Athena::NamedQuery"
		Properties: {
			Database:     string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			QueryString:  string | fn.Fn
		}
	}
}
