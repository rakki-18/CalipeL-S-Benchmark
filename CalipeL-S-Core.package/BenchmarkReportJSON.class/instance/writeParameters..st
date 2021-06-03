writing
writeParameters: outcome
	json writeDictionaryWith: [
		outcome parameters do:[:paramAndValue |
			json writeKey: paramAndValue key name value: paramAndValue value 
		] separatedBy:[
			json writeElementSeparator
		]
	]

	"Created: / 12-06-2013 / 14:10:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:58:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"