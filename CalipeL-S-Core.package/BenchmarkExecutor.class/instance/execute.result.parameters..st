executing-private
execute: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection
	"
	Takes a benchmark instance and a set of parameter defines,
	executes the benchmark and an outcome to the result. Returns that
	outcome or nil if benchmark has been skipped.

	This is where real execution happens"

	| measurements outcome |

	[
		"First, warm it up"
		[ 
			self setUp:aBenchmarkInstance parameters: aCollection.  
			self warmUp: aBenchmarkInstance.
		] ensure:[
			self tearDown: aBenchmarkInstance
		].

		measurements := (1 to: aBenchmarkResult runs) collect:[:i | 
			[
				self setUp:aBenchmarkInstance parameters: aCollection.  
				self benchmark: aBenchmarkInstance 
			] ensure:[
				self tearDown: aBenchmarkInstance
			].
		].
		aBenchmarkResult addOutcome:
			(outcome := BenchmarkOutcome 
				benchmark: aBenchmarkInstance
				parameters: aCollection
				measurements: measurements).     
	] on: BenchmarkSkipRequest do:[:ex | 
		outcome := nil.
	].
	^ outcome

	"Created: / 27-07-2013 / 12:32:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 20-04-2015 / 12:44:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"