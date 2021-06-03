benchmarks
hsh
	<benchmark: 'Hash 1'>

	| n count |

	n := iterations * 1000.
	count := 0.

	1 to:n do:[:each | 
		table at:(each printStringRadix:16) put:each
	].

	1 to:n do:[:each | 
		(table includesKey:(each printStringRadix:10)) ifTrue:[
			count := count + 1
		]
	].

	"Created: / 11-06-2013 / 01:21:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"