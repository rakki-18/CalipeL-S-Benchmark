tests
test_basic_05e

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description \
"Allow shell-like continuation"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Allow shell-like continuation').

	"Created: / 08-03-2014 / 11:11:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"