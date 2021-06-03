testing
notEmpty
	"Return true, if this benchmark suite contains at least one benchmark. Defined
	 here to make it polymorph with BenchmarkSuite"

	^ self isEmpty not

	"Created: / 30-09-2015 / 08:34:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"