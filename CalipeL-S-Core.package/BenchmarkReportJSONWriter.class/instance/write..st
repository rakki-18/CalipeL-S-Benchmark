writing
write: anObject

	1 to: Rules size by: 2 do:[:i|
		((Rules at: i) value: anObject) ifTrue:[
			self perform: (Rules at: i + 1) with: anObject.
			^self.
		]        
	].
	anObject isSequenceable ifTrue:[
		self writeArray: anObject.
		^self
	].
	anObject isDictionary ifTrue:[
		self writeDictionary: anObject.
		^self
	].
	self writeObject: anObject

	"Created: / 12-06-2013 / 11:00:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"