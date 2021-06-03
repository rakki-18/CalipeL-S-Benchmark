benchmarks
strcat
	<benchmark: 'String Concatenation'>

	1 to: (iterations * 5000) do: [:idx|
		stream nextPutAll:hello
	].

	"Created: / 28-05-2013 / 00:49:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"