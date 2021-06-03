initialization
initialize
	"Invoked at system start or when the class is dynamically loaded."

	Smalltalk isSmalltalkX ifTrue:[
		WaitBlock := [:semaphore :timeout |
			(semaphore waitTimeoutSeconds: timeout) isNil ifTrue:[
				semaphore halt.
			]
		].
		^self.
	].

	Smalltalk isSqueak ifTrue:[
		WaitBlock := [:semaphore :timeout |
			(semaphore waitTimeoutSeconds: timeout) ifTrue:[
				Halt now.
			]
		]
	].

	"Modified: / 21-06-2013 / 03:46:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 22-06-2013 / 15:05:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"