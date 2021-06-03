accessing
outcomesDo: aBlock
	"Iterate outcomes, perform given block.
	 outcomes are sorted by benchmark instance name first,
	 then by benchmark name"

	^self outcomesDo: aBlock separatedBy: nil

	"Created: / 11-06-2013 / 23:11:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"