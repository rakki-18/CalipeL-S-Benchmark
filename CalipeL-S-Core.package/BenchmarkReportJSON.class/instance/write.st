writing
write
	json writeDictionaryWith:[ 
		json writeKey: 'tags' value: self name.
		json writeElementSeparator.
		json writeKey: 'timestamp' value: result timestamp printISO8601.
		json writeElementSeparator.
		json writeKey: 'configuration' valueWith: [ self writeConfiguration ].
		json writeElementSeparator.
		json writeKey: 'outcomes' valueWith: [ self writeOutcomes ]
	].

	"Created: / 12-06-2013 / 14:03:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 19-09-2013 / 23:27:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"