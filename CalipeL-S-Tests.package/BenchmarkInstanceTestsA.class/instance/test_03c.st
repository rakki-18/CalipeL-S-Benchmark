tests
test_03c

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
		r := b run: BenchmarkResultC new with: (Dictionary new at: #'BenchmarkInstanceTests#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:05:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"