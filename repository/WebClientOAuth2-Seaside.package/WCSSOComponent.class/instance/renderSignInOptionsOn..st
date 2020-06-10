rendering
renderSignInOptionsOn: html
	| callback url |
	callback := WAActionCallback on: [ self handleCallback ] .
	url := html actionUrl copy addField: (html callbacks store: callback).
	url takeServerParametersFromRequest: self requestContext request.

	self renderOAuth2Providers: url on: html.
"	html space.
	html text: '/'.
	html space.
"
	html horizontalRule
		style: 'clear: both;' 

	