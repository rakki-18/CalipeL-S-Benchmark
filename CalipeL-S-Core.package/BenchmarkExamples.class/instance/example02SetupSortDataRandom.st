examples - 02
example02SetupSortDataRandom
	"This is a per-benchmark setup method used by benchmark
	 #example02a. This is specified there by annotation
	 <setup:>, so no need to annotate the method specially
	 here. Naturally, per-benchmark setup method can be shared
	 among multiple benchmarks.
	"
	| random |

	random := Random new.
	random seed: 13.
	sortdata := (1 to: 1000) collect: [ :e | random nextInt: 1000 ].

	"Created: / 10-10-2015 / 16:19:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 15-10-2015 / 15:59:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"