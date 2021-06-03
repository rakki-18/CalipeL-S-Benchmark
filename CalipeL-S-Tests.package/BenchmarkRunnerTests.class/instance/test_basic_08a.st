tests
test_basic_08a

	| runner status |

	runner := BenchmarkRunner new.
	status := runner main: #('BenchmarkTestsSuiteA' 'BenchmarkTestsSuiteC').

	self assert: status == BenchmarkRunner statusFailure.
	self assert: runner result outcomes size = 2.

	"Created: / 22-10-2015 / 15:07:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"