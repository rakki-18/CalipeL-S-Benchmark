Class {
	#name : #BenchmarkParameter,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'default',
		'values'
	],
	#classVars : [
		'UndefinedValue'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #initialization }
BenchmarkParameter class >> initialize [
	"Invoked at system start or when the class is dynamically loaded."

	UndefinedValue := Object new.

	"Modified: / 30-07-2013 / 23:31:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 01-08-2013 / 18:39:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkParameter class >> name:nameArg type:typeArg default:defaultArg values:valuesArg [
	^ self new name:nameArg type:typeArg default:defaultArg values:valuesArg
]

{ #category : #accessing }
BenchmarkParameter class >> undefinedValue [
	^ UndefinedValue

	"Created: / 30-07-2013 / 23:31:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkParameter class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkParameter >> default [
	^ default
]

{ #category : #accessing }
BenchmarkParameter >> default:anObject [
	default := anObject.
]

{ #category : #accessing }
BenchmarkParameter >> getter [
	^ self name

	"Created: / 27-07-2013 / 11:32:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkParameter >> name [
	^ name
]

{ #category : #accessing }
BenchmarkParameter >> name:aString [
	name := aString.
]

{ #category : #accessing }
BenchmarkParameter >> name:nameArg type:typeArg default:defaultArg values:valuesArg [ 
	name := nameArg.
	type := typeArg.
	default := defaultArg.
	values := valuesArg.
]

{ #category : #'printing & storing' }
BenchmarkParameter >> printOn:aStream [
	"append a printed representation if the receiver to the argument, aStream"

	name printOn: aStream.
	aStream nextPutAll:' ['.
	type printOn: aStream.
	aStream nextPutAll:']'.

	"Modified: / 01-08-2013 / 18:52:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'get / set' }
BenchmarkParameter >> set: value in: instance [
	| setter |

	values notNil ifTrue:[
		(values includes: value) ifFalse:[
			"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
			BenchmarkParameterError new signal:'Invalid parameter value for ', name , ' (' , value storeString ,')'.
		].
	].
	setter := self setter.
	(instance respondsTo: setter) ifFalse:[
		BenchmarkParameterError new signal:'Cannot set parameter ', name , ' (' ,instance class name , ' does not respond to ', setter storeString , ')'.
	].
	[
		instance perform: setter with: value
	] on: Error do:[:ex|
		BenchmarkParameterError new signal:'Cannot set parameter ', name , ' (', ex description , ')'
	]

	"Created: / 27-07-2013 / 11:43:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkParameter >> setter [
	^ (self name , ':') asSymbol

	"Created: / 27-07-2013 / 11:32:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkParameter >> type [
	^ type
]

{ #category : #accessing }
BenchmarkParameter >> type:aClass [
	type := aClass.
]

{ #category : #accessing }
BenchmarkParameter >> values [
	^ values
]

{ #category : #accessing }
BenchmarkParameter >> values:anArray [
	values := anArray.
]
