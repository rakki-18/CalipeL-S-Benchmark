tests
test_03f

	| b |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	self should: [
		b runWith: (Dictionary new 
						at: #'param1' put: 'asdf'; yourself).
	] raise: BenchmarkParameterError.

	"Created: / 28-05-2013 / 00:12:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"