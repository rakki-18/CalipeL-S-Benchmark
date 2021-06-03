main
main:argv0
	"Main entry point for standalone benchmark runner. It parses (common) command line arguments,
	 builds the suite and run all benchmarks. It returns a status code to be passed to exit(). 

	 Note, that platform-specific command line arguments are handled in a platform specific 
	 runner adapter (see BenchmarkRunnerAdapterStX or BenchmarkRunnerAdapterPharo."

	| statusCode i report instruments name file params classes runs argv desc setup setupScript teardown teardownScript executor |

	statusCode := StatusSuccess.
	params := Dictionary new.
	classes := OrderedCollection new.
	report := BenchmarkReport text.
	instruments := OrderedCollection new.
	runs := 5.
	argv := argv0 asOrderedCollection.

	i := 1.
	[ i <= argv size ] whileTrue:[
		| arg |

		arg := argv at: i.
		i := i + 1.
		arg first == $- ifTrue:[
			arg = '-n' ifTrue:[
				i > argv size ifTrue:[
					self error:'-n requires an integer parameter'
				].
				runs := Integer readFrom: (argv at: i) onError:[
					self error: '-n requires an integer parameter'.
				].
				i := i + 1.
			].
			arg = '-o' ifTrue:[
				i > argv size ifTrue:[
					self error:'-o requires a filename parameter'
				].
				file := argv at: i.
				i := i + 1.
			].
			(arg = '--arguments' or:[arg = '--script']) ifTrue:[
				| arguments argumentsF |

				i > argv size ifTrue:[
					self error: arg, ' requires a file parameter.'
				].                
				argumentsF := (arguments := (argv at: i)) asFilename.
				argumentsF exists ifFalse:[
					self error:'no such file: ', arguments.
				].
				argumentsF readingFileDo:[:f | self parseArguments: f into: argv ].
				i := i + 1.
			].  
						 

			arg = '-r' ifTrue:[
				| reportNm |

				i > argv size ifTrue:[
					self error:'-r requires a valid class name parameter'
				].
				reportNm := (argv at: i).
				i := i + 1.
				report := Smalltalk at: reportNm asSymbol.
				report isNil ifTrue:[
					self error: 'No report class named ''', reportNm, ''''.
				].
			].

			(arg = '-i' or:[arg = '--instrument']) ifTrue:[
				| instrumentNm instrumentCls |

				i > argv size ifTrue:[
					self error: arg, ' requires a valid class name parameter'
				].
				instrumentNm := (argv at: i).
				i := i + 1.
				instrumentCls := Smalltalk at: instrumentNm asSymbol.
				instrumentCls isNil ifTrue:[
					self error: 'No instrument class named ''', instrumentNm, ''''.
				] ifFalse:[ 
					instruments add: instrumentCls new.
				].
			].    

			arg = '--text' ifTrue:[
				report := BenchmarkReport text.
			].

			arg = '--json' ifTrue:[
				report := BenchmarkReport json.
			].

			arg = '--tag' ifTrue:[
				i > argv size ifTrue:[
					self error:'--tag requires a string parameter.'
				].                
				name := argv at: i.
				i := i + 1.
			].

			arg = '--setup' ifTrue:[ 
				i > argv size ifTrue:[
					self error:'--setup requires a string parameter.'
				].                
				setup := argv at: i.
				i := i + 1.     
			].
			arg = '--teardown' ifTrue:[ 
				i > argv size ifTrue:[
					self error:'--teardown requires a string parameter.'
				].                
				teardown := argv at: i.
				i := i + 1.     
			].

			(arg = '--setup-script') ifTrue:[
				i > argv size ifTrue:[
					self error: arg, ' requires a file parameter.'
				].                
				setupScript := (argv at: i) asFilename.
				setupScript exists ifFalse:[
					self error:'no such file: ', (argv at: i).
				].
				i := i + 1.
			].  
			(arg = '--teardown-script') ifTrue:[
				i > argv size ifTrue:[
					self error: arg, ' requires a file parameter.'
				].                
				teardownScript := (argv at: i) asFilename.
				teardownScript exists ifFalse:[
					self error:'no such file: ', (argv at: i).
				].
				i := i + 1.
			].  



			arg = '--description' ifTrue:[
				i > argv size ifTrue:[
					self error:'--description requires a string parameter.'
				].                
				desc := argv at: i.
				i := i + 1.
			].    

			arg second = $D ifTrue:[
				| eqIdx |

				((arg size > 2) and:[(eqIdx := arg indexOf: $= startingAt: 3) ~~ 0]) ifTrue:[
					params at: (arg copyFrom: 3 to: eqIdx - 1) put: (arg copyFrom: eqIdx + 1)
				] ifFalse:[
					self error: 'No parameter value'
				]
			]
		] ifFalse:[
			classes add: arg.
		]
	].

	classes isEmpty ifTrue:[
		self error:'No suite or benchmark specified.'
	].

	"Build suite"
	suite := BenchmarkSuite new.
	classes do:[:each|
		| classNm class selector |    
		i := each indexOf: $#.
		i ~~ 0 ifTrue:[
			classNm := each copyTo: i - 1.
			selector := (each copyFrom: i + 1) asSymbol.
		] ifFalse:[
			classNm := each.
		].
		class := Smalltalk at: classNm asSymbol.
		class isNil ifTrue:[
			self error: 'Class ', classNm , ' does not exists'.
		].
		Smalltalk isSmalltalkX ifTrue:[
			class isLoaded ifFalse:[class autoload].
		].
		selector isNil ifTrue:[
			suite addBenchmark: (BenchmarkSuite class: class)
		] ifFalse:[
			suite addBenchmark: (BenchmarkSuite class:class selector:selector)
		]
	].

	suite isEmpty ifTrue:[ 
		self error: 'No benchmarks to run (suite is empty)'
	].

	"Run setup, if any"
	setup notNil ifTrue:[ Compiler evaluate: setup ].
	setupScript notNil ifTrue:[ Compiler evaluate: setupScript asFilename contents asString ].

	"Run suite"
	result := BenchmarkResultC new.
	executor := BenchmarkRunnerExecutor new.
	executor instruments: instruments.
	result runs: runs.
	[
		suite run: result with: params executor: executor.
	] on: BenchmarkExecutionFailure do:[:ex | 
		"Note that there was an error, but do not
		 terminate the execution"
		statusCode := StatusFailure.
		ex resume.
	].

	"Write report"
	file notNil ifTrue:[
		file asFilename writingFileDo:[:s|
			report
				name: name;
				description: desc;      
				write: result on: s 
		]
	] ifFalse:[
		report
			name: name;
			description: desc;
			write: result on: BenchmarkPlatform current stdout
	].

	"Run teardown"
	teardown notNil ifTrue:[ Compiler evaluate: teardown ].
	teardownScript notNil ifTrue:[ Compiler evaluate: teardownScript asFilename contents asString ].

	^ statusCode

	"Modified: / 22-10-2015 / 15:05:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"