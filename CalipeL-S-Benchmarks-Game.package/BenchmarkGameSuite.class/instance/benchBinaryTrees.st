benchmarking
benchBinaryTrees
		<benchmark: 'Binary Trees'>

		| bench |
		bench := BenchmarkGameBinaryTrees new.
		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameBinaryTrees defaultProblemSize
		].
		^ bench binarytrees: problemSize to: (TextStream with: String new).

	"Modified: / 23-06-2013 / 02:31:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"