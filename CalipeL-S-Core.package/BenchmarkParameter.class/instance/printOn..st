printing & storing
printOn:aStream
	"append a printed representation if the receiver to the argument, aStream"

	name printOn: aStream.
	aStream nextPutAll:' ['.
	type printOn: aStream.
	aStream nextPutAll:']'.

	"Modified: / 01-08-2013 / 18:52:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"