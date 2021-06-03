tests
test_06a
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04a'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1)

	"Created: / 09-03-2014 / 23:36:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"