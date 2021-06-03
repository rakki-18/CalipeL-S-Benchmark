initialization
initialize
	"Invoked when a new instance is created."

	super initialize.
	instruments := Array 
					with: BenchmarkExecutionTimeInstrument new

	"Modified (format): / 27-11-2014 / 13:42:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"