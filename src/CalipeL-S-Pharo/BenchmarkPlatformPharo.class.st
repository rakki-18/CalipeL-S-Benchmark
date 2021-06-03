Class {
	#name : #BenchmarkPlatformPharo,
	#superclass : #BenchmarkPlatform,
	#classVars : [
		'OsVersionXlats'
	],
	#category : #'CalipeL-S-Pharo'
}

{ #category : #'class initialization' }
BenchmarkPlatformPharo class >> initialize [ 
	OsVersionXlats := Dictionary newFromPairs:#(
		'linux-gnu' 'Linux'
		
		"Following are taken from:
		https://msdn.microsoft.com/en-gb/library/windows/desktop/ms724832(v=vs.85).aspx"
		
		'5.0'	 'Windows 2000'
		'5.1'	 'Windows XP'
		'5.2'	 'Windows Server 2003'
		'6.0'  'Windows Vista / Server 2008'
		'6.1'  'Windows 7 / Server 2008 R2'
		'6.2'  'Windows 8 / Server 2012'
		'6.3'  'Windows 8.1 / Server 2012 R2'
		'10.0' 'Windows 10'
	).
	Current := self new.
	
	"
	BenchmarkPlarformPharo initialize.
	"
	
]

{ #category : #testing }
BenchmarkPlatformPharo class >> isAbstractClass [
	^false
]

{ #category : #configuration }
BenchmarkPlatformPharo >> configurationStringMachineId [
  	^NetNameResolver localHostName 
]

{ #category : #configuration }
BenchmarkPlatformPharo >> configurationStringOS [	
	| os |
	
	os := Smalltalk os.
	^OsVersionXlats at: os version ifAbsent:[os version].
		
	"
	BenchmarkPlatform current configurationStringOS
	"
]

{ #category : #configuration }
BenchmarkPlatformPharo >> configurationStringRuntime [
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
]

{ #category : #exit }
BenchmarkPlatformPharo >> exit: status [
	Smalltalk exit: status

]

{ #category : #queries }
BenchmarkPlatformPharo >> initialize [
	super initialize.
	instruments := Array 
					with: BenchmarkExecutionTimeInstrument  new 
					with: BenchmarkFullGarbageCollectCountInstrument new
					with: BenchmarkGCTimeInstrument new
]

{ #category : #queries }
BenchmarkPlatformPharo >> isHeadless [
	"raise an error: must be redefined in concrete subclass(es)"

	^Smalltalk isInteractive not
]

{ #category : #queries }
BenchmarkPlatformPharo >> isPharo [
	^true
]

{ #category : #'accessing-performance counters' }
BenchmarkPlatformPharo >> millisecondTime [
	"raise an error: must be redefined in concrete subclass(es)"

	^Time millisecondClockValue
]

{ #category : #'acessing-streams' }
BenchmarkPlatformPharo >> stderr [
	"raise an error: must be redefined in concrete subclass(es)"

	^FileStream stderr
]

{ #category : #'acessing-streams' }
BenchmarkPlatformPharo >> stdout [
	"raise an error: must be redefined in concrete subclass(es)"

	^FileStream stdout
]
