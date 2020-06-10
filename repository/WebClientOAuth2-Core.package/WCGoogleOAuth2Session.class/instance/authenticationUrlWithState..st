unused
authenticationUrlWithState: aStateString

	| authUrl |

	authUrl := (WAUrl absolute: 'https://accounts.google.com/o/oauth2/auth')
		addField: 'response_type' value: 'code' ;
		addField: 'client_id' value: self consumerData key ;
		addField: 'redirect_uri' value: self redirectUrl ;
		addField: 'scope' value: self scopeParameter ;
		addField: 'state' value: aStateString ;
		addField: 'access_type' value: self accessType ;
		yourself.

	self isForceApprovalPrompt
		ifTrue: [ authUrl addField: 'approval_prompt' value: 'force' ].
		
	^authUrl