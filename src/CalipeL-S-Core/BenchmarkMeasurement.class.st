Class {
	#name : #BenchmarkMeasurement,
	#superclass : #Object,
	#instVars : [
		'value',
		'instrument'
	],
	#category : #'CalipeL-S-Core-Measurement'
}

{ #category : #documentation }
BenchmarkMeasurement class >> documentation [
"
	BenchmarkMeasurement is a simple value object that keeps a value
	measured by some intrument

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		BenchmarkMeasurementInstrument

"
]

{ #category : #'instance creation' }
BenchmarkMeasurement class >> instrument: instrumentArg value: valueArg [
	^ self new instrument: instrumentArg value: valueArg

	"Created: / 24-11-2014 / 07:15:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMeasurement >> instrument [
	^ instrument
]

{ #category : #initialization }
BenchmarkMeasurement >> instrument: instrumentArg value: valueArg [
	instrument := instrumentArg.
	value := valueArg

	"Created: / 24-11-2014 / 07:06:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMeasurement >> value [
	^ value
]
