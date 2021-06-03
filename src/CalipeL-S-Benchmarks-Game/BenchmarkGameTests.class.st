Class {
	#name : #BenchmarkGameTests,
	#superclass : #TestCase,
	#category : #'CalipeL-S-Benchmarks-Game-Tests'
}

{ #category : #documentation }
BenchmarkGameTests class >> copyright [
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

{ #category : #documentation }
BenchmarkGameTests class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #tests }
BenchmarkGameTests >> testBinaryTrees [
	| bench output expected |
	bench := BenchmarkGameBinaryTrees new.
	output := (TextStream with: String new).

	self assert: -1 equals: (bench binarytrees: 10 to: output).
	
	expected := 'stretch tree of depth 11	 check: -1
2048	 trees of depth 4	 check: -2048
512	 trees of depth 6	 check: -512
128	 trees of depth 8	 check: -128
32	 trees of depth 10	 check: -32
long lived tree of depth 10	 check: -1
'.
	self assert: expected equals: output contents.

]

{ #category : #tests }
BenchmarkGameTests >> testBinaryTreesResult [
	| bench output |
	bench := BenchmarkGameBinaryTrees new.
				
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 9 to: output).
	
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 8 to: output).
	
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 7 to: output).
	
	

]

{ #category : #tests }
BenchmarkGameTests >> testChameleons [
	self assert: (BenchmarkGameChameleons chameneos:     100) equals: 200. 
	self assert: (BenchmarkGameChameleons chameneos:   10000) equals: 20000.
	self assert: (BenchmarkGameChameleons chameneos: 1000000) equals: 2000000.

]

{ #category : #tests }
BenchmarkGameTests >> testChameneosRedux [
	| report result |
	
	report := TextStream with: String new.
	result := BenchmarkGameChameneosRedux new runBenchMark: 600 on: report.
	self assert: result equals: 1200.
	
	report := TextStream with: String new.
	result := BenchmarkGameChameneosRedux new runBenchMark: 555 on: report.
	self assert: result equals: (555 * 2).
	
	report := TextStream with: String new.
	result := BenchmarkGameChameneosRedux new runBenchMark: 121 on: report.
	self assert: result equals: (121 * 2).
	

]

{ #category : #tests }
BenchmarkGameTests >> testFannkuchReduxResult [
	 | f |
	f := BenchmarkGameFannkuchRedux fannkuchRedux: 7 to: (TextStream with: String new).
	self assert: f equals: 16

]

{ #category : #tests }
BenchmarkGameTests >> testFasta [
	| result |
	self flag: 'TODO: add proper verification'.
	self shouldnt: [result := BenchmarkGameFasta fasta] raise: Error.
	self assert: (result size > 0).
	self assert: (result isKindOf: String).
	

]

{ #category : #tests }
BenchmarkGameTests >> testKNucleotide [
	| input result |
	input  := ReadStream on: (BenchmarkGameFastaCache forFasta: BenchmarkGameKNucleotide defaultProblemSize).
	result := TextStream with: String new.
	BenchmarkGameKNucleotide new knucleotide5From: input to: result.
	
	self assert: result contents equals: BenchmarkGameKNucleotide output.

]

{ #category : #tests }
BenchmarkGameTests >> testMandelbrot [
	| result |
	
	result := BenchmarkGameMandelbrot new mandelbrot2: 200.
	result reset. "set possition to beginning"
	
	self assert: result contents equals: BenchmarkGameMandelbrot output.

]

{ #category : #tests }
BenchmarkGameTests >> testMeteor [
	| result |
	result := BenchmarkGameMeteor meteor.
	self assert: result contents equals: BenchmarkGameMeteor output

]

{ #category : #tests }
BenchmarkGameTests >> testNBody [
	| result |
	result := BenchmarkGameNBody nbody: 1000.
	
	self assert: (((result at: 2) asString) beginsWith: '-0.169087605')

]

{ #category : #tests }
BenchmarkGameTests >> testPiDigits [
	| piDigits27 |
	piDigits27 := #(3 1 4 1 5 9 2 6 5 3
				  5 8 9 7 9 3 2 3 8 4
				  6 2 6 4 3 3 8).

	self assert: piDigits27 equals: (BenchmarkGamePiDigits piDigits: 27)
]

{ #category : #tests }
BenchmarkGameTests >> testRegexDNA [
	| output input |
	input := BenchmarkGameFastaCache forFasta: BenchmarkGameRegexDNA defaultProblemSize.
	
	output := TextStream with: String new.
	
	BenchmarkGameRegexDNA new regexDNA: input to: output.
	self assert: output contents equals: BenchmarkGameRegexDNA output

]

{ #category : #tests }
BenchmarkGameTests >> testReverseComplement [
	self assert: BenchmarkGameReverseComplement revcomp equals: BenchmarkGameReverseComplement output 

]

{ #category : #tests }
BenchmarkGameTests >> testSpectralNorm [
	| result |
	result := BenchmarkGameSpectralNorm new spectralnorm: 100.
	self assert: (result printShowingDecimalPlaces: 9) equals: '1.274219991'

]

{ #category : #tests }
BenchmarkGameTests >> testThreadRing [
	| result |
	result := BenchmarkGameThreadRing threadring: 1000.
	self assert: result equals: 498

]
