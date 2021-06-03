running
run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor
	aBenchmarkExecutor execute: self result: aBenchmarkResult defines: aDictionary.
	^ aBenchmarkResult

	"Created: / 26-07-2013 / 00:07:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"