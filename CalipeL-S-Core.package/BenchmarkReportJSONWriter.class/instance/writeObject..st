writing
writeObject: anObject
	"Objects are written as dictionaries instvarname -> instvar value"

	| instvars |

	instvars := anObject class allInstVarNames.
	stream nextPut: ${.
	indent := indent + 1.
	instvars withIndexDo:[:nm :i|
		self writeKey: nm value: (anObject instVarAt: i).        
		i ~~ instvars size ifTrue:[
			self writeElementSeparator.
		]
	].
	indent := indent - 1.
	stream nextPut: $}

	"Modified: / 12-06-2013 / 13:59:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"