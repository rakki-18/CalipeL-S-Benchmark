tests
test_04b

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b runWith:(Dictionary new at: 'param1' put:'10,20'; at: 'param2' put:'1234,9876'; yourself).

	self assert: r outcomes size == 4.
	self assert: r outcomes first benchmark == b.
	self assert: r outcomes second benchmark == b.

	"Created: / 27-07-2013 / 13:20:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"