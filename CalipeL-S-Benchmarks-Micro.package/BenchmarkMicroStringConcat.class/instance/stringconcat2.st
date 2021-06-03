benchmark
stringconcat2
	<benchmark: 'String Concatenation - 2 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str
	].

	"Created: / 27-11-2014 / 21:15:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"