tests
test_07

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b
			run: BenchmarkResultC new
			with: (Dictionary new
					at: 'param4' put:'1.0';
					at: 'param5' put:'sequential,uniform';
					yourself).

	self assert: r outcomes size == 2.

	"Created: / 01-08-2013 / 23:41:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"