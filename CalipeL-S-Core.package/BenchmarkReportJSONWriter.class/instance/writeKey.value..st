writing
writeKey: key value: value 
	self write: key.
	stream nextPutAll:': '.
	self write: value

	"Created: / 12-06-2013 / 13:59:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"