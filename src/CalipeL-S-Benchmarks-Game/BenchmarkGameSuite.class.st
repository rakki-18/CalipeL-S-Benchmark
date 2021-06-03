Class {
	#name : #BenchmarkGameSuite,
	#superclass : #Object,
	#instVars : [
		'problemSize'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameSuite class >> copyright [
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

{ #category : #'instance creation' }
BenchmarkGameSuite class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #running }
BenchmarkGameSuite class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkGameSuite class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkGameSuite class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchBinaryTrees [
		<benchmark: 'Binary Trees'>

		| bench |
		bench := BenchmarkGameBinaryTrees new.
		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameBinaryTrees defaultProblemSize
		].
		^ bench binarytrees: problemSize to: (TextStream with: String new).

	"Modified: / 23-06-2013 / 02:31:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchChameleons [
		<benchmark: 'Chameleons'>

		| result  |
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameChameleons defaultProblemSize
].
		result := BenchmarkGameChameleons chameneos: problemSize.
		
		"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
		"self flag: 'TODO adapt once verification is supported'."
		result = (2 * problemSize) ifFalse: [
				Error signal: (BenchmarkGameChameleons name, ' benchmark failed. Input: ', 
																 problemSize asString, ' Output: ', result asString).
		].

	"Modified: / 23-06-2013 / 02:34:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchChameneosRedux [
	"Not yet updated to CalipeL-S"

"/        | result report  |"
"/        problemSize isNil ifTrue:[ "
"/            problemSize := BenchmarkGameChameneosRedux defaultProblemSize "
"/        ]."
"/        report := TextStream with: String new."
"/        result := BenchmarkGameChameneosRedux new runBenchMark: problemSize on: report."
"/        "
"/        Result should be 2*problemSize"
"/        self flag: 'TODO: adapt once verification is supported'."
"/        result = (2 * problemSize) ifFalse: ["
"/                Error signal: self class name, ' benchmark failed. Input: ',"
"/                                                                 runner processes asString, ' Output: ', result asString  ]."
"/"

	"Modified (comment): / 21-06-2013 / 16:42:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchFannkuchRedux [
	<benchmark: 'Fannkuch-Redux'>

	| f  |
	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameFannkuchRedux defaultProblemSize 
	].
	f := BenchmarkGameFannkuchRedux fannkuchRedux: problemSize to: (TextStream with: String new).
   
		" the output should only be done by some reporter"
		"ScriptConsole print: 'Pfannkuchen(', problemSize asString , ') = ', f asString."
   ^f

	"Modified: / 23-06-2013 / 02:31:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchFasta [
	<benchmark: 'Fasta'>


		| out  |
		out := TextStream with: String new.
		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameFasta defaultProblemSize
		].
		BenchmarkGameFasta fasta: problemSize to: out.

	"Modified: / 23-06-2013 / 02:31:56 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchKNucleotide [
	"<benchmark: 'K-Nucleotide'>"

		| bench input result  output |
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameKNucleotide defaultProblemSize
].
		
		bench := BenchmarkGameKNucleotide new.
		input := ReadStream on: (BenchmarkGameFastaCache forFasta: problemSize).
		result := TextStream with: String new.
		output := bench knucleotide5From: input to: result.
		
		^ output

	"Modified: / 21-06-2013 / 16:46:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchMandelbrot [
	"<benchmark: 'Mandelbrot'>"

		| result bench |
		bench := BenchmarkGameMandelbrot new.
		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameMandelbrot defaultProblemSize
].
		result := bench mandelbrot2: problemSize.
		result reset.
		^ result contents

	"Modified (comment): / 23-06-2013 / 02:32:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchMeteor [
	"<benchmark: 'Meteor'>"


		problemSize isNil ifTrue:[
	problemSize := BenchmarkGameMeteor defaultProblemSize
].
		^ BenchmarkGameMeteor meteor: problemSize.

	"Modified: / 21-06-2013 / 16:46:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchNBody [
	<benchmark: 'N-Body'>

		problemSize isNil ifTrue:[
			problemSize := BenchmarkGameNBody defaultProblemSize
		].
		BenchmarkGameNBody nbody: problemSize.

	"Modified: / 23-06-2013 / 02:32:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchPiDigits [
	<benchmark: 'Pi-Digits'>

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGamePiDigits defaultProblemSize
	].
	^ BenchmarkGamePiDigits piDigits: problemSize.

	"Modified: / 23-06-2013 / 02:32:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchRegexDNA [
	"<benchmark: 'Regex DNA'>"

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameRegexDNA defaultProblemSize
	].
	BenchmarkGameRegexDNA regexdna: problemSize

	"Modified: / 21-06-2013 / 16:46:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:32:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchReverseComplement [
	"<benchmark: 'Reverse Complement'>"

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameReverseComplement defaultProblemSize
	].
	BenchmarkGameReverseComplement revcomp: problemSize

	"Modified: / 21-06-2013 / 16:46:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:33:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchSpectralNorm [
	"<benchmark: 'Spectral Nrm'>"

	| bench  |
	bench := BenchmarkGameSpectralNorm new.
	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameSpectralNorm defaultProblemSize
	].
	^ bench spectralnorm: problemSize.

	"Modified: / 21-06-2013 / 16:46:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:33:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchThreadRing [
	<benchmark: 'Thread Ring'>

	problemSize isNil ifTrue:[
		problemSize := BenchmarkGameThreadRing defaultProblemSize
	].
	^ BenchmarkGameThreadRing threadring: problemSize.

	"Modified: / 23-06-2013 / 02:33:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #initialization }
BenchmarkGameSuite >> initialize [
	"Invoked when a new instance is created."

	"/ please change as required (and remove this comment)"

	"/ super initialize.   -- commented since inherited method does nothing"
]

{ #category : #accessing }
BenchmarkGameSuite >> problemSize [
	^ problemSize
]

{ #category : #accessing }
BenchmarkGameSuite >> problemSize:anInteger [
	<parameter: #Integer>

	problemSize := anInteger.

	"Modified: / 14-07-2013 / 16:54:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
