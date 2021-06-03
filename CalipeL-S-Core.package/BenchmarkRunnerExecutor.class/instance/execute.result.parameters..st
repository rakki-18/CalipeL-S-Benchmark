executing-private
execute: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection
	| nm outcome |

	nm := aBenchmarkInstance name.
	transcript next: (25 - nm size) put: Character space.
	transcript nextPutAll: nm.
	transcript nextPutAll: '...'.

	[
		outcome := super execute: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection.
		outcome notNil ifTrue:[
			transcript nextPutAll: 'OK ['.
			transcript nextPutAll: outcome time printString.
			transcript nextPutAll: ']'.
			aCollection notEmpty ifTrue:[        
				transcript nextPutAll: ' {'.
				(aCollection asSortedCollection:[:a :b | a key name < b key name ]) do:[:paramAndValue|
					transcript nextPutAll: paramAndValue key name.
					transcript nextPutAll: '='.        
					transcript nextPutAll: paramAndValue value storeString.
				] separatedBy:[
					transcript nextPutAll: ', '.            
				].
				transcript nextPutAll: '}'.
			].
		] ifFalse:[
			transcript nextPutAll: 'SKIPPED'.
		].
		transcript nextPutAll: '
'.
	] on: BenchmarkExecutionError do:[:ex|
		transcript nextPutAll:  '!!! ERROR: '.
		transcript nextPutAll: ex description.
		transcript nextPutAll:'
'.
		outcome := nil.    
		"Re-throw it as a failure, to indicate BenchmarkRunner that (at least) 
		 one benchmark failed to run"
		BenchmarkExecutionFailure new signal: ex description
	].
	^ outcome

	"Created: / 27-07-2013 / 12:33:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 15:04:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"