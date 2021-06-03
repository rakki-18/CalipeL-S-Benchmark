benchmarking
benchMandelbrot
	"<benchmark: 'Mandelbrot'>"

		| result bench |
		bench := BenchmarkGameMandelbrot new.
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameMandelbrot defaultProblemSize
].
		result := bench mandelbrot2: problemSize.
		result reset.
		^ result contents

	"Modified (comment): / 23-06-2013 / 02:32:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"