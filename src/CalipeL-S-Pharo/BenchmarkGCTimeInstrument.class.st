Class {
	#name : #BenchmarkGCTimeInstrument,
	#superclass : #BenchmarkMeasurementInstrument,
	#instVars : [
		't0',
		't1'
	],
	#classVars : [
		'MillisecondsTime'
	],
	#category : #'CalipeL-S-Pharo'
}

{ #category : #testing }
BenchmarkGCTimeInstrument >> isRealTimeInstrument [
	^true
]

{ #category : #accessing }
BenchmarkGCTimeInstrument >> measurementInstrumentName [
	"Returns a human-readable name of this instrument"
	
	^ 'GC Time'

	"Created: / 01-12-2014 / 02:36:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkGCTimeInstrument >> measurementStart:aBenchmarkInstance [ 
	"superclass BenchmarkMeasurementInstrument says that I am responsible to implement this method"
	
	t0 := Smalltalk vm totalGCTime

	"Created: / 24-11-2014 / 08:49:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 12:09:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:44:56 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkGCTimeInstrument >> measurementStop:aBenchmarkInstance [ 
	t1 := Smalltalk vm totalGCTime

	"Created: / 24-11-2014 / 08:49:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 12:09:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 01-12-2014 / 02:45:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkGCTimeInstrument >> measurementUnit [
	"Return a string describing a unit of this instrument, i.e., msecs
	 for time or '1' for plain counters"
	
	^ 'ms'

	"Created: / 24-11-2014 / 23:47:55 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 25-11-2014 / 01:09:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #measurement }
BenchmarkGCTimeInstrument >> measurementValue [
	^ t1 - t0

	"Created: / 24-11-2014 / 08:49:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 22-10-2015 / 08:07:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
