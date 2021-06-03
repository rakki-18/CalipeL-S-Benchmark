running
run: benchmark with: parameters
	^ (BenchmarkInstance class:self selector:benchmark) runWith: parameters

	"Created: / 10-03-2014 / 00:12:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"