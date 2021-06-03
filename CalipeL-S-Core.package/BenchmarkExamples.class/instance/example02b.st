examples - 02
example02b
	<benchmark: 'Sort (ordered)'>
	<setup: #example02SetupSortDataOrdered>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example02b) run
	"

	"Created: / 10-10-2015 / 16:21:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"