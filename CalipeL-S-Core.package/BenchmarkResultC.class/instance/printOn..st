printing & storing
printOn:aStream
	"append a printed representation if the receiver to the argument, aStream"

	aStream nextPutAll: 'Benchmark resut:'; cr.
	BenchmarkReport text write: self on: aStream

	"Modified: / 31-05-2013 / 10:38:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"