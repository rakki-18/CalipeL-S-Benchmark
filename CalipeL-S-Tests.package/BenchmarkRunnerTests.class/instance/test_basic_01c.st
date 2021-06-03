tests
test_basic_01c

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-Dmsecs=10' 'BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first < 200.

	"Created: / 19-07-2013 / 21:49:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:30:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"