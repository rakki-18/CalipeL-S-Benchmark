tests
testKNucleotide
	| input result |
	input  := ReadStream on: (BenchmarkGameFastaCache forFasta: BenchmarkGameKNucleotide defaultProblemSize).
	result := TextStream with: String new.
	BenchmarkGameKNucleotide new knucleotide5From: input to: result.
	
	self assert: result contents equals: BenchmarkGameKNucleotide output.
