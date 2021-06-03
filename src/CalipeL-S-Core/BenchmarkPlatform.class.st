Class {
	#name : #BenchmarkPlatform,
	#superclass : #Object,
	#instVars : [
		'instruments'
	],
	#classVars : [
		'Current'
	],
	#category : #'CalipeL-S-Core'
}

{ #category : #accessing }
BenchmarkPlatform class >> current [
	^Current

	"Created: / 06-06-2013 / 08:54:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkPlatform class >> documentation [
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

"
]

{ #category : #'instance creation' }
BenchmarkPlatform class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #'class initialization' }
BenchmarkPlatform class >> setCurrent: aBenchmarkPlatform [
	Current := aBenchmarkPlatform

	"Created: / 30-09-2015 / 06:16:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkPlatform class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #configuration }
BenchmarkPlatform >> configurationStringMachineId [
	self subclassResponsibility

	"Created: / 13-07-2013 / 22:45:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #configuration }
BenchmarkPlatform >> configurationStringOS [
	"Return the operating system on which the system is running such as
	 'Linux' or 'Windows XP'"

	^ self subclassResponsibility

	"Created: / 22-06-2013 / 22:55:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 21-09-2015 / 15:36:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #configuration }
BenchmarkPlatform >> configurationStringRuntime [  
	"Return the runtime identification string, for example
	 'Smalltalk/X 6.2.5 642bit' or 'Pharo 5.0 32bit'."

	^ self subclassResponsibility

	"Created: / 22-06-2013 / 22:55:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 21-09-2015 / 15:38:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #exit }
BenchmarkPlatform >> exit:arg [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #initialization }
BenchmarkPlatform >> initialize [
	"Invoked when a new instance is created."

	super initialize.
	instruments := Array 
					with: BenchmarkExecutionTimeInstrument new

	"Modified (format): / 27-11-2014 / 13:42:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'accessing-instruments' }
BenchmarkPlatform >> instruments [
	"Return a list of non-intrusive instruments available on this
	 platform."

	"`instruments` variable is initialized in #initialize"
	^ instruments

	"Created: / 27-11-2014 / 12:37:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 27-11-2014 / 13:41:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #queries }
BenchmarkPlatform >> isHeadless [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #queries }
BenchmarkPlatform >> isPharo [
	^false

	"Modified: / 06-06-2013 / 09:40:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #queries }
BenchmarkPlatform >> isSmalltalkX [
	^false

	"Modified: / 06-06-2013 / 09:40:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'accessing-performance counters' }
BenchmarkPlatform >> millisecondTime [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #'acessing-streams' }
BenchmarkPlatform >> stderr [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #'acessing-streams' }
BenchmarkPlatform >> stdout [
	"raise an error: must be redefined in concrete subclass(es)"

	^ self subclassResponsibility
]

{ #category : #running }
BenchmarkPlatform >> warmUpPost [
	"Called after benchmark's warmup"

	"Created: / 07-06-2013 / 02:09:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkPlatform >> warmUpPre [
	"Called before benchmark's warmup"

	"Created: / 07-06-2013 / 02:09:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
