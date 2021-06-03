tests
test_02

	self 
		should: [BenchmarkInstance class:self class selector:#'non_existent_benchmark']
		raise: Error

	"Created: / 27-05-2013 / 22:13:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"