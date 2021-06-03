benchmarks
benchmark4
	<benchmark>

	| na sels r s args |

	na := 4.
	sels := selectors at: 1+na.
	args := Array new: na.
	hasPerformWith4 ifTrue:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s with: 1 with: 2 with: 3 with: 4.
		]
	] ifFalse:[
		1 to: iterations * 1000 do:[:i|
			r := receivers at: (recindices at: ((i \\ nreceivers) + 1)).
			s := sels at: (selindices at: ((i \\ nselectors) + 1)).

			r perform: s withArguments: args
		]
	]

	"Created: / 20-07-2013 / 11:15:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 16-10-2015 / 19:57:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"