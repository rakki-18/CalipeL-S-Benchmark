private-parsing
parseToken: stream
	^ String streamContents:[:s|
		[ stream atEnd or:[stream peek isSeparator] ] whileFalse:[ 
			s nextPut: stream next.
		].
	].

	"Created: / 08-03-2014 / 11:18:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 15:36:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"