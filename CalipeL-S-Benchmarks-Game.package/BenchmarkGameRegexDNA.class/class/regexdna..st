benchmarking
regexdna: n
	| output input |
	input  := BenchmarkGameFastaCache forFasta: n.
	output := TextStream with: String new.
   self new regexDNA: input to: output.
   ^ output
