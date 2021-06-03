tests
test_08a
	"Tests benchmark skip"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'skipped01'.
	r := b run.

	self assert: r outcomes isEmpty.

	"Created: / 20-04-2015 / 12:38:01 / Jan Vrany <jan.vrany@fit.cvut.cz>"