description
referencedPreRequisites
	"list packages which are a prerequisite, because they contain
	 classes which are referenced by my classes.
	 We do not need these packages as a prerequisite for compiling or loading,
	 however, a class from it may be referenced during execution and having it
	 unloaded then may lead to a runtime doesNotUnderstand error, unless the caller
	 includes explicit checks for the package being present.
	 This method is generated automatically,
	 by searching all classes (and their packages) which are referenced by my classes."

	^ #(
		#'jv:calipel/s'    "BenchmarkExamples - referenced by BenchmarkExamplesTests>>testRunAll"
	)