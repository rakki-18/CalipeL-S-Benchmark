writing
writeOutcomes
	"raise an error: must be redefined in concrete subclass(es)"
	json writeArrayWith:[
		result 
		   outcomesDo: [:outcome| self writeOutcome: outcome] 
		   separatedBy:[json writeElementSeparator]
	]

	"Created: / 11-06-2013 / 23:39:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 12-06-2013 / 14:06:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"