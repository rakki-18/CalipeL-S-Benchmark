tests
test_04a

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b runWith:(Dictionary new at: 'param1' put:'10,20'; yourself).

	self assert: r outcomes size == 2.
	self assert: r outcomes first benchmark == b.
	self assert: r outcomes second benchmark == b.
	self assert: log asArray = #(#fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01 #fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01).

	"Created: / 27-07-2013 / 13:19:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:13:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"