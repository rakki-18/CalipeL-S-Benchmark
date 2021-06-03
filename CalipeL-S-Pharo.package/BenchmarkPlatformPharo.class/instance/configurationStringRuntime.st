configuration
configurationStringRuntime
	^String streamContents: [:str |
		| version |
		
		version := SystemVersion current.
		str 
			nextPutAll: version type;
			space;
			nextPutAll: version major printString;
			nextPut: $.;
			nextPutAll: version minor printString;
			nextPutAll: ' 32bit'].
		
	"
	BenchmarkPlatform  current configurationStringRuntime
	"