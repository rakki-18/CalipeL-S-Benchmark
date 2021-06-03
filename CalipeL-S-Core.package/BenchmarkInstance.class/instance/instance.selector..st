initialization
instance:anObject selector:aSelector 
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