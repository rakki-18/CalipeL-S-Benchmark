Class {
	#name : #BenchmarkReportJSONWriterTests,
	#superclass : #TestCase,
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkReportJSONWriterTests class >> documentation [
"
	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz> (adaptation for CalipeL)

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #documentation }
BenchmarkReportJSONWriterTests class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testBooleans [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: true) equals: 'true'.
	self assert: (writer value: false) equals: 'false'.

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testByteArray [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: #[1 2 3]) equals: '[1,2,3]'.
	self assert: (writer value: #[]) equals: '[]'

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testFloats [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: 123.0) equals: '123.0'.
	self assert: (writer value: -123.0) equals: '-123.0'.
	self assert: (writer value: 0.0) equals: '0.0'.

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testIntegers [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: 123) equals: '123'.
	self assert: (writer value: -123) equals: '-123'.
	self assert: (writer value: 0) equals: '0'.

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testLists [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: #(1 2 3)) equals: '[1,2,3]'.
	self assert: (writer value: #()) equals: '[]'.

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testMaps [
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
]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testNull [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: nil) equals: 'null'

]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testObject [
		| writer point |
		point := 1@2.
		writer := [ :object | 
				String streamContents: [ :stream |
						(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
		self assert: (writer value: point) equals: '{"x": 1,"y": 2}'.

	"Created: / 12-06-2013 / 13:46:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testStrings [
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
]

{ #category : #testing }
BenchmarkReportJSONWriterTests >> testSymbol [
	| writer |
	writer := [ :object | 
		String streamContents: [ :stream |
			(BenchmarkReportJSONWriter on: stream) nextPut: object ] ].
	self assert: (writer value: #foo) equals: '"foo"'.
	self assert: (writer value: #'FOO-1') equals: '"FOO-1"'

]
