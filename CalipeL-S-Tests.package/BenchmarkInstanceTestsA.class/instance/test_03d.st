tests
test_03d

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param1' put: '9876'; 
						at: #'BenchmarkInstanceTestsA#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:06:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"