benchmark
streamconcat5c
	<benchmark: 'Stream Concatenation - 5 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 5*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:24:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"