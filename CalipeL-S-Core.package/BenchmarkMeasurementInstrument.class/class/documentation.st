documentation
documentation
"
	Measurement instrument provides a way to measure a particular
	aspect (time, number og GCs, invocations of some method...).

	One may create a custom instruments and hook them in to measure
	custom, application specific aspects.

	To run BenchmarkExamples with this instrument on, execute following:

		| suite executor |

		suite := BenchmarkSuite class: BenchmarkExamples.
		executor := BenchmarkExecutor new.
		executor instruments: { BenchmarkMeasurementInstrument new }.
		suite run: BenchmarkResultC new with: Dictionary new executor: executor.

	For more detailed description of measurement instruments
	see https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]
		BenchmarkExamplesInstrument
		https://bitbucket.org/janvrany/jv-calipel/wiki/Instruments.md
																	 

"