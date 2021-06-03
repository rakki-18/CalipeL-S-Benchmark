tests
test_basic_05g

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '#!./benchmark-runner.sh --json
			 # Simple script
			 # to test comments
			Suite1#bench1
			# Another commeht here...

			# And here...

			'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('Suite1#bench1')

	"Created: / 08-03-2014 / 15:57:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"