Class {
	#name : #BenchmarkTestsSuiteA,
	#superclass : #Object,
	#instVars : [
		'msecs'
	],
	#category : #'CalipeL-S-Tests-Data'
}

{ #category : #documentation }
BenchmarkTestsSuiteA class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarks }
BenchmarkTestsSuiteA >> benchmark1 [
	<benchmark>

	(Delay forMilliseconds: 100) wait.

	"Created: / 18-07-2013 / 02:24:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkTestsSuiteA >> benchmark2 [
	<benchmark: 'Benchmark 2'>

	(Delay forMilliseconds: msecs) wait.

	"Created: / 18-07-2013 / 02:24:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkTestsSuiteA >> msecs [
	^ msecs
]

{ #category : #accessing }
BenchmarkTestsSuiteA >> msecs:anInteger [
	<parameter: #msecs type: #Integer default: 200>
	
	msecs := anInteger.

	"Modified: / 19-07-2013 / 21:43:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
