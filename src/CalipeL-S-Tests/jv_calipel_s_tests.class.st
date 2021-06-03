Class {
	#name : #'jv_calipel_s_tests',
	#superclass : #PackageManifest,
	#category : #'CalipeL-S-Tests'
}

{ #category : #'description - contents' }
jv_calipel_s_tests class >> classNamesAndAttributes [
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		BenchmarkExamplesTests
		BenchmarkInstanceTestsA
		BenchmarkReportJSONWriterTests
		BenchmarkRunnerTests
		BenchmarkSuiteTests
		BenchmarkTestsLog
		BenchmarkTestsSuiteA
		BenchmarkTestsSuiteB
		BenchmarkTestsSuiteC
		#'jv_calipel_s_tests'
		BenchmarkInstanceTestsB
	)
]

{ #category : #'description - project information' }
jv_calipel_s_tests class >> companyName [
	"Return a companyname which will appear in <lib>.rc"

	^ 'My Company'
]

{ #category : #'description - project information' }
jv_calipel_s_tests class >> description [
	"Return a description string which will appear in vc.def / bc.def"

	^ 'Class Library'
]

{ #category : #description }
jv_calipel_s_tests class >> excludedFromPreRequisites [
	"list all packages which should be ignored in the automatic
	 preRequisites scan. See #preRequisites for more."

	^ #(
	)
]

{ #category : #'description - contents' }
jv_calipel_s_tests class >> extensionMethodNames [
	"list class/selector pairs of extensions.
	 A correponding method with real names must be present in my concrete subclasses"

	^ #(
	)
]

{ #category : #'description - project information' }
jv_calipel_s_tests class >> legalCopyright [
	"Return a copyright string which will appear in <lib>.rc"

	^ 'My CopyRight or CopyLeft'
]

{ #category : #description }
jv_calipel_s_tests class >> mandatoryPreRequisites [
	"list packages which are mandatory as a prerequisite.
	 This are packages containing superclasses of my classes and classes which
	 are extended by myself.
	 They are mandatory, because we need these packages as a prerequisite for loading and compiling.
	 This method is generated automatically,
	 by searching along the inheritance chain of all of my classes."

	^ #(
		#'stx:goodies/sunit'    "TestAsserter - superclass of BenchmarkExamplesTests"
		#'stx:libbasic'    "LibraryDefinition - superclass of jv_calipel_s_tests"
	)
]

{ #category : #'accessing - monticello' }
jv_calipel_s_tests class >> monticelloSmalltalkXProjectType [
    "Returns either #library or #application.
     This information is used by Smalltalk/X when reading back Monticello package
     to patch my superclass as neither LibraryDefinition nor ApplicationDefinition classes
     are present in Squeak/Pharo images."

    ^#library

]

{ #category : #'description - project information' }
jv_calipel_s_tests class >> productName [
	"Return a product name which will appear in <lib>.rc"

	^ 'ProductName'
]

{ #category : #description }
jv_calipel_s_tests class >> referencedPreRequisites [
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
]

{ #category : #description }
jv_calipel_s_tests class >> subProjects [
	"list packages which are known as subprojects.
	 The generated makefile will enter those and make there as well.
	 However: they are not forced to be loaded when a package is loaded;
	 for those, redefine requiredPrerequisites"

	^ #(
	)
]

{ #category : #documentation }
jv_calipel_s_tests class >> version_HG [
	^ '$Changeset: <not expanded> $'
]
