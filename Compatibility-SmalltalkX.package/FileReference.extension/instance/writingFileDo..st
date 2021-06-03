*Compatibility-SmalltalkX
writingFileDo: aBlock
	| s |
	s := self writeStream.
	[ 
		aBlock value: s
	] ensure: [
		s close.
	]