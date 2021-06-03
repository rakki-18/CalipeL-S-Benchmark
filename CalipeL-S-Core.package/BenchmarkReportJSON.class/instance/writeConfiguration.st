writing
writeConfiguration
	json writeDictionaryWith: [
		description notNil ifTrue:[
			json writeKey: 'description' value: self description.
			json writeElementSeparator.
		].
		json writeKey: 'language'   value: 'Smalltalk'.
		json writeElementSeparator.
		json writeKey: 'runtime'    value: BenchmarkPlatform current configurationStringRuntime.
		json writeElementSeparator.
		json writeKey: 'os'         value: BenchmarkPlatform current configurationStringOS.
		json writeElementSeparator.
		json writeKey: 'machineid'   value: (BenchmarkPlatform current configurationStringMachineId)
	].

	"Created: / 22-06-2013 / 22:43:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-11-2013 / 21:45:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"