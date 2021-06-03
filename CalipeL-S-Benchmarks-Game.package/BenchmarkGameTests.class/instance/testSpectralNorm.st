tests
testSpectralNorm
	| result |
	result := BenchmarkGameSpectralNorm new spectralnorm: 100.
	self assert: (result printShowingDecimalPlaces: 9) equals: '1.274219991'
