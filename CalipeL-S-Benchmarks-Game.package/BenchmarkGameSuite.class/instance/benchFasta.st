benchmarking
benchFasta
	<benchmark: 'Fasta'>


		| out  |
		out := TextStream with: String new.
		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameFasta defaultProblemSize
		].
		BenchmarkGameFasta fasta: problemSize to: out.

	"Modified: / 23-06-2013 / 02:31:56 / Jan Vrany <jan.vrany@fit.cvut.cz>"