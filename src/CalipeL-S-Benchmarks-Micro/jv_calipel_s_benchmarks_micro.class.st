Class {
	#name : #'jv_calipel_s_benchmarks_micro',
	#superclass : #PackageManifest,
	#category : #'CalipeL-S-Benchmarks-Micro'
}

{ #category : #'description - contents' }
jv_calipel_s_benchmarks_micro class >> classNamesAndAttributes [
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		(BenchmarkMicro autoload)
		BenchmarkMicroStringConcat
		BenchmarkMicroStringConcatN
		BenchmarkPerform
		#'jv_calipel_s_benchmarks_micro'
	)
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_micro class >> companyName [
	"Return a companyname which will appear in <lib>.rc"

	^ 'My Company'
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_micro class >> description [
	"Return a description string which will appear in vc.def / bc.def"

	^ 'Class Library'
]

{ #category : #description }
jv_calipel_s_benchmarks_micro class >> excludedFromPreRequisites [
	"list all packages which should be ignored in the automatic
	 preRequisites scan. See #preRequisites for more."

	^ #(
	)
]

{ #category : #'description - contents' }
jv_calipel_s_benchmarks_micro class >> extensionMethodNames [
	"list class/selector pairs of extensions.
	 A correponding method with real names must be present in my concrete subclasses"

	^ #(
	)
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_micro class >> legalCopyright [
	"Return a copyright string which will appear in <lib>.rc"

	^ 'My CopyRight or CopyLeft'
]

{ #category : #description }
jv_calipel_s_benchmarks_micro class >> mandatoryPreRequisites [
	"list packages which are mandatory as a prerequisite.
	 This are packages containing superclasses of my classes and classes which
	 are extended by myself.
	 They are mandatory, because we need these packages as a prerequisite for loading and compiling.
	 This method is generated automatically,
	 by searching along the inheritance chain of all of my classes."

	^ #(
		#'stx:libbasic'    "LibraryDefinition - superclass of jv_calipel_s_benchmarks_micro"
	)
]

{ #category : #'accessing - monticello' }
jv_calipel_s_benchmarks_micro class >> monticelloSmalltalkXProjectType [
    "Returns either #library or #application.
     This information is used by Smalltalk/X when reading back Monticello package
     to patch my superclass as neither LibraryDefinition nor ApplicationDefinition classes
     are present in Squeak/Pharo images."

    ^#library

]

{ #category : #'description - actions' }
jv_calipel_s_benchmarks_micro class >> postLoadAction [
	"invoked after loading a project"

	Smalltalk silentlyLoadingDo: [ 
		self classes do:[:cls | cls autoload ].
	].

	"Created: / 14-07-2013 / 16:50:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_micro class >> productName [
	"Return a product name which will appear in <lib>.rc"

	^ 'LibraryName'
]

{ #category : #description }
jv_calipel_s_benchmarks_micro class >> referencedPreRequisites [
	"list packages which are a prerequisite, because they contain
	 classes which are referenced by my classes.
	 We do not need these packages as a prerequisite for loading or compiling.
	 This method is generated automatically,
	 by searching all classes (and their packages) which are referenced by my classes."

	^ #(
		#'jv:calipel/s'    "BenchmarkInstance - referenced by BenchmarkMicro class>>run:"
		#'stx:libbasic2'    "Random - referenced by BenchmarkPerform class>>initialize"
	)
]

{ #category : #description }
jv_calipel_s_benchmarks_micro class >> subProjects [
	"list packages which are known as subprojects.
	 The generated makefile will enter those and make there as well.
	 However: they are not forced to be loaded when a package is loaded;
	 for those, redefine requiredPrerequisites"

	^ #(
	)
]

{ #category : #documentation }
jv_calipel_s_benchmarks_micro class >> version_HG [
	^ '$Changeset: <not expanded> $'
]

{ #category : #'description - actions' }
jv_calipel_s_benchmarks_micro >> postLoadAction [
	"invoked after loading a project"

	Smalltalk silentlyLoadingDo: [ 
		self classes do:[:cls | cls autoload ].
	].

	"Created: / 14-07-2013 / 16:50:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
