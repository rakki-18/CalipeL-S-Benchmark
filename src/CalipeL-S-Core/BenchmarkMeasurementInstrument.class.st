Class {
	#name : #BenchmarkMeasurementInstrument,
	#superclass : #Object,
	#category : #'CalipeL-S-Core-Measurement'
}

{ #category : #documentation }
BenchmarkMeasurementInstrument class >> documentation [
"
	Measurement instrument provides a way to measure a particular
	aspect (time, number og GCs, invocations of some method...).

	One may create a custom instruments and hook them in to measure
	custom, application specific aspects.

	To run BenchmarkExamples with this instrument on, execute following:

		| suite executor |

		suite := BenchmarkSuite class: BenchmarkExamples.
		executor := BenchmarkExecutor new.
		executor instruments: { BenchmarkMeasurementInstrument new }.
		suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	For more detailed description of measurement instruments
	see https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		BenchmarkExamplesInstrument
		https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md
																	 

"
]

{ #category : #testing }
BenchmarkMeasurementInstrument class >> isExecuttionTimeInstrument: instrument [
	^ (instrument respondsTo:#isExecutionTimeInstrument) and:[instrument isExecutionTimeInstrument]

	"Created: / 02-12-2014 / 23:26:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkMeasurementInstrument class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #testing }
BenchmarkMeasurementInstrument >> isExecutionTimeInstrument [
	^ false

	"Created: / 24-11-2014 / 07:15:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMeasurementInstrument >> measurementInstrumentName [
	"Returns a human-readable name of this instrument"
	
	^ self subclassResponsibility

	"Created: / 01-12-2014 / 02:35:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkMeasurementInstrument >> measurementStart:aBenchmarkInstance [ 
	^ self subclassResponsibility

	"Created: / 24-11-2014 / 08:14:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:44:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkMeasurementInstrument >> measurementStop:aBenchmarkInstance [ 
	^ self subclassResponsibility

	"Created: / 24-11-2014 / 08:14:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:44:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMeasurementInstrument >> measurementUnit [
	"Return a string describing a unit of this instrument, i.e., msecs
	 for time or '1' for plain counters"
	
	^ self subclassResponsibility

	"Created: / 24-11-2014 / 23:47:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkMeasurementInstrument >> measurementValue [
	^ self subclassResponsibility

	"Created: / 24-11-2014 / 08:14:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
