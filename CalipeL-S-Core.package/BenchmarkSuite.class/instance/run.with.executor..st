running
run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor
	benchmarks do:[:each|
		each run: aBenchmarkResult with: aDictionary executor: aBenchmarkExecutor
	].
	^aBenchmarkResult

	"Created: / 26-07-2013 / 00:07:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:09:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"