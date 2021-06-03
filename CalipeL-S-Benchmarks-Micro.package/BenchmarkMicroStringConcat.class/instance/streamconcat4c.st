benchmark
streamconcat4c
	<benchmark: 'Stream Concatenation - 4 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 4*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:23:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"