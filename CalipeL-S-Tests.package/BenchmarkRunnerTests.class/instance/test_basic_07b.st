tests
test_basic_07b
	"Test custom instruments"

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--instrument' 'BenchmarkInstanceTestsA' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes anyOne measurements size == 5.
	self assert: runner result outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (runner result outcomes anyOne measurements anyOne contains:[:e | e instrument class == BenchmarkInstanceTestsA ]).

	"Created: / 28-11-2014 / 00:17:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"