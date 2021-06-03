benchmarking
benchPiDigits
	<benchmark: 'Pi-Digits'>

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGamePiDigits defaultProblemSize
	].
	^ BenchmarkGamePiDigits piDigits: problemSize.

	"Modified: / 23-06-2013 / 02:32:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"