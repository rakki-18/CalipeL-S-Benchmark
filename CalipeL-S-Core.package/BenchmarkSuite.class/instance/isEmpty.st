testing
isEmpty
	"Return true, if this benchmark suite contains no benchmarks"

	benchmarks do:[:benchmark | benchmark isEmpty ifFalse:[ ^ false ] ].
	^ true

	"Created: / 30-09-2015 / 08:29:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"