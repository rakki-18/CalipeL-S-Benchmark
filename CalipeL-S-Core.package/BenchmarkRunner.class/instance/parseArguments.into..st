private-parsing
parseArguments: stream into: argv
	[ stream skipSeparators. stream atEnd ] whileFalse:[
		| arg |

		arg := (self parseArgument: stream).
		arg notNil ifTrue:[ argv add: arg ]
	].

	"Created: / 08-03-2014 / 10:59:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 15:59:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"