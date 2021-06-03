description - contents
classNamesAndAttributes
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		BenchmarkExamplesTests
		BenchmarkInstanceTestsA
		BenchmarkReportJSONWriterTests
		BenchmarkRunnerTests
		BenchmarkSuiteTests
		BenchmarkTestsLog
		BenchmarkTestsSuiteA
		BenchmarkTestsSuiteB
		BenchmarkTestsSuiteC
		#'jv_calipel_s_tests'
		BenchmarkInstanceTestsB
	)