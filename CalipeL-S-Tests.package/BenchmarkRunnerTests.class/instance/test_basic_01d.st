tests
test_basic_01d

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-n' '1' '-Dmsecs=10' 'BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 1.
	self assert: runner result outcomes anyOne times first < 200.

	"Created: / 19-07-2013 / 21:49:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:30:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"