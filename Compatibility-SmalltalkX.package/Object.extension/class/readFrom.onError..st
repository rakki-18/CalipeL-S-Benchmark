*Compatibility-SmalltalkX
readFrom: aStringOrStream onError: aBlock
	^ [ 
		self readFrom: aStringOrStream 
	] on: Error do:[
		aBlock value
	]