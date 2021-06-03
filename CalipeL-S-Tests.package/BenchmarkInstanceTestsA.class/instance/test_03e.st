tests
test_03e

	| b |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	self should: [
		b runWith: (Dictionary new 
						at: #'param2' put: '5555'; yourself).
	] raise: BenchmarkParameterError.

	"Created: / 28-05-2013 / 00:11:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"