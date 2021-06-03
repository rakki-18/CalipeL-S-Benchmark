benchmark
streamconcat_b
	<benchmark: 'Stream Concatenation - N strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := (String new:(strsize * (nconcats + 1))) writeStream.
		1 to: nconcats do:[:i | s nextPutAll: str ].
		s := s contents.
	].

	"Created: / 27-11-2014 / 21:35:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"