*Compatibility-SmalltalkX
pathName
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
	