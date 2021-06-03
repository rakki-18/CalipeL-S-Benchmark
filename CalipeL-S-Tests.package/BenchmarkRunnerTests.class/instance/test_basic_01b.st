tests
test_basic_01b

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first >= 200.

	"Created: / 19-07-2013 / 21:49:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:29:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"