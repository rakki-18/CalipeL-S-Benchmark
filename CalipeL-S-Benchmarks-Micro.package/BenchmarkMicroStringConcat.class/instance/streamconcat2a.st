benchmark
streamconcat2a
	<benchmark: 'Stream Concatenation - 2 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"