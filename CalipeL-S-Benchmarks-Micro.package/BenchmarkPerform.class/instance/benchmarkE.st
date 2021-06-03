benchmarks
benchmarkE
	<benchmark>

	| na sels r s args |

	na := 14.
	sels := selectors at: 1+na.
	args := Array new: na.
	1 to: iterations * 1000 do:[:i|
		r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
		s := sels at: (selindices at: ((i \\ nselectors) + 1)).

		r perform: s withArguments: args
	]

	"Created: / 20-07-2013 / 11:18:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:27:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"