Class {
	#name : #BenchmarkPerform,
	#superclass : #Object,
	#instVars : [
		'receivers',
		'selectors',
		'iterations',
		'nreceivers',
		'nselectors',
		'nargs',
		'recdistrib',
		'seldistrib',
		'recindices',
		'selindices',
		'hasPerformWith4',
		'hasPerformWith5',
		'hasPerformWith6'
	],
	#classVars : [
		'GeneratorGaussian',
		'GeneratorSequential',
		'GeneratorUniform',
		'Generators'
	],
	#category : #'CalipeL-S-Benchmarks-Micro'
}

{ #category : #documentation }
BenchmarkPerform class >> documentation [
"
	Simple benchmark to measure performance of Object>>perform:

	Run:

	(BenchmarkSuite class: BenchmarkPerform)
		run: BenchmarkResultC new
		with: (Dictionary new
				add: 'nreceivers' -> '10';
				add: 'nselectors' -> '10';
				add: 'recdistrib:' -> '#normal';
				add: 'seldistrib:' -> '#normal';
				yourself)


	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #initialization }
BenchmarkPerform class >> initialize [
	"Invoked at system start or when the class is dynamically loaded."

	| rng seq  |

	rng := Random new seed: 131.
	seq := 0.

	GeneratorSequential := [:upper | | v | v := seq. seq := seq + 1. (v \\ upper) + 1 ].
	GeneratorUniform := [:upper | rng nextInt: upper ].
	GeneratorGaussian := [:upper | 
		| nrng x1 x2 w y1 y2 v0 |

		nrng := [
			| v |
			y2 notNil ifTrue: [ 
				v := y2.
				y2 := nil.
			] ifFalse:[
				[
					x1 := (2.0 * rng next) - 1.0.
					x2 := (2.0 * rng next) - 1.0.
					w := x1 * x1 + (x2 * x2).
					w >= 1.0 
				] whileTrue.
				w := (-2.0 * w ln / w) sqrt.
				y1 := x1 * w.
				y2 := x2 * w.
				v :=  y1.
			].
			v
		].
		[ 
			v0 := (((nrng value) * (upper / 2.0 / 3.5"deviations")) +  (upper / 2.0)) truncated.
			v0 < 1 or:[v0 > upper ]
		] whileTrue.
		v0.
	].

	Generators := Dictionary new.
	Generators at: #sequential put: GeneratorSequential.
	Generators at: #uniform put: GeneratorUniform.
	Generators at: #normal put: GeneratorGaussian.

	"
	self initialize.

	GeneratorSequential value: 10.
	GeneratorUniform value: 10.
	GeneratorGaussian value: 10.





	"

	"Modified: / 01-08-2013 / 23:03:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkPerform class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkPerform class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkPerform class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark0 [
	<benchmark>

	| sels r s |

	sels := selectors at: 1+0.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s
	].

	"
	BenchmarkPerform run: #benchmark0
	"

	"Created: / 20-07-2013 / 11:13:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 01-08-2013 / 23:22:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark1 [
	<benchmark>

	| sels r s|

	sels := selectors at: 1+1.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s with: 1
	]

	"Created: / 20-07-2013 / 11:14:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 23:29:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark2 [
	<benchmark>

	| sels r s|

	sels := selectors at: 1+2.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s with: 1 with: 2.
	]

	"Created: / 20-07-2013 / 11:14:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 23:29:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark3 [
	<benchmark>

	| sels r s|

	sels := selectors at: 1+3.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s with: 1 with: 2 with: 3
	]

	"Created: / 20-07-2013 / 11:15:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 23:29:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark4 [
	<benchmark>

	| na sels r s args |

	na := 4.
	sels := selectors at: 1+na.
	args := Array new: na.
	hasPerformWith4 ifTrue:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s with: 1 with: 2 with: 3 with: 4.
		]
	] ifFalse:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s withArguments: args
		]
	]

	"Created: / 20-07-2013 / 11:15:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 16-10-2015 / 19:57:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark5 [
	<benchmark>

	| na sels r s args |

	na := 5.
	sels := selectors at: 1+na.
	args := Array new: na.
	hasPerformWith4 ifTrue:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s with: 1 with: 2 with: 3 with: 4 with: 5.
		]
	] ifFalse:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s withArguments: args
		]
	]

	"Created: / 20-07-2013 / 11:16:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 16-10-2015 / 19:57:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark6 [
	<benchmark>

	| na sels r s args |

	na := 6.
	sels := selectors at: 1+na.
	args := Array new: na.
	hasPerformWith4 ifTrue:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s with: 1 with: 2 with: 3 with: 4 with: 5 with: 6.
		]
	] ifFalse:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s withArguments: args
		]
	]

	"Created: / 20-07-2013 / 11:16:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:57:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark7 [
	<benchmark>

	| na sels r s args |

	na := 7.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:17:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:26:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark8 [
	<benchmark>

	| na sels r s args |

	na := 8.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:17:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:26:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmark9 [
	<benchmark>

	| na sels r s args |

	na := 9.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:17:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:26:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkA [
	<benchmark>

	| na sels r s args |

	na := 10.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:17:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:26:55 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkB [
	<benchmark>

	| na sels r s args |

	na := 11.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:17:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:26:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkC [
	<benchmark>

	| na sels r s args |

	na := 12.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:18:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:27:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkD [
	<benchmark>

	| na sels r s args |

	na := 13.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:18:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:27:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkE [
	<benchmark>

	| na sels r s args |

	na := 14.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:18:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:27:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkPerform >> benchmarkF [
	<benchmark>

	| na sels r s args |

	na := 15.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:18:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:27:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkPerform >> iterations [
	^ iterations
]

{ #category : #parameters }
BenchmarkPerform >> iterations:anInteger [
	<parameter: 'How many interations in outer loop' type: #Integer default: 1000>
	iterations := anInteger.

	"Modified: / 20-07-2013 / 01:16:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkPerform >> nreceivers [
	^ nreceivers
]

{ #category : #parameters }
BenchmarkPerform >> nreceivers:anInteger [
	<parameter: 'Number of different receivers to send messages to' type: #Integer>
	nreceivers := anInteger.

	"Modified: / 20-07-2013 / 01:06:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkPerform >> nselectors [
	^ nselectors
]

{ #category : #parameters }
BenchmarkPerform >> nselectors:anInteger [
	<parameter: 'Number of different messages to send' type: #Integer>
	nselectors := anInteger.

	"Modified: / 20-07-2013 / 01:07:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkPerform >> recdistrib [
	^ recdistrib
]

{ #category : #parameters }
BenchmarkPerform >> recdistrib:aSymbol [
	<parameter: #recdistrib type: #Symbol default: #uniform values: #(#sequential #uniform #normal)>
	recdistrib := aSymbol.

	"Modified: / 01-08-2013 / 20:16:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkPerform >> seldistrib [
	^ seldistrib
]

{ #category : #parameters }
BenchmarkPerform >> seldistrib:aSymbol [
	<parameter: #seldistrib type: #Symbol default: #uniform values: #(#sequential #uniform #normal)>
	seldistrib := aSymbol.

	"Modified: / 01-08-2013 / 20:17:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkPerform >> setUp [
	<setup>

	| rng1 rng2 |

	nreceivers isNil ifTrue:[
		BenchmarkParameterError new signal:'No value set for parameter ''nreceivers''!'.    
	].
	nselectors isNil ifTrue:[
		BenchmarkParameterError new signal:'No value set for parameter ''nselectors''!'.    
	].

	receivers := Smalltalk allClasses asArray copyFrom: 1 to: nreceivers.

	rng1 := Random new seed: 173.
	selectors := Array new: 16.
	1 to: 16 do:[:na|
		| bucket |

		bucket := (1 to: nselectors) collect:[:i|
			| no suffixSel suffixMethod |
			suffixSel := #(
							"00" ''
							"01" ':'
							"02" ':a:'
							"03" ':a:a:'
							"04" ':a:a:a:'
							"05" ':a:a:a:a:'
							"06" ':a:a:a:a:a:'
							"07" ':a:a:a:a:a:a:'
							"08" ':a:a:a:a:a:a:a:'
							"09" ':a:a:a:a:a:a:a:a:'
							"10" ':a:a:a:a:a:a:a:a:a:'
							"11" ':a:a:a:a:a:a:a:a:a:a:'
							"12" ':a:a:a:a:a:a:a:a:a:a:a:'
							"13" ':a:a:a:a:a:a:a:a:a:a:a:a:'
							"14" ':a:a:a:a:a:a:a:a:a:a:a:a:a:'
							"15" ':a:a:a:a:a:a:a:a:a:a:a:a:a:a:'
				) at: na.
				suffixMethod := #(
							"00" ''
							"01" ':a1'
							"02" ':a1 a:a2'
							"03" ':a1 a:a2 a:a3'
							"04" ':a1 a:a2 a:a3 a:a4'
							"05" ':a1 a:a2 a:a3 a:a4 a:a5'
							"06" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6'
							"07" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7'
							"08" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8'
							"09" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9'
							"10" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA'
							"11" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB'
							"12" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC'
							"13" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD'
							"14" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD a:aE'
							"15" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD a:aE a:aF'
				) at: na.
				no := (rng1 nextInt: SmallInteger maxVal) printString.
				Object compile: 'm' , no , suffixMethod , '
				^ 123456' classified: 'benchmark-mocks'.
				('m', no , suffixSel) asSymbol.
		].
		selectors at: na put: bucket.
	].

	rng2 := Generators at: recdistrib.
	recindices := Array new: nreceivers.
	1 to: recindices size do:[:i|
		recindices  at: i put: (rng2 value: recindices size).
	].

	rng2 := Generators at: seldistrib.
	selindices  := Array new: nselectors.
	1 to: selindices size do:[:i|
		selindices  at: i put: (rng2 value: selindices  size).
	].

	hasPerformWith4 := Object canUnderstand: #perform:with:with:with:with:.
	hasPerformWith5 := Object canUnderstand: #perform:with:with:with:with:with:.
	hasPerformWith6 := Object canUnderstand: #perform:with:with:with:with:with:with:.

	"Created: / 20-07-2013 / 00:55:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:54:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkPerform >> tearDown [
	<teardown>

	selectors do:[:bucket|
		bucket do:[:selector|
			Object removeSelector: selector
		]
	]

	"Created: / 20-07-2013 / 02:11:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
