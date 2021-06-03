tests
testChameleons
	self assert: (BenchmarkGameChameleons chameneos:     100) equals: 200. 
	self assert: (BenchmarkGameChameleons chameneos:   10000) equals: 20000.
	self assert: (BenchmarkGameChameleons chameneos: 1000000) equals: 2000000.
