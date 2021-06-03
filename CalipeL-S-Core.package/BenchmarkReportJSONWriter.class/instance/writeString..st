writing
writeString: string
	stream nextPut: $".
	self encode: string.
	stream nextPut: $"

	"Modified: / 12-06-2013 / 13:43:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"