Class {
	#name : #'jv_calipel_s_benchmarks_game',
	#superclass : #PackageManifest,
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #'description - contents' }
jv_calipel_s_benchmarks_game class >> classNamesAndAttributes [
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		(BenchmarkGameBinaryTrees autoload)
		(BenchmarkGameBitOps autoload)
		(BenchmarkGameBody autoload)
		(BenchmarkGameChameleon autoload)
		(BenchmarkGameChameleons autoload)
		(BenchmarkGameChameneosColour autoload)
		(BenchmarkGameChameneosRedux autoload)
		(BenchmarkGameCreature autoload)
		(BenchmarkGameFannkuchRedux autoload)
		(BenchmarkGameFasta autoload)
		(BenchmarkGameFastaCache autoload)
		(BenchmarkGameKNucleotide autoload)
		(BenchmarkGameMall autoload)
		(BenchmarkGameMandelbrot autoload)
		(BenchmarkGameMeetingPlace autoload)
		(BenchmarkGameMeteor autoload)
		(BenchmarkGameMeteorBoard autoload)
		(BenchmarkGameMeteorPiece autoload)
		(BenchmarkGameNBody autoload)
		(BenchmarkGamePair autoload)
		(BenchmarkGamePermGeneratorRedux autoload)
		(BenchmarkGamePiDigitSpigot autoload)
		(BenchmarkGamePiDigits autoload)
		(BenchmarkGameRandomNumber autoload)
		(BenchmarkGameRegexDNA autoload)
		(BenchmarkGameRepeatStream autoload)
		(BenchmarkGameReverseComplement autoload)
		(BenchmarkGameSpectralNorm autoload)
		(BenchmarkGameSuite autoload)
		(BenchmarkGameTests autoload)
		(BenchmarkGameThread autoload)
		(BenchmarkGameThreadRing autoload)
		(BenchmarkGameTreeNode autoload)
		#'jv_calipel_s_benchmarks_game'
		(BenchmarkGameMeteorPieceWithIsland autoload)
		(BenchmarkGameRandomStream autoload)
	)
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_game class >> companyName [
	"Return a companyname which will appear in <lib>.rc"

	^ 'My Company'
]

{ #category : #documentation }
jv_calipel_s_benchmarks_game class >> copyright [
"
Copyright 2008-2010 Isaac Gouy
Copyright (C) 2013 Stefan Marr (modification for SMark)
Copyright (C) 2013 Jan Vrany (modification for CalipeL/S)

============================================================================
Revised BSD license

This is a specific instance of the Open Source Initiative (OSI) BSD license
template http://www.opensource.org/licenses/bsd-license.php


Copyright 2008-2010 Isaac Gouy
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

   Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

   Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

   Neither the name of 'The Computer Language Benchmarks Game' nor the name of
   'The Computer Language Shootout Benchmarks' nor the name 'nanobench' nor
   the name 'bencher' nor the names of its contributors may be used to endorse
   or promote products derived from this software without specific prior
   written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS'
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

	"Created: / 10-06-2013 / 22:14:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_game class >> description [
	"Return a description string which will appear in vc.def / bc.def"

	^ 'Class Library'
]

{ #category : #description }
jv_calipel_s_benchmarks_game class >> excludedFromPreRequisites [
	"list all packages which should be ignored in the automatic
	 preRequisites scan. See #preRequisites for more."

	^ #(
	)
]

{ #category : #'description - contents' }
jv_calipel_s_benchmarks_game class >> extensionMethodNames [
	"list class/selector pairs of extensions.
	 A correponding method with real names must be present in my concrete subclasses"

	^ #(
	)
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_game class >> legalCopyright [
	"Return a copyright string which will appear in <lib>.rc"

	^ 'My CopyRight or CopyLeft'
]

{ #category : #description }
jv_calipel_s_benchmarks_game class >> mandatoryPreRequisites [
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
]

{ #category : #'accessing - monticello' }
jv_calipel_s_benchmarks_game class >> monticelloSmalltalkXProjectType [
    "Returns either #library or #application.
     This information is used by Smalltalk/X when reading back Monticello package
     to patch my superclass as neither LibraryDefinition nor ApplicationDefinition classes
     are present in Squeak/Pharo images."

    ^#library

]

{ #category : #'description - actions' }
jv_calipel_s_benchmarks_game class >> postLoadAction [
	"invoked after loading a project"

	Smalltalk silentlyLoadingDo: [ 
		self classes do:[:cls | cls autoload ].
	].

	"Created: / 14-07-2013 / 16:50:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'description - project information' }
jv_calipel_s_benchmarks_game class >> productName [
	"Return a product name which will appear in <lib>.rc"

	^ 'LibraryName'
]

{ #category : #description }
jv_calipel_s_benchmarks_game class >> referencedPreRequisites [
	"list packages which are a prerequisite, because they contain
	 classes which are referenced by my classes.
	 We do not need these packages as a prerequisite for loading or compiling.
	 This method is generated automatically,
	 by searching all classes (and their packages) which are referenced by my classes."

	^ #(
		#'jv:calipel/s'    "BenchmarkInstance - referenced by BenchmarkGameSuite class>>run: "
		#'stx:libbasic2'    "SharedQueue - referenced by BenchmarkGameMall>>initializeFactories "
		#'stx:libcompat'    "PackageInfo - referenced by BenchmarkGameSuite class>>transportersForFileOutMenu "
	)
]

{ #category : #description }
jv_calipel_s_benchmarks_game class >> subProjects [
	"list packages which are known as subprojects.
	 The generated makefile will enter those and make there as well.
	 However: they are not forced to be loaded when a package is loaded;
	 for those, redefine requiredPrerequisites"

	^ #(
	)
]

{ #category : #documentation }
jv_calipel_s_benchmarks_game class >> version_HG [
	^ '$Changeset: <not expanded> $'
]
