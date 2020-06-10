public
getUserData

	| url response |
	
	url := (WAUrl absolute: 'https://www.googleapis.com/oauth2/v1/userinfo')
		addField: 'access_token' value: self accessToken;
		yourself.

	response := WebClient httpGet: url printString.
	
	^ WebUtils jsonDecode: response content readStream