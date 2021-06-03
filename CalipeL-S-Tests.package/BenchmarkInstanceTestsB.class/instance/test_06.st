tests
test_06

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	"param4 value's missing..."
	self should:[
		r := b run: BenchmarkResultC new with: (Dictionary new
							yourself).
	] raise: BenchmarkParameterError.

	"Created: / 30-07-2013 / 23:42:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"