tests
test_basic_01a

	| runner status |

	runner := BenchmarkRunner new.
	status := runner main: #('BenchmarkTestsSuiteA').

	self assert: status == BenchmarkRunner statusSuccess.
	self assert: runner result outcomes size = 2.

	"Created: / 19-07-2013 / 21:48:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 15:06:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"