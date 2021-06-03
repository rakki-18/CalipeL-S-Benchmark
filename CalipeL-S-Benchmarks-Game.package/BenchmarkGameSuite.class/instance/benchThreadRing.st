benchmarking
benchThreadRing
	<benchmark: 'Thread Ring'>

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameThreadRing defaultProblemSize
	].
	^ BenchmarkGameThreadRing threadring: problemSize.

	"Modified: / 23-06-2013 / 02:33:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"