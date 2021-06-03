tests
test_basic_05b

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description "Something with \"space\" in there"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Something with "space" in there').

	"Created: / 08-03-2014 / 11:08:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"