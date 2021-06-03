tests
testRegexDNA
	| output input |
	input := BenchmarkGameFastaCache forFasta: BenchmarkGameRegexDNA defaultProblemSize.
	
	output := TextStream with: String new.
	
	BenchmarkGameRegexDNA new regexDNA: input to: output.
	self assert: output contents equals: BenchmarkGameRegexDNA output
