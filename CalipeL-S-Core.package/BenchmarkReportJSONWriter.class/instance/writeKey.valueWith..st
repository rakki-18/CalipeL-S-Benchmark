writing
writeKey: key valueWith: block 
	self write: key.
	stream nextPutAll:': '.
	block value

	"Created: / 12-06-2013 / 14:08:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"