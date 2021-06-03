tests
test_basic_05d

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description "Something with newline
in there"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Something with newline
in there').

	"Created: / 08-03-2014 / 11:10:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"