testing
testObject
		| writer point |
		point := 1@2.
		writer := [ :object | 
				String streamContents: [ :stream |
						(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
		self assert: (writer value: point) equals: '{"x": 1,"y": 2}'.

	"Created: / 12-06-2013 / 13:46:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"