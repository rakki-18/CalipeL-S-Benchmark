benchmarking
benchMeteor
	"<benchmark: 'Meteor'>"


		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameMeteor defaultProblemSize
].
		^ BenchmarkGameMeteor meteor: problemSize.

	"Modified: / 21-06-2013 / 16:46:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"