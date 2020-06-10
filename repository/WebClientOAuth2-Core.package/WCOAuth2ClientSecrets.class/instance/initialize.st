initialize-release
initialize
	| stream |
	super initialize.
	stream := FileStream oldFileNamed: self filename.
	[ secrets := (WebUtils jsonDecode: stream) at: 'web' ] ensure: [ stream close ].