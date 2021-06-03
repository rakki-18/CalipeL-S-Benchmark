benchmarks
benchmark0
	<benchmark>

	| sels r s |

	sels := selectors at: 1+0.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s
	].

	"
	BenchmarkPerform run: #benchmark0
	"

	"Created: / 20-07-2013 / 11:13:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 01-08-2013 / 23:22:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"