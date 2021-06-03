tests
testRunIndividually
	BenchmarkExamples selectorsAndMethodsDo:[:selector :method |
		((method pragmaAt: #benchmark) notNil or:[ (method pragmaAt: #benchmark:) notNil ]) ifTrue:[ 
			(BenchmarkSuite class: BenchmarkExamples selector: selector) run.
		].
	]

	"Created: / 15-10-2015 / 16:03:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"