Class {
	#name : #BenchmarkExecutor,
	#superclass : #Object,
	#instVars : [
		'instruments'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #documentation }
BenchmarkExecutor class >> documentation [
"
	A benchmark executor takes a signle BenchmarkInstance and a set of
	parameter definitions and executes it. Returns a set of
	BenchmarkOutcomes.

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #execution }
BenchmarkExecutor class >> execute:aBenchmarkInstance [
	^ self new execute:aBenchmarkInstance
]

{ #category : #execution }
BenchmarkExecutor class >> execute:aBenchmarkInstance result:aBenchmarkResult [
	^ self new execute:aBenchmarkInstance result:aBenchmarkResult
]

{ #category : #execution }
BenchmarkExecutor class >> execute:aBenchmarkInstance result:aBenchmarkResult defines:aDictionary [
	^ self new execute:aBenchmarkInstance result:aBenchmarkResult defines:aDictionary
]

{ #category : #'instance creation' }
BenchmarkExecutor class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkExecutor class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'executing-private' }
BenchmarkExecutor >> benchmark: aBenchmarkInstance [
	| measurements |
	[
		measurements := aBenchmarkInstance benchmarkUsingInstruments: (BenchmarkPlatform current instruments) , instruments.
	] on: Error do:[:ex|
		BenchmarkExecutionError new signal:'Error during measurement: ', ex description.      
	].
	^measurements

	"Created: / 24-11-2014 / 00:18:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 13:43:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #executing }
BenchmarkExecutor >> execute: aBenchmarkInstance [
	"Executes the benchmark and returns the result (timings)"

	^ self execute: aBenchmarkInstance result: BenchmarkResultC new

	"Created: / 09-03-2014 / 10:59:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #executing }
BenchmarkExecutor >> execute: aBenchmarkInstance result: aBenchmarkResult [
	"
	Executes the benchmark and adds results into given resultset
	"

	^ self execute: aBenchmarkInstance result: aBenchmarkResult defines: Dictionary new.

	"Created: / 09-03-2014 / 10:59:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #executing }
BenchmarkExecutor >> execute: aBenchmarkInstance result: aBenchmarkResult defines: aDictionary [
	"
	Takes a benchmark instance and a set of parameter defines,
	executes the benchmark and one or more outcomes into given
	result.

	This is where real execution happens"

	| parameters combinator |

	aBenchmarkResult initializeTimestampIfNotAlready.
	parameters := aBenchmarkInstance parameters collect:[:parameter|
		| key1 key2 valuesString values defined |

		key1 := aBenchmarkInstance instance class name , '#' , parameter name.
		key2 := parameter name.
		defined := true.
		valuesString := aDictionary at: key1 ifAbsent:[aDictionary at: key2 ifAbsent:[defined := false]].
		defined ifTrue:[
			values := valuesString subStrings:','.
			values := values collect:[:each|

				(parameter type includesBehavior: String) ifTrue:[
					each
				] ifFalse:[
					| s v |

					s := each readStream.
					v := parameter type readFrom: s onError:[
						"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
						BenchmarkParameterError new signal: 'Cannot read parameter value for ''' , parameter name , ''' (parse error)'
					].
					s atEnd ifFalse:[
						"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
						BenchmarkParameterError new signal: 'Cannot read parameter value for ''' , parameter name , ''' (parse error)'
					].
					v.                
				].
			]

		] ifFalse:[
			parameter default == BenchmarkParameter undefinedValue ifTrue:[
				values := parameter values.
				values isNil ifTrue:[ 
					BenchmarkParameterError new signal: 'Parameter value not defined and default value(s) not specified for ''' , parameter name , ''''
				].
			] ifFalse:[ 
				values := Array with: parameter default.    
			].
		].
		parameter -> values
	].

	parameters := parameters asOrderedCollection sort:[:a :b | a key name < b key name ].

	combinator := [:parametersAndValues |
		parametersAndValues size = parameters size ifTrue:[
			self execute: aBenchmarkInstance  result: aBenchmarkResult  parameters: parametersAndValues.
		] ifFalse:[
			| parameter |

			parameter := parameters at: parametersAndValues size + 1.
			parameter value do:[:value |
				combinator value: (parametersAndValues copyWith: (parameter key -> value)).
			]
		]
	].

	combinator value: #().

	"Created: / 12-08-2013 / 00:11:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 12:35:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkExecutor >> execute: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection [
	"
	Takes a benchmark instance and a set of parameter defines,
	executes the benchmark and an outcome to the result. Returns that
	outcome or nil if benchmark has been skipped.

	This is where real execution happens"

	| measurements outcome |

	[
		"First, warm it up"
		[ 
			self setUp:aBenchmarkInstance parameters: aCollection.  
			self warmUp: aBenchmarkInstance.
		] ensure:[
			self tearDown: aBenchmarkInstance
		].

		measurements := (1 to: aBenchmarkResult runs) collect:[:i | 
			[
				self setUp:aBenchmarkInstance parameters: aCollection.  
				self benchmark: aBenchmarkInstance 
			] ensure:[
				self tearDown: aBenchmarkInstance
			].
		].
		aBenchmarkResult addOutcome:
			(outcome := BenchmarkOutcome 
				benchmark: aBenchmarkInstance
				parameters: aCollection
				measurements: measurements).     
	] on: BenchmarkSkipRequest do:[:ex | 
		outcome := nil.
	].
	^ outcome

	"Created: / 27-07-2013 / 12:32:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 20-04-2015 / 12:44:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkExecutor >> initialize [
	"Invoked when a new instance is created."

	instruments := #()

	"Modified: / 27-11-2014 / 13:42:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkExecutor >> instruments [
	^ instruments
]

{ #category : #accessing }
BenchmarkExecutor >> instruments:aCollection [
	"Set a list of user-defined mersurement instruments"

	instruments := aCollection.

	"Modified (comment): / 27-11-2014 / 13:43:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkExecutor >> setUp:aBenchmarkInstance parameters: aCollection [
	[
		aCollection do:[:each|
			aBenchmarkInstance setUpParameter: each key value: each value
		].
		aBenchmarkInstance setUp.        
	] on: Error do:[:ex|
		(ex isKindOf: BenchmarkError) ifTrue:[
			ex pass
		] ifFalse:[
			BenchmarkExecutionError new signal:'Error during set-up: ', ex description.
		].

	]

	"Created: / 27-07-2013 / 12:31:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:14:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkExecutor >> spy:aBenchmarkInstance [ 
	| messageTally measurements |
	" Special - use Smalltalk/X visual profiler instead plain old
	  MessageTally."
	messageTally := Smalltalk isSmalltalkX
					ifTrue:[ Smalltalk at:#'Tools::Profiler' ]
					ifFalse:[ MessageTally ].
	messageTally spyDetailedOn: [ measurements := self benchmark: aBenchmarkInstance ].
	^ measurements

	"Created: / 21-05-2014 / 10:48:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-12-2014 / 16:02:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #executing }
BenchmarkExecutor >> spy: aBenchmarkInstance result: aBenchmarkResult defines: aDictionary [
	"
	Takes a benchmark instance and a set of parameter defines,
	then executes the benchmark under MessageTally profiler.
	Given defines must define only one combination, otherwise
	and error is thrown.

	This can be used for rough in-image profiling
	"

	| parameters combinator |

	aBenchmarkResult initializeTimestampIfNotAlready.
	parameters := aBenchmarkInstance parameters collect:[:parameter|
		| key1 key2 valuesString values defined |

		key1 := aBenchmarkInstance instance class name , '#' , parameter name.
		key2 := parameter name.
		defined := true.
		valuesString := aDictionary at: key1 ifAbsent:[aDictionary at: key2 ifAbsent:[defined := false]].
		defined ifTrue:[
			values := valuesString subStrings:','.
			values := values collect:[:each|

				(parameter type includesBehavior: String) ifTrue:[
					each
				] ifFalse:[
					| s v |

					s := each readStream.
					v := parameter type readFrom: s onError:[
						"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
						BenchmarkParameterError new signal: 'Cannot read parameter value for ''' , parameter name , ''' (parse error)'
					].
					s atEnd ifFalse:[
						"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
						BenchmarkParameterError new signal: 'Cannot read parameter value for ''' , parameter name , ''' (parse error)'
					].
					v.                
				].
			]

		] ifFalse:[
			parameter default == BenchmarkParameter undefinedValue ifTrue:[
				BenchmarkParameterError new signal: 'Parameter value for ''' , parameter name , ''' not specified and parameter has no default value'.
			].
			values := Array with: parameter default.    
		].
		values size > 1 ifTrue:[ 
			BenchmarkParameterError new signal: 'Multiple parameter values for param ''', parameter name , '''. No parameter combinating allowed when running under profiler!'.
		].
		parameter -> values
	].

	parameters := parameters asOrderedCollection sort:[:a :b | a key name < b key name ].

	combinator := [:parametersAndValues |
		parametersAndValues size = parameters size ifTrue:[
			self spy: aBenchmarkInstance  result: aBenchmarkResult  parameters: parametersAndValues.
		] ifFalse:[
			| parameter |

			parameter := parameters at: parametersAndValues size + 1.
			parameter value do:[:value |
				combinator value: (parametersAndValues copyWith: (parameter key -> value)).
			]
		]
	].

	combinator value: #().

	"Created: / 21-05-2014 / 10:44:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 12:34:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'profiling-private' }
BenchmarkExecutor >> spy: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection [
	"
	Takes a benchmark instance and a set of parameter defines,
	runs it under MessageTally profiler and show profiling results.
	"

	| measurements outcome |

	[
		self setUp:aBenchmarkInstance parameters: aCollection .
		self warmUp: aBenchmarkInstance.
		measurements := Array with: (self spy: aBenchmarkInstance).
		aBenchmarkResult addOutcome:
			(outcome := BenchmarkOutcome 
				benchmark: aBenchmarkInstance
				parameters: aCollection
				measurements: measurements).     

	] ensure:[
		self tearDown: aBenchmarkInstance
	].
	^ outcome

	"Created: / 21-05-2014 / 10:44:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-12-2014 / 16:03:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkExecutor >> tearDown: aBenchmarkInstance [
	[
		aBenchmarkInstance tearDown.
	] on: Error do:[:ex|
		BenchmarkExecutionError new signal:'Error during tear-down: ', ex description.      
	]

	"Created: / 24-06-2013 / 01:12:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 31-07-2013 / 01:03:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkExecutor >> warmUp: aBenchmarkInstance [
	[
		aBenchmarkInstance warmUp.
	] on: Error do:[:ex|
		(ex isKindOf: BenchmarkError) ifTrue:[ 
			ex pass
		] ifFalse:[ 
			BenchmarkExecutionError new signal:'Error during warm-up: ', ex description.      
		]
	]

	"Created: / 24-06-2013 / 01:11:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 20-04-2015 / 12:45:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
