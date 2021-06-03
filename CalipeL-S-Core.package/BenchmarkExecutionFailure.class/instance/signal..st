Compatibility-Squeak
signal: aString

	Smalltalk isSmalltalkX ifTrue:[ 
		^ self raiseRequestErrorString:aString in: thisContext sender.
	].
	^ super signal: aString

	"Created: / 22-10-2015 / 15:14:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"