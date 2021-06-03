tests
test_05b
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake03b'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fakeSetUp2 #fake03"<--warmaup" #fakeSetUp #fakeSetUp1 #fakeSetUp2 #fake03)

	"Created: / 09-03-2014 / 22:58:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"