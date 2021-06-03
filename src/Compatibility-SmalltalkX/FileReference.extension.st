Extension { #name : #FileReference }

{ #category : #'*Compatibility-SmalltalkX' }
FileReference >> asFilename [
	^self
]

{ #category : #'*Compatibility-SmalltalkX' }
FileReference class >> newTemporary [
	"Return new temporary file. 
	 Note that this method is by definition insecure - 
	 it may happen that somebody else will open file with
	 the same name..."
	^self newTempFilePrefix: '' suffix: 'tmp'
]

{ #category : #'*Compatibility-SmalltalkX' }
FileReference >> pathName [
	^String streamContents: [ :s |
		| segments |
		
		segments := self path segments.
		segments do:[:segment |
			s nextPutAll: segment.
			segment == segments last ifFalse:[
				s nextPut: DiskStore delimiter 
			]
		]
	]
	
]

{ #category : #'*Compatibility-SmalltalkX' }
FileReference >> readingFileDo: aBlock [
	| s |
	s := self readStream.
	[ 
		aBlock value: s
	] ensure: [
		s close.
	]
]

{ #category : #'*Compatibility-SmalltalkX' }
FileReference >> remove [
	self delete
]

{ #category : #'*Compatibility-SmalltalkX' }
FileReference >> writingFileDo: aBlock [
	| s |
	s := self writeStream.
	[ 
		aBlock value: s
	] ensure: [
		s close.
	]
]
