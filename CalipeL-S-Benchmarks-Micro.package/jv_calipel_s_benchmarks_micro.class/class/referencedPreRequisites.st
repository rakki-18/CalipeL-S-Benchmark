description
referencedPreRequisites
	"list packages which are a prerequisite, because they contain
	 classes which are referenced by my classes.
	 We do not need these packages as a prerequisite for loading or compiling.
	 This method is generated automatically,
	 by searching all classes (and their packages) which are referenced by my classes."

	^ #(
		#'jv:calipel/s'    "BenchmarkInstance - referenced by BenchmarkMicro class>>run:"
		#'stx:libbasic2'    "Random - referenced by BenchmarkPerform class>>initialize"
	)