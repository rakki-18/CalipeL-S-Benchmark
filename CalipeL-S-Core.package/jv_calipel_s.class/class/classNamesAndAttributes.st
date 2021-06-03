description - contents
classNamesAndAttributes
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		Benchmark
		BenchmarkError
		BenchmarkExamples
		BenchmarkExamplesInstrument
		BenchmarkExecutionFailure
		BenchmarkExecutor
		BenchmarkInstance
		BenchmarkMeasurement
		BenchmarkMeasurementInstrument
		BenchmarkMeasurementValueNotAvailable
		BenchmarkOutcome
		BenchmarkParameter
		BenchmarkPlatform
		BenchmarkReport
		BenchmarkReportJSONWriter
		BenchmarkResultC
		BenchmarkRunner
		BenchmarkSuite
		#'jv_calipel_s'
		BenchmarkCountingInstrument
		BenchmarkExecutionError
		BenchmarkExecutionTimeInstrument
		BenchmarkParameterError
		BenchmarkReportJSON
		BenchmarkReportText
		BenchmarkRunnerExecutor
		BenchmarkSkipRequest
	)