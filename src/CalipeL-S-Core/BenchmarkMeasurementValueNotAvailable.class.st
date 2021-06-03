Class {
	#name : #BenchmarkMeasurementValueNotAvailable,
	#superclass : #Object,
	#classVars : [
		'Instance'
	],
	#category : #'CalipeL-S-Core-Measurement'
}

{ #category : #'instance creation' }
BenchmarkMeasurementValueNotAvailable class >> flushSingleton [
	"flushes the cached singleton"

	Instance := nil

	"
	 self flushSingleton
	"
]

{ #category : #'instance creation' }
BenchmarkMeasurementValueNotAvailable class >> instance [
	"returns a singleton"

	Instance isNil ifTrue:[
		Instance := self basicNew initialize.
	].
	^ Instance.

	"Created: / 01-12-2014 / 02:53:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkMeasurementValueNotAvailable class >> new [
	"returns a singleton"

	^ self instance.

	"Modified: / 01-12-2014 / 02:53:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
