Class {
	#name : #BenchmarkExamplesInstrument,
	#superclass : #Object,
	#instVars : [
		't0',
		't1'
	],
	#category : #'CalipeL-S-Core-Examples'
}

{ #category : #documentation }
BenchmarkExamplesInstrument class >> documentation [
"
	This class is an example of a custom measurement instrument.
	It does measure execution time in seconds.

	Note, that instrument measuring time execution time is
	included in Calipel by default, this class is merely an 
	example.

	Note, that the value measured by this instrument will differ
	from the value measured by built-in time measurement since
	the measurement not performent at the same time. So for short
	benchmarks like those in BenchmarkExamples the difference will be
	significant.

	To run BenchmarkExamples with this instrument on, execute:

		| suite executor |
		suite := BenchmarkSuite class: BenchmarkExamples.
		executor := BenchmarkExecutor new.
		executor instruments: { BenchmarkExamplesInstrument new }.
		suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	For more detailed description of measurement instruments
	see https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		BenchmarkExecutionTimeInstrument
		https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md


"
]

{ #category : #accessing }
BenchmarkExamplesInstrument >> measurementInstrumentName [
	"Returns a human-readable name of this instrument"
	
	^ 'Example Time'

	"Created: / 01-12-2014 / 02:36:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 08:05:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkExamplesInstrument >> measurementStart:aBenchmarkInstance [ 
	"superclass BenchmarkMeasurementInstrument says that I am responsible to implement this method"
	
	t0 := BenchmarkPlatform current millisecondTime

	"Created: / 24-11-2014 / 08:49:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 08:18:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkExamplesInstrument >> measurementStop:aBenchmarkInstance [ 
	t1 := BenchmarkPlatform current millisecondTime

	"Created: / 24-11-2014 / 08:49:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 08:18:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkExamplesInstrument >> measurementUnit [
	"Return a string describing a unit of this instrument, i.e., msecs
	 for time or '1' for plain counters"
	
	^ 's'

	"Created: / 24-11-2014 / 23:47:55 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 08:05:51 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkExamplesInstrument >> measurementValue [
	^ ((t1 - t0) / 1000) asFloat

	"Created: / 24-11-2014 / 08:49:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 08:18:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
