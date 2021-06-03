Class {
	#name : #BenchmarkFullGarbageCollectCountInstrument,
	#superclass : #BenchmarkCountingInstrument,
	#category : #'CalipeL-S-Pharo'
}

{ #category : #'private ' }
BenchmarkFullGarbageCollectCountInstrument >> getCounterValue [
	^Smalltalk vm fullGCCount 
]

{ #category : #accessing }
BenchmarkFullGarbageCollectCountInstrument >> measurementInstrumentName [
	^ '# of full GCs'
]

{ #category : #measurement }
BenchmarkFullGarbageCollectCountInstrument >> measurementStart:aBenchmarkInstance [
	Smalltalk garbageCollect.
	^ super measurementStart:aBenchmarkInstance
]
