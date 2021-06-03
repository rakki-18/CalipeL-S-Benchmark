Class {
	#name : #BenchmarkSkipRequest,
	#superclass : #BenchmarkError,
	#category : #'CalipeL-S-Core-Exceptions'
}

{ #category : #documentation }
BenchmarkSkipRequest class >> documentation [
"
	When thrown during benchmark execution (including it's set up), the benchmark
	is sinlently skipped. Use this to skip unsupported or otherwise not runnable benchmarks.
	To skip a benchmark, simply add

		BenchmarkSkipRequest signal

	to set-up or benchmark method. You may want to do this conditionally
	based on whether a benchmark is runnable or not.

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]

"
]
