executing-private
spy:aBenchmarkInstance 
	| messageTally measurements |
	" Special - use Smalltalk/X visual profiler instead plain old
	  MessageTally."
	messageTally := Smalltalk isSmalltalkX
					ifTrue:[ Smalltalk at:#'Tools::Profiler' ]
					ifFalse:[ MessageTally ].
	messageTally spyDetailedOn: [ measurements := self benchmark: aBenchmarkInstance ].
	^ measurements

	"Created: / 21-05-2014 / 10:48:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-12-2014 / 16:02:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"