writing
writeArrayWith:block 
	stream nextPut: $[.
	indent := indent + 1.
	block value.
	indent := indent - 1.
	stream nextPut: $]

	"Created: / 12-06-2013 / 14:01:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"