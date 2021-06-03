private-parsing
parseQuoted2:stream
	"Parse string quoted by $'" 
	stream next. "/ eat $'"
	^ String streamContents:[:s|
		[ stream peek == $'] whileFalse:[ 
			stream atEnd ifTrue:[ 
				self error:'Unterminated string'.
			].
			s nextPut: stream next.
		].
		stream next. "/ eat $'" 
	].

	"Created: / 08-03-2014 / 11:18:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 15:44:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"