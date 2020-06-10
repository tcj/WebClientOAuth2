instance creation
google: aConsumerData

	^ WCGoogleOAuth2Session new
		setConsumerData: aConsumerData ;
		yourself