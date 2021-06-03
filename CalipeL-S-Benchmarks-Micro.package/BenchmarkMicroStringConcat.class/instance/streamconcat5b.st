benchmark
streamconcat5b
	<benchmark: 'Stream Concatenation - 5 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 6*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:22:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"