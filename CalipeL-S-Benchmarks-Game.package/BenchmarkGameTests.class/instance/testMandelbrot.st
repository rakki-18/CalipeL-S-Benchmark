tests
testMandelbrot
	| result |
	
	result := BenchmarkGameMandelbrot new mandelbrot2: 200.
	result reset. "set possition to beginning"
	
	self assert: result contents equals: BenchmarkGameMandelbrot output.
