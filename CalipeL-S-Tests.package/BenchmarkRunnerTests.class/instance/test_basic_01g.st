tests
test_basic_01g

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--setup' 'Smalltalk at: #''test_basic_01g'' put: 12345' 'BenchmarkTestsSuiteA').
	[
	self assert: (Smalltalk includesKey:#'test_basic_01g').
	self assert: (Smalltalk at:#'test_basic_01g') == 12345.
	] ensure:[ 
		(Smalltalk includesKey:#'test_basic_01g') ifTrue:[ 
			Smalltalk removeKey:#'test_basic_01g'
		].
	].

	"Created: / 19-09-2013 / 22:43:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 16:27:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"