tests
test_01

	| b r |

	b := BenchmarkInstance new instance:self selector:#fake01.
	r := b run.

	self assert: r outcomes size == 1.
	self assert: r outcomes anyOne benchmark == b.
	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == BenchmarkPlatform current instruments size.
	self assert: (r outcomes anyOne measurements anyOne allSatisfy:[:each | BenchmarkPlatform current instruments includes: each instrument ]).

	self assert: log asArray = #(#fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01 ).

	"Created: / 27-05-2013 / 22:08:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 23:58:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"