description
mandatoryPreRequisites
	"list packages which are mandatory as a prerequisite.
	 This are packages containing superclasses of my classes and classes which
	 are extended by myself.
	 They are mandatory, beacuse we need these packages as a prerequisite for loading and compiling.
	 This method is generated automatically,
	 by searching along the inheritance chain of all of my classes."

	^ #(
		#'stx:goodies/sunit'    "TestAsserter - superclass of BenchmarkGameTests "
		#'stx:libbasic'    "LibraryDefinition - superclass of jv_calipel_s_benchmarks_game "
	)