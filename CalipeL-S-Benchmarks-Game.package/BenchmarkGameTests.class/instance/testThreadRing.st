tests
testThreadRing
	| result |
	result := BenchmarkGameThreadRing threadring: 1000.
	self assert: result equals: 498
