tests
test_07b
	"Tests custom instrument"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run: BenchmarkResultC new with: Dictionary new executor: (BenchmarkExecutor new instruments: (Array with: self)).

	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (r outcomes anyOne measurements anyOne contains:[:e | e instrument == self]).

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2).

	String streamContents: [:s | BenchmarkReport text write: r on: s ]

	"Created: / 01-12-2014 / 02:57:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"