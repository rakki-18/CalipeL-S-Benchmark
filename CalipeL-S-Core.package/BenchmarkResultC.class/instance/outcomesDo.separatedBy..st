accessing
outcomesDo: aBlock separatedBy: anotherBlock
	"Iterate outcomes, perform given block.
	 outcomes are sorted by benchmark instance name first,
	 then by benchmark name"

	| classes classesOutcomes |
	classes := SortedCollection sortBlock:[:a :b|a name < b name].
	classesOutcomes := Dictionary new.
	outcomes do:[:each|
		(classes includes: each benchmark instance class) ifFalse:[
			classes add: each benchmark instance class.
		].
		(classesOutcomes at: each benchmark instance class ifAbsentPut:[SortedCollection sortBlock:[:a :b|a benchmark selector < b benchmark selector]])
			add: each.
	].
	classes 
		do:[:class|(classesOutcomes at: class) do: aBlock separatedBy: anotherBlock]
		separatedBy: anotherBlock

	"Created: / 11-06-2013 / 23:37:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"