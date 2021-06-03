benchmarks
ackermann: x with: y
   ^x = 0
	  ifTrue: [y + 1]
	  ifFalse: [
		 y = 0
			ifTrue: [self ackermann: x - 1 with: 1]
			ifFalse: [self ackermann: x - 1 with: (self ackermann: x with: y - 1)] ]

	"Created: / 11-06-2013 / 01:29:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"