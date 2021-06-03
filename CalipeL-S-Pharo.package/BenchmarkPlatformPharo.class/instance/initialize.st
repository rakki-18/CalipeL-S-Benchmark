queries
initialize
	super initialize.
	instruments := Array 
					with: BenchmarkExecutionTimeInstrument  new 
					with: BenchmarkFullGarbageCollectCountInstrument new
					with: BenchmarkGCTimeInstrument new