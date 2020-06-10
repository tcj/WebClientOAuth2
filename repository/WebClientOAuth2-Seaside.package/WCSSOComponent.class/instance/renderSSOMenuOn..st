rendering
renderSSOMenuOn: html

	self session isLoggedIn 
		ifTrue: [ 
			html anchor
				callback: [ self logout] ;
				with: 'Logout' ].		
