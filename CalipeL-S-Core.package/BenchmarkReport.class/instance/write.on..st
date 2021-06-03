writing
write: aBenchmarkResult on: aStream
	self stream: aStream.
	self result: aBenchmarkResult.
	self write.

	"Created: / 28-05-2013 / 00:33:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"