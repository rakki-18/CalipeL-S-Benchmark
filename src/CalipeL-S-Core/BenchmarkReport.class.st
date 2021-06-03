Class {
	#name : #BenchmarkReport,
	#superclass : #Object,
	#instVars : [
		'stream',
		'result',
		'name',
		'description'
	],
	#category : #'CalipeL-S-Core-Reports'
}

{ #category : #testing }
BenchmarkReport class >> isAbstract [
	^self == BenchmarkReport

	"Created: / 28-05-2013 / 00:32:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkReport class >> json [
	^BenchmarkReportJSON new

	"Created: / 12-06-2013 / 14:13:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkReport class >> text [
	^BenchmarkReportText new

	"Created: / 28-05-2013 / 00:59:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 28-05-2013 / 11:03:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkReport class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkReport class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]

{ #category : #accessing }
BenchmarkReport >> description [
	^ description notNil ifTrue:[description] ifFalse:['Default'].

	"Modified: / 19-09-2013 / 22:45:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkReport >> description:aString [
	description := aString.
]

{ #category : #accessing }
BenchmarkReport >> name [
	^ name notNil ifTrue:[name] ifFalse:['default']

	"Modified: / 19-09-2013 / 23:29:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkReport >> name:aString [
	name := aString.
]

{ #category : #accessing }
BenchmarkReport >> result [
	^ result
]

{ #category : #accessing }
BenchmarkReport >> result:something [
	result := something.
]

{ #category : #accessing }
BenchmarkReport >> stream [
	^ stream
]

{ #category : #accessing }
BenchmarkReport >> stream:something [
	stream := something.
]

{ #category : #writing }
BenchmarkReport >> write [
	self 
		writeHeader;
		writeOutcomes;
		writeFooter.

	"Created: / 28-05-2013 / 00:34:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 11-06-2013 / 23:26:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReport >> write: aBenchmarkResult on: aStream [
	self stream: aStream.
	self result: aBenchmarkResult.
	self write.

	"Created: / 28-05-2013 / 00:33:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReport >> writeFooter [
	self subclassResponsibility

	"Created: / 11-06-2013 / 23:26:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReport >> writeHeader [
	self subclassResponsibility

	"Created: / 11-06-2013 / 23:26:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReport >> writeOutcome:arg [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #writing }
BenchmarkReport >> writeOutcomes [
	result outcomesDo:[:outcome | self writeOutcome: outcome ].

	"Created: / 11-06-2013 / 23:26:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
