benchmark
stringconcat3
	<benchmark: 'String Concatenation - 3 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str
	].

	"Created: / 27-11-2014 / 21:16:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"