writing
writeBenchmark: benchmark
	json writeDictionaryWith:[
		json writeKey: 'name' value: benchmark name.
		json writeElementSeparator.
		json writeKey: 'description' value: benchmark description.
		json writeElementSeparator.
		json writeKey: 'class' value: benchmark instance class name.
		json writeElementSeparator.
		json writeKey: 'selector' value: benchmark selector.
	]

	"Created: / 12-06-2013 / 14:10:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:27:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"