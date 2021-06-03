examples - 01
example01
	"A very simple benchmark for factorial.

	 Benchmark is simply any method in any class which is annotated by
	 `<benchmark>` or `<benchmark: 'Nice name'>` annotation:
	"
	<benchmark: 'Example 01 - Factorial'>

	10000 timesRepeat:[ 100 factorial ].

	"To run this benchmark from an image, inspect result of:

		(BenchmarkSuite class: BenchmarkExamples selector: #example01) run

	 The above expression will return an instance of BenchmarkResultC with 
	 all benchmark data.

	 To run the benchmark from a command line (which is prefered way
	 when measuring for real), execute (when using Smalltalk/X):

		 ./benchmark-runner.sh BenchmarkExamples#example01

	or (when using Pharo):

		./pharo PetitParser.image benchmark BenchmarkExamples#example01

	For more details about command line execution see
	https://bitbucket.org/janvrany/jv-calipel/wiki/Running.md
	"

	"Created: / 10-10-2015 / 09:49:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"