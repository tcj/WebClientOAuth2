instance creation
newFromFileNamed: aString
	^ self basicNew
		filename: aString;
		initialize;
		yourself