initialization
initializeTimestamp

	BenchmarkPlatform current isSmalltalkX ifTrue:[
		"Use Smalltalk at: to avoid reference to undeclared
		 global in Pharo (so Monticello won't complain)"
		timestamp := (Smalltalk at:#Timestamp) now.
		^self
	].
	BenchmarkPlatform current isPharo ifTrue:[
		"Use Smalltalk globals at: to avoid reference to undeclared
		 global in Smalltalk/X (so stc won't complain)"
		timestamp := (Smalltalk globals at: #DateAndTime) now.
		^self
	].
	self error: 'Unsupported platform'

	"Created: / 23-06-2013 / 00:39:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-09-2015 / 09:11:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"