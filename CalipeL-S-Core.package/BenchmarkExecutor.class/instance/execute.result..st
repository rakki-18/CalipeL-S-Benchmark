executing
execute: aBenchmarkInstance result: aBenchmarkResult
	"
	Executes the benchmark and adds results into given resultset
	"

	^ self execute: aBenchmarkInstance result: aBenchmarkResult defines: Dictionary new.

	"Created: / 09-03-2014 / 10:59:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"