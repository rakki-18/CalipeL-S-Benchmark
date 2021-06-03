testing
testStrings
		| writer |
		writer := [ :object | 
				String streamContents: [ :stream |
						(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
		self assert: (writer value: 'foo') equals: '"foo"'.
		self assert: (writer value: 'Foo BAR') equals: '"Foo BAR"'.
		self assert: (writer value: '') equals: '""'.
		self
				assert: (writer value: (String withAll: { 
										$". $\. $/. Character tab. Character lf.  Character newPage. Character backspace }))
				equals: '"\"\\/\t\n\f\b"'

	"Modified: / 12-06-2013 / 13:45:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"