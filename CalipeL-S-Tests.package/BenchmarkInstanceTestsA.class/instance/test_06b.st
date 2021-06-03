tests
test_06b
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2)

	"Created: / 09-03-2014 / 23:36:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"