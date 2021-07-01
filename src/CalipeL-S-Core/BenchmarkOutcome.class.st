Class {
	#name : #BenchmarkOutcome,
	#superclass : #Object,
	#instVars : [
		'measurements',
		'benchmark',
		'parameters',
		'spaceMeasurements'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #'instance creation' }
BenchmarkOutcome class >> benchmark: benchmark parameters: parameters measurements: measurements [
	^ self new benchmark: benchmark parameters: parameters measurements: measurements

	"Created: / 24-11-2014 / 06:56:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkOutcome class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkOutcome class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]

{ #category : #accessing }
BenchmarkOutcome >> benchmark [
	^ benchmark

	"Created: / 11-06-2013 / 23:19:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkOutcome >> benchmark: benchmarkArg parameters: parametersArg measurements: measurementsArg [ 
	benchmark := benchmarkArg.
	measurements := measurementsArg.
	parameters := parametersArg.

	"Created: / 24-11-2014 / 06:56:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkOutcome >> best [
	"Return the best run, i.e., run with minimal time"

	^ measurements inject: measurements anyOne into:[ :best :each |
		| bestTime eachTime |

		bestTime := best detect:[:m | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: m instrument ] ifNone:[ nil ].
		eachTime := best detect:[:m | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: m instrument ] ifNone:[ nil ].

		bestTime notNil ifTrue:[ 
			eachTime notNil ifTrue:[ 
				eachTime value < bestTime value ifTrue:[ each ] ifFalse:[ best ]
			] ifFalse:[
				best
			]
		] ifFalse:[ 
			eachTime notNil ifTrue:[ each ] ifFalse:[ best ]
		].
	].

	"Created: / 25-11-2014 / 01:18:25 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-12-2014 / 23:28:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkOutcome >> measurements [
	^ measurements
]

{ #category : #accessing }
BenchmarkOutcome >> parameters [
	^ parameters
]

{ #category : #accessing }
BenchmarkOutcome >> spaceMeasurements [
	^ spaceMeasurements 
]

{ #category : #initialization }
BenchmarkOutcome >> spaceMeasurements: anInteger [

	spaceMeasurements := anInteger.
]

{ #category : #accessing }
BenchmarkOutcome >> time [
	^ (self times select:[:t | t notNil]) min

	"Modified (format): / 25-11-2014 / 01:23:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkOutcome >> times [
	^ measurements collect:[ :run | 
		| timeMeasurement |

		timeMeasurement := run detect:[:each | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: each instrument ] ifNone:[ nil ].
		timeMeasurement value.
	]

	"Modified: / 02-12-2014 / 23:27:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
