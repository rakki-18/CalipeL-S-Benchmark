writing
writeOutcome:outcome
	json writeDictionaryWith:[
		json writeKey: 'benchmark' valueWith: [ self writeBenchmark: outcome benchmark ].
		json writeElementSeparator.
		json writeKey: 'measurements' valueWith: [ self writeMeasurements: outcome measurements ].
		json writeElementSeparator.        
		json writeKey: 'parameters' valueWith: [ self writeParameters: outcome ].
		json writeElementSeparator.        
		"For backward compatibility, will wanish"
		json writeKey: 'times' value: outcome times.
	]

	"Modified: / 24-11-2014 / 23:36:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"