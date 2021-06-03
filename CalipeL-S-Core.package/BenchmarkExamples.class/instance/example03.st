examples - 03
example03
	<benchmark: 'Sort (with warmup)'>
	<setup: #example02SetupSortDataRandom>
	<warmup: #example02Warmup>

	| data |

	1000 timesRepeat: [
		data := sortdata copy.
		data sort: sortblock
	].

	"
	(BenchmarkInstance class: BenchmarkExamples selector: #example03) run
	"

	"Created: / 10-10-2015 / 18:22:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"