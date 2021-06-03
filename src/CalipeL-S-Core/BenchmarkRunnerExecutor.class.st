Class {
	#name : #BenchmarkRunnerExecutor,
	#superclass : #BenchmarkExecutor,
	#instVars : [
		'transcript'
	],
	#category : #'CalipeL-S-Core-Runner'
}

{ #category : #documentation }
BenchmarkRunnerExecutor class >> documentation [
" 
 
  Replace 'Object', 'NewClass1' and
  the empty string arguments by true values.
 
  Install (or change) the class by 'accepting',
  either via the menu or the keyboard (usually CMD-A).
 
  You can also change the category simply by editing
  the categoryString and accepting.
 
  To be nice to others (and yourself later), do not forget to
  add some documentation; preferably under the classes documentation
  protocol.
  (see the `create documentation stubs' item in the methodList menu;
   switch from instance to class to find this menu item.)
 
  Notice, that ST/X uses the convention to document the class using
  comment-only class methods (however, ST80 comments are supported and
  can be changed via the class-documentation menu).
 
 
 
  Notice: 
	the above text has been extracted from the classes documentation method.
	Any change in it will be lost if you 'accept' here.
	To change the documentation, switch to the documentation method and 'accept' any changes there.
 
"
]

{ #category : #'instance creation' }
BenchmarkRunnerExecutor class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkRunnerExecutor class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'executing-private' }
BenchmarkRunnerExecutor >> benchmark: aBenchmarkInstance [
	transcript nextPutAll: 'B..'.
	^super benchmark: aBenchmarkInstance.

	"Created: / 24-11-2014 / 00:18:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkRunnerExecutor >> execute: aBenchmarkInstance result: aBenchmarkResult parameters: aCollection [
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
]

{ #category : #initialization }
BenchmarkRunnerExecutor >> initialize [
	"Invoked when a new instance is created."

	super initialize.
	transcript := BenchmarkPlatform current stderr.
	(Smalltalk isSmalltalkX and:[Transcript isView]) ifTrue:[
		transcript := Transcript
	].

	"Created: / 24-06-2013 / 01:16:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkRunnerExecutor >> setUp:aBenchmarkInstance parameters: aCollection [
	transcript nextPutAll:'S..'.   
	aCollection do:[:each|
		aBenchmarkInstance setUpParameter: each key value: each value
	].
	aBenchmarkInstance setUp.

	"Created: / 27-07-2013 / 12:33:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkRunnerExecutor >> tearDown: aBenchmarkInstance [
	transcript nextPutAll: 'T..'.
	super tearDown: aBenchmarkInstance

	"Created: / 24-06-2013 / 01:21:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'executing-private' }
BenchmarkRunnerExecutor >> warmUp: aBenchmarkInstance [
	transcript nextPutAll: 'W..'.
	super warmUp: aBenchmarkInstance.

	"Created: / 24-06-2013 / 01:21:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
