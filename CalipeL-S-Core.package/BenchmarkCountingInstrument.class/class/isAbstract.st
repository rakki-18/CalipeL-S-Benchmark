queries
isAbstract
	"Return if this class is an abstract class.
	 True is returned here for myself only; false for subclasses.
	 Abstract subclasses must redefine again."

	^ self == BenchmarkCountingInstrument.