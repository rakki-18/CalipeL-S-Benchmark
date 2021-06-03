tests
test_03b

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new at: #param1 put: '4321'; yourself).

	self assert: param1 == 4321

	"Created: / 28-05-2013 / 00:05:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"