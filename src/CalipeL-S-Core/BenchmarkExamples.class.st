Class {
	#name : #BenchmarkExamples,
	#superclass : #Object,
	#instVars : [
		'sortblock',
		'sortdata'
	],
	#category : #'CalipeL-S-Core-Examples'
}

{ #category : #documentation }
BenchmarkExamples class >> documentation [
"
	This class provides some examples how to use
	Calipel/S. 

	See https://bitbucket.org/janvrany/jv-calipel/wiki/Writing.md
	and https://bitbucket.org/janvrany/jv-calipel/wiki/Running.md

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		https://bitbucket.org/janvrany/jv-calipel/wiki/Writing.md
		https://bitbucket.org/janvrany/jv-calipel/wiki/Running.md

"
]

{ #category : #'examples - 01' }
BenchmarkExamples >> example01 [
	"A very simple benchmark for factorial.

	 Benchmark is simply any method in any class which is annotated by
	 `<benchmark>` or `<benchmark: 'Nice name'>` annotation:
	"
	<benchmark: 'Example 01 - Factorial'>

	10000 timesRepeat:[ 100 factorial ].

	"To run this benchmark from an image, inspect result of:

		(BenchmarkSuite class: BenchmarkExamples selector: #example01) run

	 The above expression will return an instance of BenchmarkResultC with 
	 all benchmark data.

	 To run the benchmark from a command line (which is prefered way
	 when measuring for real), execute (when using Smalltalk/X):

		 ./benchmark-runner.sh BenchmarkExamples#example01

	or (when using Pharo):

		./pharo PetitParser.image benchmark BenchmarkExamples#example01

	For more details about command line execution see
	https://bitbucket.org/janvrany/jv-calipel/wiki/Running.md
	"

	"Created: / 10-10-2015 / 09:49:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 02' }
BenchmarkExamples >> example02Setup [
	"By annotation a method with <setup>, the method
	 becomes a setup method for all benchmarks defined
	 in this class (and subclasses). If you want per-benchmark
	 setup method, annotate the method defining a benchmark
	 also with <setup: #specialSetupForThatBenchmark>."

	<setup>

	sortblock := [ :a :b | a > b ]

	"Created: / 10-10-2015 / 16:21:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 02' }
BenchmarkExamples >> example02SetupSortDataOrdered [
	"This is a per-benchmark setup method used by benchmark
	 #example02a. This is specified there by annotation
	 <setup:>, so no need to annotate the method specially
	 here. Naturally, per-benchmark setup method can be shared
	 among multiple benchmarks.
	"
	sortdata := (1000 to: 1 by: -1) asArray.

	"Created: / 10-10-2015 / 16:22:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 15-10-2015 / 15:59:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 02' }
BenchmarkExamples >> example02SetupSortDataRandom [
	"This is a per-benchmark setup method used by benchmark
	 #example02a. This is specified there by annotation
	 <setup:>, so no need to annotate the method specially
	 here. Naturally, per-benchmark setup method can be shared
	 among multiple benchmarks.
	"
	| random |

	random := Random new.
	random seed: 13.
	sortdata := (1 to: 1000) collect: [ :e | random nextInt: 1000 ].

	"Created: / 10-10-2015 / 16:19:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 15-10-2015 / 15:59:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 03' }
BenchmarkExamples >> example02Warmup [
	| data |

	data := sortdata copy.
	data sort: sortblock

	"Created: / 10-10-2015 / 18:23:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 02' }
BenchmarkExamples >> example02a [
	<benchmark: 'Sort (random)'>
	<setup: #example02SetupSortDataRandom>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example02a) run
	"

	"Created: / 10-10-2015 / 16:11:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 02' }
BenchmarkExamples >> example02b [
	<benchmark: 'Sort (ordered)'>
	<setup: #example02SetupSortDataOrdered>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example02b) run
	"

	"Created: / 10-10-2015 / 16:21:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'examples - 03' }
BenchmarkExamples >> example03 [
	<benchmark: 'Sort (with warmup)'>
	<setup: #example02SetupSortDataRandom>
	<warmup: #example02Warmup>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example03) run
	"

	"Created: / 10-10-2015 / 18:22:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
