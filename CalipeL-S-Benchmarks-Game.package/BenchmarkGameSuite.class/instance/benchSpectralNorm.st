benchmarking
benchSpectralNorm
	"<benchmark: 'Spectral Nrm'>"

	| bench  |
	bench := BenchmarkGameSpectralNorm new.
	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameSpectralNorm defaultProblemSize
	].
	^ bench spectralnorm: problemSize.

	"Modified: / 21-06-2013 / 16:46:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:33:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"