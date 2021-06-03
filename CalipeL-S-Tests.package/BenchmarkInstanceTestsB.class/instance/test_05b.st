tests
test_05b

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param4' put: '0.0';
						at: #'param1' put: '9876';
						at: #'BenchmarkInstanceTestsA#param1' put: '1234'; yourself).

	self assert: param1 == 9876

	"Created: / 30-07-2013 / 23:14:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"