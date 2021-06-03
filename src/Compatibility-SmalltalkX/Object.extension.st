Extension { #name : #Object }

{ #category : #'*Compatibility-SmalltalkX' }
Object >> isBoolean [
	^false
]

{ #category : #'*Compatibility-SmalltalkX' }
Object >> isClass [
	^false
]

{ #category : #'*Compatibility-SmalltalkX' }
Object >> isSequenceable [
	^false
]

{ #category : #'*Compatibility-SmalltalkX' }
Object class >> readFrom: aStringOrStream onError: aBlock [
	^ [ 
		self readFrom: aStringOrStream 
	] on: Error do:[
		aBlock value
	]
]
