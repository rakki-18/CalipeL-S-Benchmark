running-private
spyIt
	| t0 t1 messageTally |

	" Special - use Smalltalk/X visual profiler instead plain old
	  MessageTally."
	messageTally := Smalltalk isSmalltalkX
					ifTrue:[ Smalltalk at:#'Tools::Profiler' ]
					ifFalse:[ MessageTally ].
	t0 := MillisecondsTime value.
	messageTally spyDetailedOn: [ instance perform:benchmarkSelector ].
	t1 := MillisecondsTime value.
	^ t1 - t0

	"Created: / 21-05-2014 / 10:53:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"