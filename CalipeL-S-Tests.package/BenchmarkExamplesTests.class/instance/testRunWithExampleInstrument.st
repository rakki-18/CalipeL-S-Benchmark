tests
testRunWithExampleInstrument

	| suite executor |
	suite := BenchmarkSuite class: BenchmarkExamples selector: #example01.
	executor := BenchmarkExecutor new.
	executor instruments: { BenchmarkExamplesInstrument new }.
	suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	"Created: / 22-10-2015 / 08:11:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"