examples - 02
example02SetupSortDataOrdered
	"This is a per-benchmark setup method used by benchmark
	 #example02a. This is specified there by annotation
	 <setup:>, so no need to annotate the method specially
	 here. Naturally, per-benchmark setup method can be shared
	 among multiple benchmarks.
	"
	sortdata := (1000 to: 1 by: -1) asArray.

	"Created: / 10-10-2015 / 16:22:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 15-10-2015 / 15:59:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"