package uswest2

import "github.com/TangoGroup/fn"

DLM :: {
	LifecyclePolicy :: {
		Type: "AWS::DLM::LifecyclePolicy"
		Properties: {
			Description?:     string | fn.Fn
			ExecutionRoleArn: string | fn.Fn
			PolicyDetails?: {
				Parameters?: ExcludeBootVolume?: bool | fn.Fn
				PolicyType?: string | fn.Fn
				ResourceTypes?: [...((string & ("INSTANCE" | "VOLUME")) | fn.Fn)]
				Schedules?: [...{
					CopyTags?: bool | fn.Fn
					CreateRule?: {
						Interval:     int | fn.Fn
						IntervalUnit: string | fn.Fn
						Times?: [...(string | fn.Fn)]
					}
					Name?: string | fn.Fn
					RetainRule?: Count: int | fn.Fn
					TagsToAdd?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
					VariableTags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				TargetTags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			State: (string & ("DISABLED" | "ENABLED")) | fn.Fn
		}
	}
}
