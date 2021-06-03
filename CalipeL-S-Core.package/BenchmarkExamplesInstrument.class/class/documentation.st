documentation
documentation
"
	This class is an example of a custom measurement instrument.
	It does measure execution time in seconds.

	Note, that instrument measuring time execution time is
	included in Calipel by default, this class is merely an 
	example.

	Note, that the value measured by this instrument will differ
	from the value measured by built-in time measurement since
	the measurement not performent at the same time. So for short
	benchmarks like those in BenchmarkExamples the difference will be
	significant.

	To run BenchmarkExamples with this instrument on, execute:

		| suite executor |
		suite := BenchmarkSuite class: BenchmarkExamples.
		executor := BenchmarkExecutor new.
		executor instruments: { BenchmarkExamplesInstrument new }.
		suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	For more detailed description of measurement instruments
	see https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		BenchmarkExecutionTimeInstrument
		https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md


"