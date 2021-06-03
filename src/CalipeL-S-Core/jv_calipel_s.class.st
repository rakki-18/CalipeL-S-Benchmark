Class {
	#name : #'jv_calipel_s',
	#superclass : #PackageManifest,
	#category : #'CalipeL-S-Core'
}

{ #category : #'description - contents' }
jv_calipel_s class >> classNamesAndAttributes [
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		Benchmark
		BenchmarkError
		BenchmarkExamples
		BenchmarkExamplesInstrument
		BenchmarkExecutionFailure
		BenchmarkExecutor
		BenchmarkInstance
		BenchmarkMeasurement
		BenchmarkMeasurementInstrument
		BenchmarkMeasurementValueNotAvailable
		BenchmarkOutcome
		BenchmarkParameter
		BenchmarkPlatform
		BenchmarkReport
		BenchmarkReportJSONWriter
		BenchmarkResultC
		BenchmarkRunner
		BenchmarkSuite
		#'jv_calipel_s'
		BenchmarkCountingInstrument
		BenchmarkExecutionError
		BenchmarkExecutionTimeInstrument
		BenchmarkParameterError
		BenchmarkReportJSON
		BenchmarkReportText
		BenchmarkRunnerExecutor
		BenchmarkSkipRequest
	)
]

{ #category : #description }
jv_calipel_s class >> excludedFromPreRequisites [
	"list all packages which should be ignored in the automatic
	 preRequisites scan. See #preRequisites for more."

	^ #(
		#'stx:goodies/monticello'    "MCDirectoryRepository - referenced by jv_calipel_s class>>monticelloExportTo: "
		#'stx:libscm/mercurial/monticello'    "HGMCVersionInfo - referenced by jv_calipel_s class>>monticelloExportTo: "
	)
]

{ #category : #'description - contents' }
jv_calipel_s class >> extensionMethodNames [
	"list class/selector pairs of extensions.
	 A correponding method with real names must be present in my concrete subclasses"

	^ #(
	)
]

{ #category : #description }
jv_calipel_s class >> mandatoryPreRequisites [
	"list packages which are mandatory as a prerequisite.
	 This are packages containing superclasses of my classes and classes which
	 are extended by myself.
	 They are mandatory, because we need these packages as a prerequisite for loading and compiling.
	 This method is generated automatically,
	 by searching along the inheritance chain of all of my classes."

	^ #(
		#'stx:libbasic'    "Error - superclass of BenchmarkError"
	)
]

{ #category : #'utilities - monticello' }
jv_calipel_s class >> monticelloExportTo: directory [
	"Export .mcz packages to given directory"

	| packages exporter mcrepo |

	Smalltalk loadPackage: 'stx:goodies/monticello'.
	Smalltalk loadPackage: 'stx:libscm/mercurial/monticello'.
	Class tryLocalSourceFirst: true.


   packages := #(
		'jv:calipel/s'
		'jv:calipel/s/benchmarks/micro'
		'jv:calipel/s/benchmarks/game'
		'jv:calipel/s/tests'
	).

	exporter := [:pkgnm|
		| mcpkg mcwc mcvi mcversion |

		Smalltalk loadPackage: pkgnm.
		mcpkg := MCPackage named: pkgnm.
		mcwc := mcpkg workingCopy.
		mcvi := (Smalltalk at:#HGMCVersionInfo) forPackage: pkgnm.
		[
		   mcversion := mcwc newVersion.
		   mcversion snapshot includeExtrasForSTX: true.
		] on: MCVersionNameAndMessageRequest do:[:ex |
			ex resume: (Array with: mcvi name with: mcvi message)
		].
		mcversion info: mcvi.
		mcrepo storeVersion: mcversion.
	].

	mcrepo := MCDirectoryRepository new directory: directory.
	packages do: exporter.

	"Created: / 11-06-2013 / 02:06:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:24:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'accessing - monticello' }
jv_calipel_s class >> monticelloSmalltalkXProjectType [
    "Returns either #library or #application.
     This information is used by Smalltalk/X when reading back Monticello package
     to patch my superclass as neither LibraryDefinition nor ApplicationDefinition classes
     are present in Squeak/Pharo images."

    ^#library

]

{ #category : #'description - actions' }
jv_calipel_s class >> postLoadAction [
	"invoked after loading a project"

	Smalltalk loadPackage: (self package , '/stx')

	"Created: / 09-06-2013 / 22:21:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #description }
jv_calipel_s class >> referencedPreRequisites [
	"list packages which are a prerequisite, because they contain
	 classes which are referenced by my classes.
	 We do not need these packages as a prerequisite for compiling or loading,
	 however, a class from it may be referenced during execution and having it
	 unloaded then may lead to a runtime doesNotUnderstand error, unless the caller
	 includes explicit checks for the package being present.
	 This method is generated automatically,
	 by searching all classes (and their packages) which are referenced by my classes."

	^ #(
		#'stx:libbasic2'    "Random - referenced by BenchmarkExamples>>example02SetupSortDataRandom"
		#'stx:libbasic3'    "MessageTally - referenced by BenchmarkExecutor>>spy:"
	)
]

{ #category : #description }
jv_calipel_s class >> subProjects [
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
]

{ #category : #'accessing - tests' }
jv_calipel_s class >> testSuite [
	| tests |

	tests := self package , '/tests'.
	Smalltalk loadPackage: tests.
	^((Smalltalk at: #ProjectDefinition) definitionClassForPackage: tests) testSuite

	"Created: / 09-06-2013 / 22:23:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:23:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
jv_calipel_s class >> version_HG [
	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
jv_calipel_s class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]
