accessing - tests
testSuite
	| tests |

	tests := self package , '/tests'.
	Smalltalk loadPackage: tests.
	^((Smalltalk at: #ProjectDefinition) definitionClassForPackage: tests) testSuite

	"Created: / 09-06-2013 / 22:23:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:23:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"