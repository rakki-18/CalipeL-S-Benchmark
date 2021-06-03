Extension { #name : #String }

{ #category : #'*Compatibility-SmalltalkX' }
String >> asFilename [
	^self asFileReference 
]
