tests
test_09a

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake09a'.
	r := b run: BenchmarkResultC new with: (Dictionary new
					at: 'param4' put:'1.0';
					yourself).

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fakeSetUp9 #fake09a #fakeSetUp #fakeSetUp1 #fakeSetUp9 #fake09a).

	"Created: / 30-09-2015 / 08:06:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"