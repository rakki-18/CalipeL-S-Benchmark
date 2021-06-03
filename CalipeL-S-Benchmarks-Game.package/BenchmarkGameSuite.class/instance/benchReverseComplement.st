benchmarking
benchReverseComplement
	"<benchmark: 'Reverse Complement'>"

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameReverseComplement defaultProblemSize
	].
	BenchmarkGameReverseComplement revcomp: problemSize

	"Modified: / 21-06-2013 / 16:46:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:33:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"