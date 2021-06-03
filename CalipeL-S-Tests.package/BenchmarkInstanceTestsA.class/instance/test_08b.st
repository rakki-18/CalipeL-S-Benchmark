tests
test_08b
	"Tests benchmark skip"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'skipped02'.
	r := b run.

	self assert: r outcomes isEmpty.

	"Created: / 20-04-2015 / 12:41:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"