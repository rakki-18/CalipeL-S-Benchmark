examples - 02
example02Setup
	"By annotation a method with <setup>, the method
	 becomes a setup method for all benchmarks defined
	 in this class (and subclasses). If you want per-benchmark
	 setup method, annotate the method defining a benchmark
	 also with <setup: #specialSetupForThatBenchmark>."

	<setup>

	sortblock := [ :a :b | a > b ]

	"Created: / 10-10-2015 / 16:21:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"