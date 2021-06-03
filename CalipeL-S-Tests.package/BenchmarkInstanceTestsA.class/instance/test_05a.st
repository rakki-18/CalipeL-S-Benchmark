tests
test_05a
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake03a'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fake03"<--warmaup" #fakeSetUp #fakeSetUp1 #fake03)

	"Created: / 09-03-2014 / 22:53:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"