examples - 02
example02a
	<benchmark: 'Sort (random)'>
	<setup: #example02SetupSortDataRandom>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example02a) run
	"

	"Created: / 10-10-2015 / 16:11:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"