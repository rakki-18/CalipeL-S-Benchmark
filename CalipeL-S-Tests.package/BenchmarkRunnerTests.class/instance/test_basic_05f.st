tests
test_basic_05f

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description
"Next line"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Next line').

	"Created: / 08-03-2014 / 15:49:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"