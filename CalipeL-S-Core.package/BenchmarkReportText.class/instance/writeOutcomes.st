writing
writeOutcomes
	| class |

	class := nil.
	result outcomesDo:[:outcome |
		outcome benchmark instance class == class ifFalse:[
			class := outcome benchmark instance class.
			stream cr; nextPutAll: class name; cr.
		].
		self writeOutcome: outcome
	].
	stream cr.

	"Created: / 11-06-2013 / 23:24:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 25-11-2014 / 01:45:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"