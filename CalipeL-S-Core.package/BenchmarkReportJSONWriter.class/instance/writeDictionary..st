writing
writeDictionary:dictionary 
	self writeDictionaryWith:[
		dictionary associations
			do:[:each | self writeKey: each key value: each value ]
			separatedBy:[ self writeElementSeparator ].
	]

	"Modified: / 12-06-2013 / 14:02:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"