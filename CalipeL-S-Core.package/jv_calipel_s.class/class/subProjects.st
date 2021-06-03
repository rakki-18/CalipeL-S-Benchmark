description
subProjects
	"list packages which are known as subprojects.
	 The generated makefile will enter those and make there as well.
	 However: they are not forced to be loaded when a package is loaded;
	 for those, redefine requiredPrerequisites"

	^ #(
		#'jv:calipel/s/stx'
		#'jv:calipel/s/tests'
		#'jv:calipel/s/benchmarks/micro'
		#'jv:calipel/s/benchmarks/game'
	)