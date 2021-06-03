initialization
initializeTimestampIfNotAlready
	timestamp isNil ifTrue:[
		self initializeTimestamp
	]

	"Created: / 23-06-2013 / 00:39:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"