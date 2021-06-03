benchmarking
benchChameleons
		<benchmark: 'Chameleons'>

		| result  |
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameChameleons defaultProblemSize
].
		result := BenchmarkGameChameleons chameneos: problemSize.
		
		"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
		"self flag: 'TODO adapt once verification is supported'."
		result = (2 * problemSize) ifFalse: [
				Error signal: (BenchmarkGameChameleons name, ' benchmark failed. Input: ', 
																 problemSize asString, ' Output: ', result asString).
		].

	"Modified: / 23-06-2013 / 02:34:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"