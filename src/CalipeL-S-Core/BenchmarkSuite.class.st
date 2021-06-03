Class {
	#name : #BenchmarkSuite,
	#superclass : #Object,
	#instVars : [
		'benchmarks'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #'instance creation' }
BenchmarkSuite class >> class: class [ 
	| suite current |

	suite := self new.
	current := class.
	[ current notNil ] whileTrue:[
		current selectorsAndMethodsDo:[:selector :method|
			(BenchmarkInstance isBenchmarkMethod: method) ifTrue:[
				suite addBenchmark: (BenchmarkInstance class:class selector:selector)
			].
		].
		current := current superclass.
	].
	^suite

	"Created: / 28-05-2013 / 19:49:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 01:51:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkSuite class >> class:class selector:benchmark [ 
	^ BenchmarkInstance class:class selector:benchmark

	"Created: / 28-05-2013 / 19:46:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkSuite class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkSuite class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkSuite class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]

{ #category : #'adding & removing' }
BenchmarkSuite >> addBenchmark: aBenchmarkInstanceOrBenchmarkSuite [
	benchmarks add: aBenchmarkInstanceOrBenchmarkSuite

	"Created: / 28-05-2013 / 19:48:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkSuite >> initialize [
	"Invoked when a new instance is created."

	benchmarks := Set new.

	"Modified: / 27-05-2013 / 18:57:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 31-05-2013 / 00:31:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkSuite >> isEmpty [
	"Return true, if this benchmark suite contains no benchmarks"

	benchmarks do:[:benchmark | benchmark isEmpty ifFalse:[ ^ false ] ].
	^ true

	"Created: / 30-09-2015 / 08:29:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkSuite >> isEmptyOrNil [
	^ self isEmpty

	"Created: / 30-09-2015 / 08:28:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkSuite >> notEmpty [
	"Return true, if this benchmark suite contains at least one benchmark"

	^ self isEmpty not

	"Created: / 30-09-2015 / 08:34:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkSuite >> notEmptyOrNil [
	^ self notEmpty

	"Created: / 30-09-2015 / 08:34:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkSuite >> run [
	"Run the suite, returning result"

	^self run: BenchmarkResultC new.

	"Created: / 27-05-2013 / 19:10:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkSuite >> run: aBenchmarkResult [
	"Run suite. Result is added to given benchmark result"

	^self run: aBenchmarkResult with: Dictionary new

	"Created: / 27-05-2013 / 19:10:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 28-05-2013 / 00:02:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 24-06-2013 / 01:09:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkSuite >> run: aBenchmarkResult with: aDictionary [
	^ self run: aBenchmarkResult with: aDictionary executor: BenchmarkExecutor new

	"Created: / 27-05-2013 / 22:18:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 26-07-2013 / 00:09:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkSuite >> run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor [
	benchmarks do:[:each|
		each run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor
	].
	^aBenchmarkResult

	"Created: / 26-07-2013 / 00:07:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:09:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
