tests
test_03a

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: Dictionary new.

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:04:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"