Class {
	#name : #BenchmarkGameKNucleotide,
	#superclass : #Object,
	#instVars : [
		'dictFactory',
		'sortCollectionFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameKNucleotide class >> copyright [
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

{ #category : #defaults }
BenchmarkGameKNucleotide class >> defaultProblemSize [
		^ 25000

	"Modified: / 21-06-2013 / 17:19:51 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkGameKNucleotide class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #'test data' }
BenchmarkGameKNucleotide class >> output [
	^ 'A 30.279
T 30.113
G 19.835
C 19.773

AA 9.161
AT 9.138
TA 9.108
TT 9.060
CA 6.014
GA 5.996
AG 5.993
AC 5.988
TG 5.987
GT 5.967
TC 5.958
CT 5.948
GG 3.944
GC 3.928
CG 3.910
CC 3.899

1474	GGT
459	GGTA
49	GGTATT
1	GGTATTTTAATT
1	GGTATTTTAATTTATAGT
'

]

{ #category : #documentation }
BenchmarkGameKNucleotide class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #helpers }
BenchmarkGameKNucleotide >> in: dict at: key putValueOf: putBlock ifAbsentPutValueOf: absentBlock [
   "* Set the value at key to be the value of evaluating putBlock
	with the existing value. If key is not found, create a new
	entry for key and set is value to the evaluation of
	absentBlock. Answer the result of evaluating either block. *"

   | assoc anObject |
   key == nil ifTrue:
	  [^dict
		 subscriptBoundsErrorFor: #at:putValueOf:ifAbsentPutValueOf:
		 index: key
		 value: absentBlock value].
   assoc := dict associationAt: key ifAbsent: nil.
   assoc == nil
	  ifTrue:  [dict at: key put: (anObject := absentBlock value)]
	  ifFalse: [assoc value: (anObject := putBlock value: assoc value)].
   ^anObject
]

{ #category : #'initialize-release' }
BenchmarkGameKNucleotide >> initialize [
	sortCollectionFactory := SortedCollection.
	dictFactory := Dictionary.

]

{ #category : #benchmarking }
BenchmarkGameKNucleotide >> knucleotide5 [

   self knucleotide5From: self stdinSpecial to: self stdout.
]

{ #category : #benchmarking }
BenchmarkGameKNucleotide >> knucleotide5From: input to: output [
   "Same as av3, but create less strings while updating the frequencies"

   | sequence writeFrequencies writeCount |

   sequence := (self readFasta: 'THREE' from: input) value asUppercase.

   writeFrequencies :=
	  [:k | | frequencies count |
	  frequencies := sortCollectionFactory sortBlock: [:a :b|
	  (a value = b value) ifTrue: [b key < a key] ifFalse: [b value < a value]].

   count := 0.0.
   (self substringFrequencies5On: sequence with: k using: (dictFactory new: 1024))
	  associationsDo: [:each|
		 frequencies add: each. count := count + each value].

   frequencies do: [:each | | percentage |
	  percentage := (each value / count) * 100.0.

	  output
		 nextPutAll: each key; space;
		 nextPutAll: (percentage printShowingDecimalPlaces: 3); cr]].

   writeCount := [:nucleotideFragment | | frequencies count |
	  frequencies := self substringFrequencies5On: sequence with: nucleotideFragment size
		 using: (dictFactory new: 1024).
	  count := frequencies at: nucleotideFragment ifAbsent: [0].
	  output print: count; tab; nextPutAll: nucleotideFragment; cr].

   writeFrequencies value: 1. output cr.
   writeFrequencies value: 2. output cr.

   writeCount value: 'GGT'.
   writeCount value: 'GGTA'.
   writeCount value: 'GGTATT'.
   writeCount value: 'GGTATTTTAATT'.
   writeCount value: 'GGTATTTTAATTTATAGT'
]

{ #category : #helpers }
BenchmarkGameKNucleotide >> readFasta: sequenceName from: input [
   | prefix newline buffer description line char |
   prefix := '>',sequenceName.
   newline := Character cr.

   "* find start of particular fasta sequence *"
   [(input atEnd) or: [
		 (input peek = $>)
			ifTrue: [((line := input upTo: newline)
			   indexOfSubCollection: prefix startingAt: 1) = 1]
			ifFalse: [input upTo: newline. false]]
	  ] whileFalse.

   "* line-by-line read - it would be a lot faster to block read *"
   description := line.
   buffer := ReadWriteStream on: (String new: 1028).
   [(input atEnd) or: [(char := input peek) = $>]] whileFalse: [
	  (char = $;)
		 ifTrue: [input upTo: newline]
		 ifFalse: [buffer nextPutAll: (input upTo: newline)]
	  ].
   ^Association key: description value: buffer contents
]

{ #category : #helpers }
BenchmarkGameKNucleotide >> substringFrequencies5On: aSeq with: aLength using: aDictionary [

   | buffer |
   buffer := String new: aLength.
   1 to: aSeq size - aLength + 1 do:
	  [:i |
		 | answer |
		 buffer replaceFrom: 1 to: aLength with: aSeq startingAt: i.
		 answer := self
							in: aDictionary
			at: buffer
			putValueOf: [:sum | sum + 1]
			ifAbsentPutValueOf: 1.
		 answer = 1 ifTrue: [buffer := String new: aLength].
	  ].
   ^aDictionary
]
