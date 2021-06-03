executing
spy: aBenchmarkInstance result: aBenchmarkResult defines: aDictionary
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