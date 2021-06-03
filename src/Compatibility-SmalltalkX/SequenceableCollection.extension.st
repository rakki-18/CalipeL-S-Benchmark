Extension { #name : #SequenceableCollection }

{ #category : #'*Compatibility-SmalltalkX' }
SequenceableCollection >> copyFrom: index1 [
	^self copyFrom: index1  to:  self size
]

{ #category : #'*Compatibility-SmalltalkX' }
SequenceableCollection >> copyTo: index2 [
	^self copyFrom: 1 to: index2
]
