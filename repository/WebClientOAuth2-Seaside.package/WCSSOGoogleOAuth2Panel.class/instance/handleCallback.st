actions
handleCallback
	"This method is invoked when the SSO provider redirects back to this application." 
	[ oauthSession handleAuthenticationCallback: self requestContext request fields ]
		on: Error
		do: [ self inform: 'Received a bad response from Google.  Please try again.' ].
		
	userData := oauthSession getUserData.
	self session loginGoogleUser: userData.
	
	"code /will/ reach here"
