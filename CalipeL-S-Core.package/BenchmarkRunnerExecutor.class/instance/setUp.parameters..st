executing-private
setUp:aBenchmarkInstance parameters: aCollection
	transcript nextPutAll:'S..'.   
	aCollection do:[:each|
		aBenchmarkInstance setUpParameter: each key value: each value
	].
	aBenchmarkInstance setUp.

	"Created: / 27-07-2013 / 12:33:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"