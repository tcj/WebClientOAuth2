public
handleAuthenticationCallback: aParameterDictionary 

	| response code tokenData |
	code := aParameterDictionary at: 'code' ifAbsent: [ ^nil ].

	response := WebClient 
		htmlSubmit: 'https://accounts.google.com/o/oauth2/token'
		fields: { 
			'code' -> code.
			'client_id' -> self consumerData key.
			'client_secret' -> self consumerData secret.
			'redirect_uri' -> self redirectUrl.
			'grant_type' -> 'authorization_code'.
		} method: 'POST'
		encoding: 'application/x-www-form-urlencoded'.

	tokenData := WebUtils jsonDecode: response content readStream.
	(tokenData includesKey: 'error')
		ifTrue: [Error signal: (tokenData at: 'error_description')].
		
	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type'.
	(tokenData includesKey: 'refresh_token')
		ifTrue: [ refreshToken := tokenData at: 'refresh_token' ].
