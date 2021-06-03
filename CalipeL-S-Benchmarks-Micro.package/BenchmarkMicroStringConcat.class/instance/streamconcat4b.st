benchmark
streamconcat4b
	<benchmark: 'Stream Concatenation - 4 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 5*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:22:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"