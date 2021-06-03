benchmark
streamconcat4a
	<benchmark: 'Stream Concatenation - 4 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"