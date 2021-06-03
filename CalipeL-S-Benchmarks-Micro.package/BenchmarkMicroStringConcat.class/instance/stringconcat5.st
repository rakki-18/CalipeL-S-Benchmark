benchmark
stringconcat5
	<benchmark: 'String Concatenation - 5 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str , str , str
	].

	"Created: / 27-11-2014 / 21:16:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"