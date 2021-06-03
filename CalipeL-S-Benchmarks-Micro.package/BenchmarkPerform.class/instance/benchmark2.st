benchmarks
benchmark2
	<benchmark>

	| sels r s|

	sels := selectors at: 1+2.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s with: 1 with: 2.
	]

	"Created: / 20-07-2013 / 11:14:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 23:29:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"