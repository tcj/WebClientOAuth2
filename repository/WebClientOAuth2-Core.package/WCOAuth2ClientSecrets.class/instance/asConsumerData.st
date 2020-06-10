converting
asConsumerData
	^ WCOAuth2ConsumerData
		key: self clientId
		secret: self clientSecret
		redirectUrl: self firstRedirectUri