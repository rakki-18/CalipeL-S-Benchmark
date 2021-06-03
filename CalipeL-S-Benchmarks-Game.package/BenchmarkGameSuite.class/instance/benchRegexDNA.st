benchmarking
benchRegexDNA
	"<benchmark: 'Regex DNA'>"

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameRegexDNA defaultProblemSize
	].
	BenchmarkGameRegexDNA regexdna: problemSize

	"Modified: / 21-06-2013 / 16:46:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"