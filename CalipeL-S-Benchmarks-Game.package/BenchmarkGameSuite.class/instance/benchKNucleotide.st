benchmarking
benchKNucleotide
	"<benchmark: 'K-Nucleotide'>"

		| bench input result  output |
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameKNucleotide defaultProblemSize
].
		
		bench := BenchmarkGameKNucleotide new.
		input := ReadStream on: (BenchmarkGameFastaCache forFasta: problemSize).
		result := TextStream with: String new.
		output := bench knucleotide5From: input to: result.
		
		^ output

	"Modified: / 21-06-2013 / 16:46:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"