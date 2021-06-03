writing
writeArray:collection 
	self writeArrayWith:[
		collection 
			do:[:each | self write: each ]
			separatedBy:[ self writeElementSeparator ].
	]

	"Modified: / 12-06-2013 / 14:02:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"