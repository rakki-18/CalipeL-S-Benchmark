benchmark
streamconcat_a
	<benchmark: 'Stream Concatenation - N strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := String new writeStream.
		1 to: nconcats do:[:i | s nextPutAll: str ].
		s := s contents.
	].

	"Created: / 27-11-2014 / 21:30:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"