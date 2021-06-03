benchmark
stringconcat
	<benchmark: 'String Concatenation - 2 strings'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := str.
		1 to: nconcats - 1 do:[:i | s := s , str ]
	].

	"Created: / 27-11-2014 / 21:34:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"