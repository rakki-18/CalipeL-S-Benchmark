Class {
	#name : #BenchmarkInstance,
	#superclass : #Object,
	#instVars : [
		'instance',
		'benchmarkSelector',
		'name',
		'description',
		'parameters',
		'setUpSelector1',
		'setUpSelectors2',
		'tearDownSelector1',
		'tearDownSelectors2',
		'warmUpSelector1',
		'warmUpSelector2'
	],
	#classVars : [
		'MillisecondsTime'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #accessing }
BenchmarkInstance class >> benchmarkAnnotationKeywords [
	^ #(
		benchmark
		benchmark:
		benchmark:description:
	)

	"Created: / 23-06-2013 / 02:10:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkInstance class >> class:class selector:benchmark [ 
	^ self new class:class selector:benchmark

	"Created: / 27-05-2013 / 19:04:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'class initialization' }
BenchmarkInstance class >> initialize [ 
   "Test for Smalltalk/X"
	((Smalltalk respondsTo: #isSmalltalkX) and:[ Smalltalk isSmalltalkX ]) ifTrue:[
		  "Use slow Smalltalk at: because Pharo does not allow to accept code with
			undefined global. Somewhat stupid! "
		MillisecondsTime := [ (Smalltalk at: #OperatingSystem) getMillisecondTime ].
		  ^self
	].
   "Test for Squeak/Pharo"
   (Smalltalk at: #SmalltalkImage ifAbsent: [nil]) notNil ifTrue:[
		MillisecondsTime := [ Time millisecondClockValue ].
		  ^self 
   ].
   self error:'Unssuported platform'

   "
   BenchmarkInstance initialize
   "

	"Created: / 31-05-2013 / 12:02:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkInstance class >> instance: object selector:benchmark [ 
	^ self new instance:object selector:benchmark

	"Created: / 18-07-2013 / 03:06:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkInstance class >> isBenchmarkMethod:method [
	self benchmarkAnnotationKeywords do:[:keyword|
		(method pragmaAt: keyword) notNil ifTrue:[
			^ true
		].
	].
	^false

	"Created: / 23-06-2013 / 01:51:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkInstance class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'running-private' }
BenchmarkInstance >> benchmarkUsingInstruments:instruments [ 
	| profile  profiler  measurements  instrumentArray executuonTimeInstrument |

	instrumentArray := instruments asArray.
	executuonTimeInstrument := instrumentArray detect:[:each | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: each ] ifNone:[ nil ].
	executuonTimeInstrument notNil ifTrue:[ 
		instrumentArray swap: (instrumentArray identityIndexOf: executuonTimeInstrument) with: instrumentArray size.  
	].
	 " Special - check if running under callgrind, if so,
	 request instrumentation - supported only on Smalltalk/X "
	profile := Smalltalk isSmalltalkX 
			and:[
				(Smalltalk at:#Profiler) notNil 
					and:[ (Smalltalk at:#Profiler) valgrind runningUnderValgrind ]
			].
	profile ifTrue:[
		profiler := (Smalltalk at:#Profiler) valgrind.
		profiler callgrindInstrumentationStart.
	].
	instrumentArray do:[:i | 
		i measurementStart:self
	].
	instance perform:benchmarkSelector.
	instrumentArray reverseDo:[:i | 
		i measurementStop:self
	].
	profile ifTrue:[
		profiler callgrindInstrumentationStop.
	].
	measurements := instrumentArray collect:[:i | BenchmarkMeasurement instrument:i value:i measurementValue ].
	^ measurements

	"Created: / 24-11-2014 / 00:17:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-12-2014 / 23:32:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkInstance >> class:class selector:benchmark [ 
	self instance:class new selector:benchmark

	"Created: / 27-05-2013 / 19:04:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkInstance >> description [
	^ description
]

{ #category : #accessing }
BenchmarkInstance >> instance [
	^ instance
]

{ #category : #initialization }
BenchmarkInstance >> instance:anObject selector:aSelector [ 
	| cls benchmarkMethod  annotation |

	(anObject respondsTo:aSelector) ifFalse:[
		self 
			error:'Object does not respond to benchmark (no ' 
					, anObject class printString , '>>' 
					, aSelector storeString.
	].
	instance := anObject.
	benchmarkSelector := aSelector.
	name := anObject class name , '>>' , aSelector.
	description := 'Not described'.
	parameters := Set new.
	cls := instance class.
	[ cls notNil ] whileTrue: [
		cls methodDictionary keysAndValuesDo:[:selector :method | 
			method numArgs == 0 ifTrue:[
				(method pragmaAt:#setup) notNil ifTrue:[
					setUpSelector1 notNil ifTrue:[
						self error:'More than one <setup> method'.
					].
					setUpSelector1 := selector.
				].
				(method pragmaAt:#teardown) notNil ifTrue:[
					tearDownSelector1 notNil ifTrue:[
						self error:'More than one <teardown> method'.
					].
					tearDownSelector1 := selector.
				].
				(method pragmaAt:#warmup) notNil ifTrue:[
					warmUpSelector1 notNil ifTrue:[
						self error:'More than one <warmup> method'.
					].
					warmUpSelector1 := selector.
				].
			].
			method numArgs == 1 ifTrue:[
				| nm type default values |

				default := BenchmarkParameter undefinedValue.
				(annotation := method pragmaAt: #parameter:type:) notNil ifTrue:[
					type := Smalltalk at: (annotation argumentAt: 2).
				] ifFalse:[
				(annotation := method pragmaAt: #parameter:type:values:) notNil ifTrue:[
					type :=  Smalltalk at: (annotation argumentAt: 2).
					values := (annotation argumentAt: 3).
				] ifFalse:[
				(annotation := method pragmaAt: #parameter:type:default:) notNil ifTrue:[
					type :=  Smalltalk at: (annotation argumentAt: 2).
					default := (annotation argumentAt: 3).
				] ifFalse:[
				(annotation := method pragmaAt: #parameter:type:default:values:) notNil ifTrue:[
					type :=  Smalltalk at: (annotation argumentAt: 2).
					default := (annotation argumentAt: 3).
					values := (annotation argumentAt: 4).
				]]]].
				annotation notNil ifTrue:[
					nm := selector.
					nm last = $: ifTrue:[
						nm := nm allButLast: 1.
					].
					(parameters contains:[:e | e name = nm ]) ifFalse:[
						parameters add:(BenchmarkParameter name: nm type: type default: default values: values).
					].
				].
			].
		].
		cls := cls superclass.
	].
	benchmarkMethod := instance class lookupSelector: benchmarkSelector.
	annotation := benchmarkMethod pragmaAt:#benchmark:description:.
	annotation notNil ifTrue:[
		name := annotation argumentAt: 1.
		description := annotation argumentAt: 2.
	] ifFalse:[
	annotation := benchmarkMethod pragmaAt:#benchmark:.
	annotation notNil ifTrue:[
		name := annotation argumentAt: 1.
	]].
	annotation := benchmarkMethod pragmaAt:#setup:.
	annotation notNil ifTrue:[
		| method  selectorOrArray selectors |

		selectorOrArray := annotation argumentAt:1.
		selectorOrArray isSymbol ifTrue:[
			selectors := Array with: selectorOrArray
		] ifFalse:[
			selectorOrArray isArray ifFalse:[
				self error:'<setup:> annotation argument not a symbol or array of those'.
			].
			(selectorOrArray contains:[:e | e isSymbol not ]) ifTrue:[ 
				self error:'<setup:> annotation argument not a symbol or array of those'.
			].
			selectors := selectorOrArray.
		].
		selectors do:[:selector | 
			method := instance class lookupSelector: selector.
			method isNil ifTrue:[
				self error:'<setup:> method does not exist (' , selector , ')'.
			].
			method numArgs ~~ 0 ifTrue:[
				self error:'<setup:> method has arguments (' , selector , ')'.
			].
		].
		setUpSelectors2 := selectors.
	].
	annotation := benchmarkMethod pragmaAt:#teardown:.
	annotation notNil ifTrue:[
		| method  selectorOrArray selectors |

		selectorOrArray := annotation argumentAt:1.
		selectorOrArray isSymbol ifTrue:[
			selectors := Array with: selectorOrArray
		] ifFalse:[
			selectorOrArray isArray ifFalse:[
				self error:'<teardown:> annotation argument not a symbol or array of those'.
			].
			(selectorOrArray contains:[:e | e isSymbol not ]) ifTrue:[ 
				self error:'<teardown:> annotation argument not a symbol or array of those'.
			].
			selectors := selectorOrArray.
		].
		selectors do:[:selector | 
			method := instance class lookupSelector: selector.
			method isNil ifTrue:[
				self error:'<teardown:> method does not exist (' , selector , ')'.
			].
			method numArgs ~~ 0 ifTrue:[
				self error:'<teardown:> method has arguments (' , selector , ')'.
			].
		].
		tearDownSelectors2 := selectors.         
	].
	annotation := benchmarkMethod pragmaAt:#warmup:.
	annotation notNil ifTrue:[
		| method  selector |

		cls := instance class.
		selector := annotation argumentAt:1.
		selector isSymbol ifFalse:[
			self error:'<warmup:> annotation argument not a symbol'.
		].
		method := instance class lookupSelector: selector.
		method isNil ifTrue:[
			self error:'<warmup:> method does not exist (' , selector , ')'.
		].
		method numArgs ~~ 0 ifTrue:[
			self error:'<warmup:> method has arguments (' , selector , ')'.
		].
		warmUpSelector2 := selector.
	].

	"Created: / 27-05-2013 / 19:06:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-09-2015 / 06:01:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkInstance >> isEmpty [
	"Return true, if this benchmark suite contains no benchmarks. Defined
	 here to make it polymorph with BenchmarkSuite." 

	^ false

	"Created: / 30-09-2015 / 08:31:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkInstance >> isEmptyOrNil [
	^ self isEmpty

	"Created: / 30-09-2015 / 08:30:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkInstance >> name [
	^ name
]

{ #category : #testing }
BenchmarkInstance >> notEmpty [
	"Return true, if this benchmark suite contains at least one benchmark. Defined
	 here to make it polymorph with BenchmarkSuite"

	^ self isEmpty not

	"Created: / 30-09-2015 / 08:34:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkInstance >> notEmptyOrNil [
	^ self notEmpty

	"Created: / 30-09-2015 / 08:34:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkInstance >> parameters [
	^ parameters
]

{ #category : #running }
BenchmarkInstance >> run [
	"Run benchmark, returning result"

	^self run: BenchmarkResultC new.

	"Created: / 27-05-2013 / 19:10:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkInstance >> run: aBenchmarkResult [
	"Run suite. Result is added to given benchmark result"

	^self run: aBenchmarkResult with: Dictionary new

	"Created: / 27-05-2013 / 19:10:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 28-05-2013 / 00:02:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 24-06-2013 / 01:09:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkInstance >> run: aBenchmarkResult with: aDictionary [
	^ self run: aBenchmarkResult with: aDictionary executor: BenchmarkExecutor new

	"Created: / 27-05-2013 / 22:18:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 26-07-2013 / 00:09:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkInstance >> run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor [
	aBenchmarkExecutor execute: self result: aBenchmarkResult defines: aDictionary.
	^ aBenchmarkResult

	"Created: / 26-07-2013 / 00:07:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkInstance >> runWith: aDictionary [
	^ self run: BenchmarkResultC new with: aDictionary

	"Created: / 27-07-2013 / 13:09:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkInstance >> selector [
	^ benchmarkSelector
]

{ #category : #'running-private' }
BenchmarkInstance >> setUp [
	setUpSelector1 notNil ifTrue:[
		instance perform: setUpSelector1 
	].
	setUpSelectors2 notNil ifTrue:[
		setUpSelectors2 do:[:each |  
			instance perform: each 
		].
	].

	"Created: / 27-05-2013 / 19:02:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 23:18:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'running-private' }
BenchmarkInstance >> setUpParameter: aBenchmarkParameter value: anObject [
   aBenchmarkParameter set: anObject in: instance

	"Created: / 27-07-2013 / 11:43:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #profiling }
BenchmarkInstance >> spy [
	"Run benchmark under MessageTally and display results"

	^self spy: BenchmarkResultC new.

	"Created: / 21-05-2014 / 10:31:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #profiling }
BenchmarkInstance >> spy: aBenchmarkResult [
	"Run benchmark under MessageTally profiler. Result is added to given benchmark result"

	^self spy: aBenchmarkResult with: Dictionary new

	"Created: / 21-05-2014 / 10:32:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #profiling }
BenchmarkInstance >> spy: aBenchmarkResult with: aDictionary [
	^ self spy: aBenchmarkResult with: aDictionary executor: BenchmarkExecutor new

	"Created: / 21-05-2014 / 10:33:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #profiling }
BenchmarkInstance >> spy: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor [
	aBenchmarkExecutor spy: self result: aBenchmarkResult defines: aDictionary.
	^ aBenchmarkResult

	"Created: / 21-05-2014 / 10:33:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'running-private' }
BenchmarkInstance >> spyIt [
	| t0 t1 messageTally |

	" Special - use Smalltalk/X visual profiler instead plain old
	  MessageTally."
	messageTally := Smalltalk isSmalltalkX
					ifTrue:[ Smalltalk at:#'Tools::Profiler' ]
					ifFalse:[ MessageTally ].
	t0 := MillisecondsTime value.
	messageTally spyDetailedOn: [ instance perform:benchmarkSelector ].
	t1 := MillisecondsTime value.
	^ t1 - t0

	"Created: / 21-05-2014 / 10:53:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #profiling }
BenchmarkInstance >> spyWith: aDictionary [
	^ self spy: BenchmarkResultC new with: aDictionary

	"Created: / 21-05-2014 / 10:33:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'running-private' }
BenchmarkInstance >> tearDown [
	tearDownSelector1 notNil ifTrue:[
		instance perform: tearDownSelector1 
	].
	tearDownSelectors2 notNil ifTrue:[
		tearDownSelectors2 do:[:each |  
			instance perform: each 
		].
	].

	"Created: / 27-05-2013 / 19:02:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 23:18:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'running-private' }
BenchmarkInstance >> warmUp [
	| warmed |

	BenchmarkPlatform current warmUpPre.
	warmed := false.
	warmUpSelector1 notNil ifTrue:[
		instance perform: warmUpSelector1.
		warmed := true.
	].
	warmUpSelector2 notNil ifTrue:[
		instance perform: warmUpSelector2.
		warmed := true.
	].
	"Default warmup"
	warmed ifFalse:[
		instance perform: benchmarkSelector 
	].
	BenchmarkPlatform current warmUpPost.

	"Created: / 27-05-2013 / 19:02:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 07-06-2013 / 02:08:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
