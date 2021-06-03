executing-private
benchmark: aBenchmarkInstance
	| measurements |
	[
		measurements := aBenchmarkInstance benchmarkUsingInstruments: (BenchmarkPlatform current instruments) , instruments.
	] on: Error do:[:ex|
		BenchmarkExecutionError new signal:'Error during measurement: ', ex description.      
	].
	^measurements

	"Created: / 24-11-2014 / 00:18:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 13:43:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"