executing-private
warmUp: aBenchmarkInstance
	[
		aBenchmarkInstance warmUp.
	] on: Error do:[:ex|
		(ex isKindOf: BenchmarkError) ifTrue:[ 
			ex pass
		] ifFalse:[ 
			BenchmarkExecutionError new signal:'Error during warm-up: ', ex description.      
		]
	]

	"Created: / 24-06-2013 / 01:11:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 20-04-2015 / 12:45:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"