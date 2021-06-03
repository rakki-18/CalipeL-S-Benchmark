benchmark
streamconcat3b
	<benchmark: 'Stream Concatenation - 3 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 4*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:21:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"