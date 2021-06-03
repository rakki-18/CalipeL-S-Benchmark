initialization
initialize
	"Invoked when a new instance is created."

	super initialize.
	transcript := BenchmarkPlatform current stderr.
	(Smalltalk isSmalltalkX and:[Transcript isView]) ifTrue:[
		transcript := Transcript
	].

	"Created: / 24-06-2013 / 01:16:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"