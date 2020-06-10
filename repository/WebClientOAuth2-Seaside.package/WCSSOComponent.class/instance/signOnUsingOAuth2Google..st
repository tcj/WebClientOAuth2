rendering
signOnUsingOAuth2Google: aCallbackUrl
	
	self responsePanel: WCSSOGoogleOAuth2Panel new.
	self responsePanel gotoSignOn: aCallbackUrl.
	self answer: #loggedIn.