profiling
spy: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor
	aBenchmarkExecutor spy: self result: aBenchmarkResult defines: aDictionary.
	^ aBenchmarkResult

	"Created: / 21-05-2014 / 10:33:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"