private-parsing
parseArgument:stream 
	| c |

	[
		c := stream peek.
		c == $#
	] whileTrue:[
		self parseComment:stream.
		stream skipSeparators.
		stream atEnd ifTrue:[ ^ nil ].
	].
	c == $\ ifTrue:[
		stream next.
		[
			stream peek == Character space or:[ stream peek == Character tab ]
		] whileTrue:[ stream next. ].
		stream peek == Character cr ifTrue:[
			stream skipSeparators.
			^ self parseArgument:stream.
		] ifFalse:[ ^ '\' ].
	].
	c == $" ifTrue:[
		^ self parseQuoted1:stream
	].
	c == $' ifTrue:[
		^ self parseQuoted2:stream
	].
	^ self parseToken:stream

	"Created: / 08-03-2014 / 11:01:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 15:59:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"