tests
test_basic_01h

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--teardown' 'Smalltalk at: #''test_basic_01g'' put: 12345' 'BenchmarkTestsSuiteA').
	[
	self assert: (Smalltalk includesKey:#'test_basic_01g').
	self assert: (Smalltalk at:#'test_basic_01g') == 12345.
	] ensure:[ 
		(Smalltalk includesKey:#'test_basic_01g') ifTrue:[ 
			Smalltalk removeKey:#'test_basic_01g'
		].
	].

	"Created: / 08-03-2014 / 16:27:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"