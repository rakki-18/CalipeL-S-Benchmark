tests
test_basic_01e

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-n' '1' '-Dmsecs=10,250' 'BenchmarkTestsSuiteA#benchmark2').



	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes first times size = 1.
	self assert: runner result outcomes first times first >= runner result outcomes first parameters first value.

	self assert: runner result outcomes second times size = 1.
	self assert: runner result outcomes second times first >= runner result outcomes second parameters first value.

	"Created: / 31-07-2013 / 00:06:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:16:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"