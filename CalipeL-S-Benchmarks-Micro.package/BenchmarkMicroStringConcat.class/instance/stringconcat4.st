benchmark
stringconcat4
	<benchmark: 'String Concatenation - 4 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str , str
	].

	"Created: / 27-11-2014 / 21:16:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"