Class {
	#name : #BenchmarkGameFasta,
	#superclass : #Object,
	#instVars : [
		'lineLength',
		'n',
		'out',
		'r',
		'repeatStreamFact',
		'randomStreamFact',
		'randomNumberFactory',
		'arrayFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameFasta class >> copyright [
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
BenchmarkGameFasta class >> defaultProblemSize [
		^ 5000000

	"Modified: / 21-06-2013 / 17:32:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameFasta class >> fasta [
	" self fasta"
  | out |
  out := TextStream with: String new.
  self fasta: self defaultProblemSize to: out.
  ^out contents

]

{ #category : #benchmarking }
BenchmarkGameFasta class >> fasta: n to: out [
	^ self new fasta: n to: out

]

{ #category : #'instance creation' }
BenchmarkGameFasta class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkGameFasta class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarking }
BenchmarkGameFasta >> fasta: anInt to: aStream [
	self n:   anInt.
	self out: aStream.
	self oneHomoSapiensAlu.
	
   self r: (randomNumberFactory to: 1). "Shared random sequence"

	self twoIUBAmbiguityCodes.
	self threeHomoSapiensFrequency.
	
	aStream flush.

]

{ #category : #initialization }
BenchmarkGameFasta >> initialize [
	lineLength := 60.
	repeatStreamFact    := BenchmarkGameRepeatStream.
	randomStreamFact    := BenchmarkGameRandomStream.
	randomNumberFactory := BenchmarkGameRandomNumber.
	arrayFactory        := Array.

]

{ #category : #accessing }
BenchmarkGameFasta >> n: anInteger [
	n := anInteger

]

{ #category : #benchmarking }
BenchmarkGameFasta >> oneHomoSapiensAlu [
	 self
      writeFasta: 'ONE Homo sapiens alu'
      from:
         ( repeatStreamFact
            to: n*2
            on:'GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG',
               'GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA',
               'CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT',
               'ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA',
               'GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG',
               'AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC',
               'AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA' ).

]

{ #category : #accessing }
BenchmarkGameFasta >> out: aStream [
	out := aStream 

]

{ #category : #accessing }
BenchmarkGameFasta >> r: aRandomNumberStream [
	r := aRandomNumberStream

]

{ #category : #accessing }
BenchmarkGameFasta >> randomStreamFact: aStreamFact [
	randomStreamFact := aStreamFact

]

{ #category : #accessing }
BenchmarkGameFasta >> repeatStreamFact: aStreamFact [
	repeatStreamFact := aStreamFact

]

{ #category : #benchmarking }
BenchmarkGameFasta >> threeHomoSapiensFrequency [
	self
      writeFasta: 'THREE Homo sapiens frequency'
      from:
         (( randomStreamFact
            to: n*5
            on: (arrayFactory
                   with: (arrayFactory with: $a with: 0.3029549426680d0)
                   with: (arrayFactory with: $c with: 0.1979883004921d0)
                   with: (arrayFactory with: $g with: 0.1975473066391d0)
                   with: (arrayFactory with: $t with: 0.3015094502008d0))
          ) random: r;
            yourself).

]

{ #category : #benchmarking }
BenchmarkGameFasta >> twoIUBAmbiguityCodes [
	| arr |
	arr := arrayFactory new: 15.
	arr at:  1 put: (arrayFactory with: $a with: 0.27d0).
	arr at:  2 put: (arrayFactory with: $c with: 0.12d0).
	arr at:  3 put: (arrayFactory with: $g with: 0.12d0).
	arr at:  4 put: (arrayFactory with: $t with: 0.27d0).
	
	arr at:  5 put: (arrayFactory with: $B with: 0.02d0).
	arr at:  6 put: (arrayFactory with: $D with: 0.02d0).
	arr at:  7 put: (arrayFactory with: $H with: 0.02d0).
	arr at:  8 put: (arrayFactory with: $K with: 0.02d0).
	
	arr at:  9 put: (arrayFactory with: $M with: 0.02d0).
	arr at: 10 put: (arrayFactory with: $N with: 0.02d0).
	arr at: 11 put: (arrayFactory with: $R with: 0.02d0).
	arr at: 12 put: (arrayFactory with: $S with: 0.02d0).
	
	arr at: 13 put: (arrayFactory with: $V with: 0.02d0).
	arr at: 14 put: (arrayFactory with: $W with: 0.02d0).
	arr at: 15 put: (arrayFactory with: $Y with: 0.02d0).
	
	self
      writeFasta: 'TWO IUB ambiguity codes'
      from:
         ((randomStreamFact to: n*3 on: arr)
          random: r;
         	yourself).

]

{ #category : #benchmarking }
BenchmarkGameFasta >> writeFasta: aString from: inStream [
   | i |
   out nextPut: $>; nextPutAll: aString; cr.
   i := 0.
   [inStream atEnd] whileFalse:
	  [i == lineLength ifTrue: [out cr. i := 0].
	  out nextPut: inStream next.
	  i := i + 1].
   out cr
]
