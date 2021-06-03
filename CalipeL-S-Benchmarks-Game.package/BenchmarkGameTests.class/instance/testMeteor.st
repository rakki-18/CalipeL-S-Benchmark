tests
testMeteor
	| result |
	result := BenchmarkGameMeteor meteor.
	self assert: result contents equals: BenchmarkGameMeteor output
