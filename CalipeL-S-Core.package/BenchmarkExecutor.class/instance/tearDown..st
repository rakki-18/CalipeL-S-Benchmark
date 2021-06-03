executing-private
tearDown: aBenchmarkInstance
	[
		aBenchmarkInstance tearDown.
	] on: Error do:[:ex|
		BenchmarkExecutionError new signal:'Error during tear-down: ', ex description.      
	]

	"Created: / 24-06-2013 / 01:12:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 31-07-2013 / 01:03:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"