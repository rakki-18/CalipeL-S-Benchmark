Class {
	#name : #BenchmarkExecutionFailure,
	#superclass : #Error,
	#category : #'CalipeL-S-Core-Runner'
}

{ #category : #queries }
BenchmarkExecutionFailure class >> mayProceed [
	^ true

	"Created: / 22-10-2015 / 15:04:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkExecutionFailure >> isResumable [
	^ true

	"Created: / 22-10-2015 / 15:04:01 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'Compatibility-Squeak' }
BenchmarkExecutionFailure >> signal: aString [

	Smalltalk isSmalltalkX ifTrue:[ 
		^ self raiseRequestErrorString:aString in: thisContext sender.
	].
	^ super signal: aString

	"Created: / 22-10-2015 / 15:14:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
