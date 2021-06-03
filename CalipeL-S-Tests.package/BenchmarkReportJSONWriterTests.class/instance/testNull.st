testing
testNull
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: nil) equals: 'null'
