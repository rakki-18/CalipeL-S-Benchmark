testing
testMaps
		| writer dictionary json |
		dictionary := Dictionary new.
		dictionary at: #x put: 1.
		dictionary at: #y put: 2.
		writer := [ :object | 
				String streamContents: [ :stream |
						(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
		json := writer value: dictionary.
		self assert:  (json = '{"x": 1,"y": 2}' or:[ json = '{"y": 2,"x": 1}' ]).
		json := writer value: Dictionary new.
		self assert: json = '{}'

	"Modified: / 26-10-2014 / 23:08:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"