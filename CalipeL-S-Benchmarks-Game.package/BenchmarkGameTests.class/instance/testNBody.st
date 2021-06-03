tests
testNBody
	| result |
	result := BenchmarkGameNBody nbody: 1000.
	
	self assert: (((result at: 2) asString) beginsWith: '-0.169087605')
