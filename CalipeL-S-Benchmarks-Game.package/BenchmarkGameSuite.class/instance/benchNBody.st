benchmarking
benchNBody
	<benchmark: 'N-Body'>

		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameNBody defaultProblemSize
		].
		BenchmarkGameNBody nbody: problemSize.

	"Modified: / 23-06-2013 / 02:32:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"