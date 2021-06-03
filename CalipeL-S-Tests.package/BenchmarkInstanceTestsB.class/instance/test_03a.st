tests
test_03a

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
		at: #'param4' put: '0.0';
		yourself).

	"parem1 is overridden here..."
	self assert: param1 == 5678

	"Created: / 09-03-2014 / 22:46:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"