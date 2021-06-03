Class {
	#name : #BenchmarkReportJSONWriter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'indent'
	],
	#classVars : [
		'EscapeTable',
		'Rules'
	],
	#category : #'CalipeL-S-Core-Reports'
}

{ #category : #documentation }
BenchmarkReportJSONWriter class >> documentation [
"
	Simple, portable JSON writer.
	
	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz> (adaptation for CalipeL)

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #initialization }
BenchmarkReportJSONWriter class >> initialize [
	"Invoked at system start or when the class is dynamically loaded."

	EscapeTable := Dictionary new.
	EscapeTable at:  8 put: '\b'.
	EscapeTable at:  9 put: '\t'.
	EscapeTable at: 10 put: '\n'.
	EscapeTable at: 12 put: '\f'.
	EscapeTable at: 13 put: '\r'.
	EscapeTable at: 34 put: '\"'.
	EscapeTable at: 92 put: '\\'.

	Rules := OrderedCollection new.
	Rules add: [:obj | obj isNil ];             add:#writeNull: .
	Rules add: [:obj | obj isString ];          add:#writeString: .
	Rules add: [:obj | obj isBoolean ];         add:#writeBoolean: .
	Rules add: [:obj | obj isInteger ];         add:#writeInteger: .
	Rules add: [:obj | obj isFloat ];           add:#writeFloat: .
	"CalipeL/S specific mappings"
	Rules add: [:obj | obj isClass ];           add:#writeClass: .

	"Modified: / 12-06-2013 / 13:53:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 16-06-2013 / 00:53:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkReportJSONWriter class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #'instance creation' }
BenchmarkReportJSONWriter class >> on: writeStream [
	"Initialize on writeStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	^ self new
		on: writeStream;
		yourself

]

{ #category : #convenience }
BenchmarkReportJSONWriter class >> toString: object [
	^ String streamContents: [ :stream |
			(self on: stream) nextPut: object ]

]

{ #category : #convenience }
BenchmarkReportJSONWriter class >> toStringPretty: object [
	^ String streamContents: [ :stream |
			(self on: stream)
				prettyPrint: true; 
				nextPut: object ]

]

{ #category : #documentation }
BenchmarkReportJSONWriter class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkReportJSONWriter >> close [
	stream ifNotNil: [
		stream close.
		stream := nil ]

]

{ #category : #private }
BenchmarkReportJSONWriter >> encode: string [

	string do:[:char|
		| code escape |

		code := char codePoint.
		escape := EscapeTable at: code ifAbsent:[nil].
		escape notNil ifTrue:[
			stream nextPutAll: escape
		] ifFalse:[
			(code < 32 or:[code > 127]) ifTrue:[
				self error: 'Unimplemented \u escaping'.
			] ifFalse:[
				stream nextPut: char.
			]
		]
	].

	"Created: / 12-06-2013 / 13:42:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'initialize-release' }
BenchmarkReportJSONWriter >> initialize [
		super initialize.
		indent := 0

	"Modified: / 12-06-2013 / 14:00:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'stream protocol' }
BenchmarkReportJSONWriter >> nextPut: anObject [
	self write: anObject

	"Modified: / 12-06-2013 / 11:06:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'stream protocol' }
BenchmarkReportJSONWriter >> nextPutAll: anObject [
	self write: anObject

	"Created: / 12-06-2013 / 11:07:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'initialize-release' }
BenchmarkReportJSONWriter >> on: aWriteStream [
	"Initialize on aWriteStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	stream := aWriteStream

]

{ #category : #writing }
BenchmarkReportJSONWriter >> write: anObject [

	1 to: Rules size by: 2 do:[:i|
		((Rules at: i) value: anObject) ifTrue:[
			self perform: (Rules at: i + 1) with: anObject.
			^self.
		]        
	].
	anObject isSequenceable ifTrue:[
		self writeArray: anObject.
		^self
	].
	anObject isDictionary ifTrue:[
		self writeDictionary: anObject.
		^self
	].
	self writeObject: anObject

	"Created: / 12-06-2013 / 11:00:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeArray:collection [ 
	self writeArrayWith:[
		collection 
			do:[:each | self write: each ]
			separatedBy:[ self writeElementSeparator ].
	]

	"Modified: / 12-06-2013 / 14:02:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeArrayWith:block [ 
	stream nextPut: $[.
	indent := indent + 1.
	block value.
	indent := indent - 1.
	stream nextPut: $]

	"Created: / 12-06-2013 / 14:01:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeBoolean: boolean [
	boolean printOn: stream

]

{ #category : #'writing - CalipeL-S extras' }
BenchmarkReportJSONWriter >> writeClass: aClass [
	^self writeString: aClass name

	"Created: / 12-06-2013 / 13:52:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeDictionary:dictionary [ 
	self writeDictionaryWith:[
		dictionary associations
			do:[:each | self writeKey: each key value: each value ]
			separatedBy:[ self writeElementSeparator ].
	]

	"Modified: / 12-06-2013 / 14:02:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeDictionaryWith:block [
	stream nextPut: ${.
	indent := indent + 1.
	block value.
	indent := indent - 1.
	stream nextPut: $}

	"Created: / 12-06-2013 / 14:01:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeElementSeparator [
	stream nextPut:$,.

	"Modified: / 12-06-2013 / 13:42:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeFloat: float [
	float printOn: stream

]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeInteger: integer [
	integer printOn: stream
	

]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeKey: key value: value [ 
	self write: key.
	stream nextPutAll:': '.
	self write: value

	"Created: / 12-06-2013 / 13:59:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeKey: key valueWith: block [ 
	self write: key.
	stream nextPutAll:': '.
	block value

	"Created: / 12-06-2013 / 14:08:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeNull: anObject [
	stream nextPutAll: 'null'

	"Created: / 12-06-2013 / 11:09:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeObject: anObject [
	"Objects are written as dictionaries instvarname -> instvar value"

	| instvars |

	instvars := anObject class allInstVarNames.
	stream nextPut: ${.
	indent := indent + 1.
	instvars withIndexDo:[:nm :i|
		self writeKey: nm value: (anObject instVarAt: i).        
		i ~~ instvars size ifTrue:[
			self writeElementSeparator.
		]
	].
	indent := indent - 1.
	stream nextPut: $}

	"Modified: / 12-06-2013 / 13:59:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSONWriter >> writeString: string [
	stream nextPut: $".
	self encode: string.
	stream nextPut: $"

	"Modified: / 12-06-2013 / 13:43:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
