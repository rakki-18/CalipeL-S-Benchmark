tests
test_05a

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param4' put: '0.0';
						at: #'param1' put: '9876';
						at: #'BenchmarkInstanceTestsB#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 30-07-2013 / 23:14:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:55 / Jan Vrany <jan.vrany@fit.cvut.cz>"