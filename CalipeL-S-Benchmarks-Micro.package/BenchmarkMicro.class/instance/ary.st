benchmarks
ary
	<benchmark: 'Ary'>

	| n |

	n := ary1 size.
	1 to: 1000 do: [:ignored|
					n to: 1 by: -1 do: [:i| ary2 at: i put: (ary2 at: i) + (ary1 at: i)] ].

	"Created: / 11-06-2013 / 01:25:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"