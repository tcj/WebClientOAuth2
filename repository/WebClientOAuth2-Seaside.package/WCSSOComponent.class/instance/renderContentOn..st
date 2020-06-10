rendering
renderContentOn: html	
	html div
		style: 'clear: both; ' ;
		with: [
			self session isLoggedIn
				ifTrue: [ 
					html paragraph: 'logged in'. 
					"html paragraph: self session user emailAddress."
					html anchor
						callback: [ self answer: #logout ] ;
						with: 'Logout' ]
				ifFalse: [
					self renderSignInOptionsOn: html ] ]