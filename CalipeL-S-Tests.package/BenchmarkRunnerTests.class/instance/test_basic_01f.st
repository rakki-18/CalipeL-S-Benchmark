tests
test_basic_01f

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--json' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.

	"Created: / 12-08-2013 / 18:23:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"