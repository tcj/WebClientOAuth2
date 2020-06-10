actions
gotoSignOn: aCallbackUrl
	"Redirect to the Google signon webpage."
	| state |
	oauthSession := (WCOAuth2Session google: self oauthConsumerData)
		yourself.
		
	state := String streamContents: [ :stream |
		stream 
			nextPutAll: aCallbackUrl pathStringUnencoded ;
			nextPut: $? ;
			nextPutAll: aCallbackUrl queryString ].

	self requestContext
		redirectTo: (oauthSession authenticationUrlWithState: state) ;
		respond.

	"code will never reach here"
