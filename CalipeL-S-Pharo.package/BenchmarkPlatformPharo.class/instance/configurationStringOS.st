configuration
configurationStringOS	
	| os |
	
	os := Smalltalk os.
	^OsVersionXlats at: os version ifAbsent:[os version].
		
	"
	BenchmarkPlatform current configurationStringOS
	"