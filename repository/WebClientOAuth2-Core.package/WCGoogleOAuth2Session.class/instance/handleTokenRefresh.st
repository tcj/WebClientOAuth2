public
handleTokenRefresh
	| response tokenData |
	
	response  := WebClient 
		htmlSubmit: 'https://accounts.google.com/o/oauth2/token'
		fields: {
			'client_id' -> self consumerData key.
			'client_secret' -> self consumerData secret.
			'grant_type' -> 'refresh_token'.
			'refresh_token' -> self refreshToken.
		} method: 'POST'
		encoding: 'application/x-www-form-urlencoded'.

	tokenData := WebUtils jsonDecode: response content readStream.
	(tokenData includesKey: 'error')
		ifTrue: [ Error signal: (tokenData at: 'error') asString ].

	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type'.
