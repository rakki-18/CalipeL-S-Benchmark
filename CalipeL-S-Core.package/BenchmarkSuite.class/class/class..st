instance creation
class: class 
	| suite current |

	suite := self new.
	current := class.
	[ current notNil ] whileTrue:[
		current selectorsAndMethodsDo:[:selector :method|
			(BenchmarkInstance isBenchmarkMethod: method) ifTrue:[
				suite addBenchmark: (BenchmarkInstance class:class selector:selector)
			].
		].
		current := current superclass.
	].
	^suite

	"Created: / 28-05-2013 / 19:49:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 01:51:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"