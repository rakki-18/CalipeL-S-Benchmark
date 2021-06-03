writing
writeDictionaryWith:block
	stream nextPut: ${.
	indent := indent + 1.
	block value.
	indent := indent - 1.
	stream nextPut: $}

	"Created: / 12-06-2013 / 14:01:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"