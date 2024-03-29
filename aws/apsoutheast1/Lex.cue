package apsoutheast1

import (
	"github.com/cue-sh/cfn-cue/aws/fn"
	"strings"
)

#Lex: {
	#Bot: {
		Type: "AWS::Lex::Bot"
		Properties: {
			AutoBuildBotLocales?: *bool | fn.#Fn
			BotFileS3Location?:   *{
				S3Bucket:         *(strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"^[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]$"#)) | fn.#Fn
				S3ObjectKey:      *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"[\.\-\!\*\_\'\(\)a-zA-Z0-9][\.\-\!\*\_\'\(\)\/a-zA-Z0-9]*$"#)) | fn.#Fn
				S3ObjectVersion?: *(strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.#Fn
			} | fn.#If
			BotLocales?: *[...{
				CustomVocabulary?: *{
					CustomVocabularyItems: *[...{
						Phrase:  *(strings.MinRunes(1) & strings.MaxRunes(100)) | fn.#Fn
						Weight?: *(>=1 & <=3) | fn.#Fn
					}] | fn.#If
				} | fn.#If
				Description?: *string | fn.#Fn
				Intents?:     *[...{
					Description?:    *string | fn.#Fn
					DialogCodeHook?: *{
						Enabled: *bool | fn.#Fn
					} | fn.#If
					FulfillmentCodeHook?: *{
						Enabled:                          *bool | fn.#Fn
						FulfillmentUpdatesSpecification?: *{
							Active:         *bool | fn.#Fn
							StartResponse?: *{
								AllowInterrupt?: *bool | fn.#Fn
								DelayInSeconds:  *(>=1 & <=900) | fn.#Fn
								MessageGroups:   *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
							} | fn.#If
							TimeoutInSeconds?: *(>=1 & <=900) | fn.#Fn
							UpdateResponse?:   *{
								AllowInterrupt?:    *bool | fn.#Fn
								FrequencyInSeconds: *(>=1 & <=900) | fn.#Fn
								MessageGroups:      *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
							} | fn.#If
						} | fn.#If
						PostFulfillmentStatusSpecification?: *{
							FailureResponse?: *{
								AllowInterrupt?:   *bool | fn.#Fn
								MessageGroupsList: *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
							} | fn.#If
							SuccessResponse?: *{
								AllowInterrupt?:   *bool | fn.#Fn
								MessageGroupsList: *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
							} | fn.#If
							TimeoutResponse?: *{
								AllowInterrupt?:   *bool | fn.#Fn
								MessageGroupsList: *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
							} | fn.#If
						} | fn.#If
					} | fn.#If
					InputContexts?: *[...{
						Name: *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
					}] | fn.#If
					IntentClosingSetting?: *{
						ClosingResponse: *{
							AllowInterrupt?:   *bool | fn.#Fn
							MessageGroupsList: *[...{
								Message: *{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								} | fn.#If
								Variations?: *[...{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								}] | fn.#If
							}] | fn.#If
						} | fn.#If
						IsActive?: *bool | fn.#Fn
					} | fn.#If
					IntentConfirmationSetting?: *{
						DeclinationResponse: *{
							AllowInterrupt?:   *bool | fn.#Fn
							MessageGroupsList: *[...{
								Message: *{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								} | fn.#If
								Variations?: *[...{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								}] | fn.#If
							}] | fn.#If
						} | fn.#If
						IsActive?:           *bool | fn.#Fn
						PromptSpecification: *{
							AllowInterrupt?:   *bool | fn.#Fn
							MaxRetries:        *int | fn.#Fn
							MessageGroupsList: *[...{
								Message: *{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								} | fn.#If
								Variations?: *[...{
									CustomPayload?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									ImageResponseCard?: *{
										Buttons?: *[...{
											Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
										}] | fn.#If
										ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
									} | fn.#If
									PlainTextMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
									SSMLMessage?: *{
										Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
									} | fn.#If
								}] | fn.#If
							}] | fn.#If
							MessageSelectionStrategy?:    *("Random" | "Ordered") | fn.#Fn
							PromptAttemptsSpecification?: *{
								[string]: {
									AllowInterrupt?:   *bool | fn.#Fn
									AllowedInputTypes: *{
										AllowAudioInput: *bool | fn.#Fn
										AllowDTMFInput:  *bool | fn.#Fn
									} | fn.#If
									AudioAndDTMFInputSpecification?: *{
										AudioSpecification?: *{
											EndTimeoutMs: *int | fn.#Fn
											MaxLengthMs:  *int | fn.#Fn
										} | fn.#If
										DTMFSpecification?: *{
											DeletionCharacter: *string | fn.#Fn
											EndCharacter:      *string | fn.#Fn
											EndTimeoutMs:      *int | fn.#Fn
											MaxLength:         *int | fn.#Fn
										} | fn.#If
										StartTimeoutMs: *int | fn.#Fn
									} | fn.#If
									TextInputSpecification?: *{
										StartTimeoutMs: *int | fn.#Fn
									} | fn.#If
								}
							} | fn.#If
						} | fn.#If
					} | fn.#If
					KendraConfiguration?: *{
						KendraIndex:               *(strings.MinRunes(32) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-zA-Z-]*:kendra:[a-z]+-[a-z]+-[0-9]:[0-9]{12}:index/[a-zA-Z0-9][a-zA-Z0-9_-]*$"#)) | fn.#Fn
						QueryFilterString?:        *(strings.MinRunes(1) & strings.MaxRunes(5000)) | fn.#Fn
						QueryFilterStringEnabled?: *bool | fn.#Fn
					} | fn.#If
					Name:            *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
					OutputContexts?: *[...{
						Name:                *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
						TimeToLiveInSeconds: *(>=5 & <=86400) | fn.#Fn
						TurnsToLive:         *(>=1 & <=20) | fn.#Fn
					}] | fn.#If
					ParentIntentSignature?: *string | fn.#Fn
					SampleUtterances?:      *[...{
						Utterance: *string | fn.#Fn
					}] | fn.#If
					SlotPriorities?: *[...{
						Priority: *int | fn.#Fn
						SlotName: *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
					}] | fn.#If
					Slots?: *[...{
						Description?:           *string | fn.#Fn
						MultipleValuesSetting?: *{
							AllowMultipleValues?: *bool | fn.#Fn
						} | fn.#If
						Name:                *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
						ObfuscationSetting?: *{
							ObfuscationSettingType: *("None" | "DefaultObfuscation") | fn.#Fn
						} | fn.#If
						SlotTypeName:            *string | fn.#Fn
						ValueElicitationSetting: *{
							DefaultValueSpecification?: *{
								DefaultValueList: *[...{
									DefaultValue: *(strings.MinRunes(1) & strings.MaxRunes(202)) | fn.#Fn
								}] | fn.#If
							} | fn.#If
							PromptSpecification?: *{
								AllowInterrupt?:   *bool | fn.#Fn
								MaxRetries:        *int | fn.#Fn
								MessageGroupsList: *[...{
									Message: *{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									} | fn.#If
									Variations?: *[...{
										CustomPayload?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										ImageResponseCard?: *{
											Buttons?: *[...{
												Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
											}] | fn.#If
											ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
										} | fn.#If
										PlainTextMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
										SSMLMessage?: *{
											Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
										} | fn.#If
									}] | fn.#If
								}] | fn.#If
								MessageSelectionStrategy?:    *("Random" | "Ordered") | fn.#Fn
								PromptAttemptsSpecification?: *{
									[string]: {
										AllowInterrupt?:   *bool | fn.#Fn
										AllowedInputTypes: *{
											AllowAudioInput: *bool | fn.#Fn
											AllowDTMFInput:  *bool | fn.#Fn
										} | fn.#If
										AudioAndDTMFInputSpecification?: *{
											AudioSpecification?: *{
												EndTimeoutMs: *int | fn.#Fn
												MaxLengthMs:  *int | fn.#Fn
											} | fn.#If
											DTMFSpecification?: *{
												DeletionCharacter: *string | fn.#Fn
												EndCharacter:      *string | fn.#Fn
												EndTimeoutMs:      *int | fn.#Fn
												MaxLength:         *int | fn.#Fn
											} | fn.#If
											StartTimeoutMs: *int | fn.#Fn
										} | fn.#If
										TextInputSpecification?: *{
											StartTimeoutMs: *int | fn.#Fn
										} | fn.#If
									}
								} | fn.#If
							} | fn.#If
							SampleUtterances?: *[...{
								Utterance: *string | fn.#Fn
							}] | fn.#If
							SlotConstraint:                *("Required" | "Optional") | fn.#Fn
							WaitAndContinueSpecification?: *{
								ContinueResponse: *{
									AllowInterrupt?:   *bool | fn.#Fn
									MessageGroupsList: *[...{
										Message: *{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										} | fn.#If
										Variations?: *[...{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										}] | fn.#If
									}] | fn.#If
								} | fn.#If
								IsActive?:             *bool | fn.#Fn
								StillWaitingResponse?: *{
									AllowInterrupt?:    *bool | fn.#Fn
									FrequencyInSeconds: *(>=1 & <=300) | fn.#Fn
									MessageGroupsList:  *[...{
										Message: *{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										} | fn.#If
										Variations?: *[...{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										}] | fn.#If
									}] | fn.#If
									TimeoutInSeconds: *(>=1 & <=900) | fn.#Fn
								} | fn.#If
								WaitingResponse: *{
									AllowInterrupt?:   *bool | fn.#Fn
									MessageGroupsList: *[...{
										Message: *{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										} | fn.#If
										Variations?: *[...{
											CustomPayload?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											ImageResponseCard?: *{
												Buttons?: *[...{
													Text:  *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
													Value: *(strings.MinRunes(1) & strings.MaxRunes(50)) | fn.#Fn
												}] | fn.#If
												ImageUrl?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Subtitle?: *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
												Title:     *(strings.MinRunes(1) & strings.MaxRunes(250)) | fn.#Fn
											} | fn.#If
											PlainTextMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
											SSMLMessage?: *{
												Value: *(strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.#Fn
											} | fn.#If
										}] | fn.#If
									}] | fn.#If
								} | fn.#If
							} | fn.#If
						} | fn.#If
					}] | fn.#If
				}] | fn.#If
				LocaleId:               *string | fn.#Fn
				NluConfidenceThreshold: *number | fn.#Fn
				SlotTypes?:             *[...{
					Description?:           *string | fn.#Fn
					ExternalSourceSetting?: *{
						GrammarSlotTypeSetting?: *{
							Source?: *{
								KmsKeyArn?:   *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:[\w\-]+:kms:[\w\-]+:[\d]{12}:(?:key\/[\w\-]+|alias\/[a-zA-Z0-9:\/_\-]{1,256})$"#)) | fn.#Fn
								S3BucketName: *(strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"^[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]$"#)) | fn.#Fn
								S3ObjectKey:  *(strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"[\.\-\!\*\_\'\(\)a-zA-Z0-9][\.\-\!\*\_\'\(\)\/a-zA-Z0-9]*$"#)) | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Name:                     *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
					ParentSlotTypeSignature?: *string | fn.#Fn
					SlotTypeValues?:          *[...{
						SampleValue: *{
							Value: *(strings.MinRunes(1) & strings.MaxRunes(140)) | fn.#Fn
						} | fn.#If
						Synonyms?: *[...{
							Value: *(strings.MinRunes(1) & strings.MaxRunes(140)) | fn.#Fn
						}] | fn.#If
					}] | fn.#If
					ValueSelectionSetting?: *{
						AdvancedRecognitionSetting?: *{
							AudioRecognitionStrategy?: *("UseSlotValuesAsCustomVocabulary") | fn.#Fn
						} | fn.#If
						RegexFilter?: *{
							Pattern: *(strings.MinRunes(1) & strings.MaxRunes(300)) | fn.#Fn
						} | fn.#If
						ResolutionStrategy: *("ORIGINAL_VALUE" | "TOP_RESOLUTION") | fn.#Fn
					} | fn.#If
				}] | fn.#If
				VoiceSettings?: *{
					Engine?: *("standard" | "neural") | fn.#Fn
					VoiceId: *string | fn.#Fn
				} | fn.#If
			}] | fn.#If
			BotTags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			DataPrivacy: *{
				[string]: _
			} | fn.#Fn
			Description?:            *string | fn.#Fn
			IdleSessionTTLInSeconds: *(>=60 & <=86400) | fn.#Fn
			Name:                    *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
			RoleArn:                 *(strings.MinRunes(32) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-zA-Z-]*:iam::[0-9]{12}:role/.*$"#)) | fn.#Fn
			TestBotAliasSettings?:   *{
				BotAliasLocaleSettings?: *[...{
					BotAliasLocaleSetting: *{
						CodeHookSpecification?: *{
							LambdaCodeHook: *{
								CodeHookInterfaceVersion: *(strings.MinRunes(1) & strings.MaxRunes(5)) | fn.#Fn
								LambdaArn:                *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
							} | fn.#If
						} | fn.#If
						Enabled: *bool | fn.#Fn
					} | fn.#If
					LocaleId: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
				}] | fn.#If
				ConversationLogSettings?: *{
					AudioLogSettings?: *[...{
						Destination: *{
							S3Bucket: *{
								KmsKeyArn?:  *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:[\w\-]+:kms:[\w\-]+:[\d]{12}:(?:key\/[\w\-]+|alias\/[a-zA-Z0-9:\/_\-]{1,256})$"#)) | fn.#Fn
								LogPrefix:   *string | fn.#Fn
								S3BucketArn: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:[\w\-]+:s3:::[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]$"#)) | fn.#Fn
							} | fn.#If
						} | fn.#If
						Enabled: *bool | fn.#Fn
					}] | fn.#If
					TextLogSettings?: *[...{
						Destination: *{
							CloudWatch: *{
								CloudWatchLogGroupArn: *(strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.#Fn
								LogPrefix:             *string | fn.#Fn
							} | fn.#If
						} | fn.#If
						Enabled: *bool | fn.#Fn
					}] | fn.#If
				} | fn.#If
				Description?:               *string | fn.#Fn
				SentimentAnalysisSettings?: *{
					[string]: _
				} | fn.#Fn
			} | fn.#If
			TestBotAliasTags?: *[...{
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
	#BotAlias: {
		Type: "AWS::Lex::BotAlias"
		Properties: {
			BotAliasLocaleSettings?: *[...{
				BotAliasLocaleSetting: *{
					CodeHookSpecification?: *{
						LambdaCodeHook: *{
							CodeHookInterfaceVersion: *(strings.MinRunes(1) & strings.MaxRunes(5)) | fn.#Fn
							LambdaArn:                *(strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.#Fn
						} | fn.#If
					} | fn.#If
					Enabled: *bool | fn.#Fn
				} | fn.#If
				LocaleId: *(strings.MinRunes(1) & strings.MaxRunes(128)) | fn.#Fn
			}] | fn.#If
			BotAliasName:  *(strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^([0-9a-zA-Z][_-]?)+$"#)) | fn.#Fn
			BotAliasTags?: *[...{
				Key:   *string | fn.#Fn
				Value: *string | fn.#Fn
			}] | fn.#If
			BotId:                    *(strings.MinRunes(10) & strings.MaxRunes(10) & (=~#"^[0-9a-zA-Z]+$"#)) | fn.#Fn
			BotVersion?:              *(strings.MinRunes(1) & strings.MaxRunes(5) & (=~#"^(DRAFT|[0-9]+)$"#)) | fn.#Fn
			ConversationLogSettings?: *{
				AudioLogSettings?: *[...{
					Destination: *{
						S3Bucket: *{
							KmsKeyArn?:  *(strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:[\w\-]+:kms:[\w\-]+:[\d]{12}:(?:key\/[\w\-]+|alias\/[a-zA-Z0-9:\/_\-]{1,256})$"#)) | fn.#Fn
							LogPrefix:   *string | fn.#Fn
							S3BucketArn: *(strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^arn:[\w\-]+:s3:::[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]$"#)) | fn.#Fn
						} | fn.#If
					} | fn.#If
					Enabled: *bool | fn.#Fn
				}] | fn.#If
				TextLogSettings?: *[...{
					Destination: *{
						CloudWatch: *{
							CloudWatchLogGroupArn: *(strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.#Fn
							LogPrefix:             *string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Enabled: *bool | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Description?:               *string | fn.#Fn
			SentimentAnalysisSettings?: *{
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#BotVersion: {
		Type: "AWS::Lex::BotVersion"
		Properties: {
			BotId:                         *(strings.MinRunes(10) & strings.MaxRunes(10) & (=~#"^[0-9a-zA-Z]+$"#)) | fn.#Fn
			BotVersionLocaleSpecification: *[...{
				BotVersionLocaleDetails: *{
					SourceBotVersion: *(strings.MinRunes(1) & strings.MaxRunes(5) & (=~#"^(DRAFT|[0-9]+)$"#)) | fn.#Fn
				} | fn.#If
				LocaleId: *string | fn.#Fn
			}] | fn.#If
			Description?: *string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourcePolicy: {
		Type: "AWS::Lex::ResourcePolicy"
		Properties: {
			Policy:      *{} | fn.#If
			ResourceArn: *(strings.MinRunes(1) & strings.MaxRunes(1011)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
