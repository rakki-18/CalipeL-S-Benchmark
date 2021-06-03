documentation
documentation
"
	Simple benchmark to measure performance of Object>>perform:

	Run:

	(BenchmarkSuite class: BenchmarkPerform)
		run: BenchmarkResultC new
		with: (Dictionary new
				add: 'nreceivers' -> '10';
				add: 'nselectors' -> '10';
				add: 'recdistrib:' -> '#normal';
				add: 'seldistrib:' -> '#normal';
				yourself)


	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]

"