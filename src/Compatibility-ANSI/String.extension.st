Extension { #name : #String }

{ #category : #'*Compatibility-ANSI' }
String >> subStrings: separators [ 
	"Answer an array containing the substrings in the receiver separated by the elements of
    separators.

	 Errors: If the list of separators contains anything other than characters.
	"
	<ansi: '5.7.10.15'>
	
	^self substrings: separators 
]
