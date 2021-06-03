executing-private
setUp:aBenchmarkInstance parameters: aCollection
	[
		aCollection do:[:each|
			aBenchmarkInstance setUpParameter: each key value: each value
		].
		aBenchmarkInstance setUp.        
	] on: Error do:[:ex|
		(ex isKindOf: BenchmarkError) ifTrue:[
			ex pass
		] ifFalse:[
			BenchmarkExecutionError new signal:'Error during set-up: ', ex description.
		].

	]

	"Created: / 27-07-2013 / 12:31:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:14:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"