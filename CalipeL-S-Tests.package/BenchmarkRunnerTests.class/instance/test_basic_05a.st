tests
test_basic_05a

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '#!./benchmark-runner.sh --json
			Suite1#bench1'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('Suite1#bench1')

	"Created: / 08-03-2014 / 11:06:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"