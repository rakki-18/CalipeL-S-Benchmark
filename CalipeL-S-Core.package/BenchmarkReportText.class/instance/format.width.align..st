formatting
format: anObject width: width align: align
	| string |

	string := anObject isString ifTrue:[anObject] ifFalse:[anObject printString].
	align == #left ifTrue:[
		stream nextPutAll: string.
		stream next: ((width - string size) max: 0) put: Character space.
		^self.
	].
	align == #right ifTrue:[
		stream next: ((width - string size) max: 0) put: Character space.
		stream nextPutAll: string.
		^self.
	].
	align == #center ifTrue:[
		stream next: (((width - string size) max: 0) / 2 floor) put: Character space.
		stream nextPutAll: string.
		stream next: (((width - string size) max: 0) / 2 ceiling) put: Character space.
		^self.
	]

	"Created: / 31-05-2013 / 12:09:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"