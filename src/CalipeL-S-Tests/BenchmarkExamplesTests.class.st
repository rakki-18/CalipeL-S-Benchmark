Class {
	#name : #BenchmarkExamplesTests,
	#superclass : #TestCase,
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkExamplesTests class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #tests }
BenchmarkExamplesTests >> testRunAll [
	(BenchmarkSuite class: BenchmarkExamples) run.

	"Created: / 15-10-2015 / 16:03:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkExamplesTests >> testRunIndividually [
	BenchmarkExamples selectorsAndMethodsDo:[:selector :method |
		((method pragmaAt: #benchmark) notNil or:[ (method pragmaAt: #benchmark:) notNil ]) ifTrue:[ 
			(BenchmarkSuite class: BenchmarkExamples selector: selector) run.
		].
	]

	"Created: / 15-10-2015 / 16:03:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkExamplesTests >> testRunWithExampleInstrument [

	| suite executor |
	suite := BenchmarkSuite class: BenchmarkExamples selector: #example01.
	executor := BenchmarkExecutor new.
	executor instruments: { BenchmarkExamplesInstrument new }.
	suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	"Created: / 22-10-2015 / 08:11:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
