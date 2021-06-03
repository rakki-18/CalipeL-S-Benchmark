tests
test_07a
	"Tests custom instrument"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run: BenchmarkResultC new with: Dictionary new executor: (BenchmarkExecutor new instruments: (Array with: self)).

	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (r outcomes anyOne measurements anyOne contains:[:e | e instrument == self]).

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2)

	"Created: / 27-11-2014 / 23:58:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"