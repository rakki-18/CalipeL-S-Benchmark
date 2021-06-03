Class {
	#name : #BenchmarkTestsLog,
	#superclass : #TestResource,
	#instVars : [
		'events'
	],
	#category : #'CalipeL-S-Tests-Data'
}

{ #category : #documentation }
BenchmarkTestsLog class >> documentation [
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

{ #category : #documentation }
BenchmarkTestsLog class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #running }
BenchmarkTestsLog >> reset [
	events := OrderedCollection new.

	"Created: / 19-07-2013 / 12:50:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkTestsLog >> setUp [
	self reset

	"Created: / 18-07-2013 / 02:41:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 19-07-2013 / 12:50:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
