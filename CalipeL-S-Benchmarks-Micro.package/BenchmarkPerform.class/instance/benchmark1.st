benchmarks
benchmark1
	<benchmark>

	| sels r s|

	sels := selectors at: 1+1.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s with: 1
	]

	"Created: / 20-07-2013 / 11:14:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 23:29:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"