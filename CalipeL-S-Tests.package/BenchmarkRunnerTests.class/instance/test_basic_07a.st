tests
test_basic_07a
	"Test custom instruments"

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-i' 'BenchmarkInstanceTestsA' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes anyOne measurements size == 5.
	self assert: runner result outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (runner result outcomes anyOne measurements anyOne contains:[:e | e instrument class == BenchmarkInstanceTestsA ]).

	"Created: / 28-11-2014 / 00:05:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"