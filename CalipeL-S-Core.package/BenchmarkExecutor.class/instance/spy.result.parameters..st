profiling-private
spy: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection
	"
	Takes a benchmark instance and a set of parameter defines,
	runs it under MessageTally profiler and show profiling results.
	"

	| measurements outcome |

	[
		self setUp:aBenchmarkInstance parameters: aCollection .
		self warmUp: aBenchmarkInstance.
		measurements := Array with: (self spy: aBenchmarkInstance).
		aBenchmarkResult addOutcome:
			(outcome := BenchmarkOutcome 
				benchmark: aBenchmarkInstance
				parameters: aCollection
				measurements: measurements).     

	] ensure:[
		self tearDown: aBenchmarkInstance
	].
	^ outcome

	"Created: / 21-05-2014 / 10:44:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-12-2014 / 16:03:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"