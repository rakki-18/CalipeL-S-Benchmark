executing
execute: aBenchmarkInstance result: aBenchmarkResult defines: aDictionary
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