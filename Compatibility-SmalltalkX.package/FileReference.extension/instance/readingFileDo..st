*Compatibility-SmalltalkX
readingFileDo: aBlock
	| s |
	s := self readStream.
	[ 
		aBlock value: s
	] ensure: [
		s close.
	]