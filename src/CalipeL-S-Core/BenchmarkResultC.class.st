Class {
	#name : #BenchmarkResultC,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'outcomes',
		'runs'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #'instance creation' }
BenchmarkResultC class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkResultC class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkResultC class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]

{ #category : #'adding & removing' }
BenchmarkResultC >> addOutcome: outcome [
	outcomes add: outcome

	"Created: / 25-07-2013 / 23:53:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkResultC >> initialize [
	"Invoked when a new instance is created."

	outcomes := OrderedCollection new.
	runs := 1.

	"Modified: / 04-06-2013 / 22:23:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkResultC >> initializeTimestamp [

	BenchmarkPlatform current isSmalltalkX ifTrue:[
		"Use Smalltalk at: to avoid reference to undeclared
		 global in Pharo (so Monticello won't complain)"
		timestamp := (Smalltalk at:#Timestamp) now.
		^self
	].
	BenchmarkPlatform current isPharo ifTrue:[
		"Use Smalltalk globals at: to avoid reference to undeclared
		 global in Smalltalk/X (so stc won't complain)"
		timestamp := (Smalltalk globals at: #DateAndTime) now.
		^self
	].
	self error: 'Unsupported platform'

	"Created: / 23-06-2013 / 00:39:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-09-2015 / 09:11:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkResultC >> initializeTimestampIfNotAlready [
	timestamp isNil ifTrue:[
		self initializeTimestamp
	]

	"Created: / 23-06-2013 / 00:39:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #inspecting }
BenchmarkResultC >> inspector2TabJSON [
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'JSON report';
		priority:50;
		text: [ String streamContents: [:s | BenchmarkReport json write: self on: s ] ];
		yourself

	"Modified: / 25-11-2014 / 01:07:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #inspecting }
BenchmarkResultC >> inspector2TabTEXT [
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'Text report';
		priority:51;
		text: [ String streamContents: [:s | BenchmarkReport text write: self on: s ] ];
		yourself

	"Created: / 25-11-2014 / 01:07:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkResultC >> outcomes [
	^ outcomes
]

{ #category : #accessing }
BenchmarkResultC >> outcomesDo: aBlock [
	"Iterate outcomes, perform given block.
	 outcomes are sorted by benchmark instance name first,
	 then by benchmark name"

	^self outcomesDo: aBlock separatedBy: nil

	"Created: / 11-06-2013 / 23:11:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkResultC >> outcomesDo: aBlock separatedBy: anotherBlock [
	"Iterate outcomes, perform given block.
	 outcomes are sorted by benchmark instance name first,
	 then by benchmark name"

	| classes classesOutcomes |
	classes := SortedCollection sortBlock:[:a :b|a name < b name].
	classesOutcomes := Dictionary new.
	outcomes do:[:each|
		(classes includes: each benchmark instance class) ifFalse:[
			classes add: each benchmark instance class.
		].
		(classesOutcomes at: each benchmark instance class ifAbsentPut:[SortedCollection sortBlock:[:a :b|a benchmark selector < b benchmark selector]])
			add: each.
	].
	classes 
		do:[:class|(classesOutcomes at: class) do: aBlock separatedBy: anotherBlock]
		separatedBy: anotherBlock

	"Created: / 11-06-2013 / 23:37:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'printing & storing' }
BenchmarkResultC >> printOn:aStream [
	"append a printed representation if the receiver to the argument, aStream"

	aStream nextPutAll: 'Benchmark resut:'; cr.
	BenchmarkReport text write: self on: aStream

	"Modified: / 31-05-2013 / 10:38:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkResultC >> runs [
	"Return how many times each benchmark is run." 

	^ runs

	"Modified (format): / 04-06-2013 / 22:25:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkResultC >> runs:anInteger [
	 "Sets how many times each benchmark is run." 

	runs := anInteger.

	"Modified (comment): / 04-06-2013 / 22:25:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkResultC >> timestamp [
	self initializeTimestampIfNotAlready.
	^ timestamp

	"Created: / 23-06-2013 / 00:54:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-09-2015 / 09:04:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
