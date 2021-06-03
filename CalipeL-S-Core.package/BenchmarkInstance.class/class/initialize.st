class initialization
initialize 
   "Test for Smalltalk/X"
	((Smalltalk respondsTo: #isSmalltalkX) and:[ Smalltalk isSmalltalkX ]) ifTrue:[
		  "Use slow Smalltalk at: because Pharo does not allow to accept code with
			undefined global. Somewhat stupid! "
		MillisecondsTime := [ (Smalltalk at: #OperatingSystem) getMillisecondTime ].
		  ^self
	].
   "Test for Squeak/Pharo"
   (Smalltalk at: #SmalltalkImage ifAbsent: [nil]) notNil ifTrue:[
		MillisecondsTime := [ Time millisecondClockValue ].
		  ^self 
   ].
   self error:'Unssuported platform'

   "
   BenchmarkInstance initialize
   "

	"Created: / 31-05-2013 / 12:02:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"