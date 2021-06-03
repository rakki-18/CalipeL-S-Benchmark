benchmarking
benchFannkuchRedux
	<benchmark: 'Fannkuch-Redux'>

	| f  |
	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameFannkuchRedux defaultProblemSize 
	].
	f := BenchmarkGameFannkuchRedux fannkuchRedux: problemSize to: (TextStream with: String new).
   
		" the output should only be done by some reporter"
		"ScriptConsole print: 'Pfannkuchen(', problemSize asString , ') = ', f asString."
   ^f

	"Modified: / 23-06-2013 / 02:31:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"