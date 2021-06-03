Class {
	#name : #BenchmarkCountingInstrument,
	#superclass : #BenchmarkMeasurementInstrument,
	#instVars : [
		'c0',
		'c1'
	],
	#category : #'CalipeL-S-Core-Measurement'
}

{ #category : #queries }
BenchmarkCountingInstrument class >> isAbstract [
	"Return if this class is an abstract class.
	 True is returned here for myself only; false for subclasses.
	 Abstract subclasses must redefine again."

	^ self == BenchmarkCountingInstrument.
]

{ #category : #documentation }
BenchmarkCountingInstrument class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #private }
BenchmarkCountingInstrument >> getCounterValue [
	^ self subclassResponsibility

	"Created: / 27-11-2014 / 12:42:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkCountingInstrument >> measurementStart:aBenchmarkInstance [ 
	"superclass BenchmarkMeasurementInstrument says that I am responsible to implement this method"
	
	^ c0 := self getCounterValue

	"Created: / 27-11-2014 / 12:41:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:44:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkCountingInstrument >> measurementStop:aBenchmarkInstance [ 
	"superclass BenchmarkMeasurementInstrument says that I am responsible to implement this method"
	
	^ c1 := self getCounterValue

	"Created: / 27-11-2014 / 12:41:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:44:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkCountingInstrument >> measurementUnit [
	"Return a string describing a unit of this instrument, i.e., msecs
	 for time or '1' for plain counters"
	
	^ '1'

	"Created: / 27-11-2014 / 12:39:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkCountingInstrument >> measurementValue [
	"superclass BenchmarkMeasurementInstrument says that I am responsible to implement this method"

	^ c1 - c0

	"Created: / 27-11-2014 / 12:40:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
