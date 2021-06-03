writing
writeMeasurement: measurement
	measurement value ~~ BenchmarkMeasurementValueNotAvailable instance ifTrue:[  
		json writeDictionaryWith:[
			json writeKey: 'instrument' valueWith: [ self writeMeasurementInstrument: measurement instrument ].
			json writeElementSeparator.
			json writeKey: 'value' value: measurement value
		].
	].

	"Created: / 24-11-2014 / 23:41:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-12-2014 / 03:04:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"