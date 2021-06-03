benchmark
streamconcat2b
	<benchmark: 'Stream Concatenation - 2 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 3*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:21:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"