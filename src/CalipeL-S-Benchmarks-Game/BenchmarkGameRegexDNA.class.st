Class {
	#name : #BenchmarkGameRegexDNA,
	#superclass : #Object,
	#instVars : [
		'dictFactory',
		'arrFact'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameRegexDNA class >> copyright [
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
BenchmarkGameRegexDNA class >> defaultProblemSize [
	^ 10000

]

{ #category : #'instance creation' }
BenchmarkGameRegexDNA class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #'test data' }
BenchmarkGameRegexDNA class >> output [
	^ 'agggtaaa|tttaccct 0
[cgt]gggtaaa|tttaccc[acg] 3
a[act]ggtaaa|tttacc[agt]t 9
ag[act]gtaaa|tttac[agt]ct 8
agg[act]taaa|ttta[agt]cct 10
aggg[acg]aaa|ttt[cgt]ccct 3
agggt[cgt]aa|tt[acg]accct 4
agggta[cgt]a|t[acg]taccct 3
agggtaa[cgt]|[acg]ttaccct 5

101745
100000
133640
'

]

{ #category : #benchmarking }
BenchmarkGameRegexDNA class >> regexdna [
	^ self regexdna: self defaultProblemSize

]

{ #category : #benchmarking }
BenchmarkGameRegexDNA class >> regexdna: n [
	| output input |
	input  := BenchmarkGameFastaCache forFasta: n.
	output := TextStream with: String new.
   self new regexDNA: input to: output.
   ^ output

]

{ #category : #documentation }
BenchmarkGameRegexDNA class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkGameRegexDNA >> initialize [
	dictFactory := Dictionary.
	arrFact     := Array.

]

{ #category : #helper }
BenchmarkGameRegexDNA >> matchPatterns [
   | arr |
   arr := arrFact new: 9.
   arr at: 1 put: 'agggtaaa|tttaccct'.
   arr at: 2 put: '[cgt]gggtaaa|tttaccc[acg]'.
   arr at: 3 put: 'a[act]ggtaaa|tttacc[agt]t'.
   arr at: 4 put: 'ag[act]gtaaa|tttac[agt]ct'.
   arr at: 5 put: 'agg[act]taaa|ttta[agt]cct'.
   arr at: 6 put: 'aggg[acg]aaa|ttt[cgt]ccct'.
   arr at: 7 put: 'agggt[cgt]aa|tt[acg]accct'.
   arr at: 8 put: 'agggta[cgt]a|t[acg]taccct'.
   arr at: 9 put: 'agggtaa[cgt]|[acg]ttaccct'.
   ^ arr
]

{ #category : #helper }
BenchmarkGameRegexDNA >> occurrencesOfRegex: regex in: aString [
	| cnt |
	cnt := 0.
	aString regex: regex matchesCollect: [:match | cnt := cnt + 1].
	^ cnt

]

{ #category : #benchmarking }
BenchmarkGameRegexDNA >> regexDNA: sequence to: output [
   | s size1 size2 translation |
   size1 := sequence size.

   "* remove FASTA sequence descriptions and new-lines *"
   s := sequence copyWithRegex: '>\w*\s\w*\s\w*\s\w*\s|\s' matchesReplacedWith: ''.
   size2 := s size.

   "* regex match *"
   self matchPatterns do: [:each| 
	  output 
		 nextPutAll: each; space; 
		 print: (self occurrencesOfRegex: each in: s); cr
	  ]. 

   "* regex substitution *"
   translation := dictFactory new.
   self substitutionPatterns do: [:each| 
	  translation at: each first put: each last].

   s := s copyWithRegex: '[', 
		 ((arrFact withAll: translation keys) fold: [:a :b| a, b]), ']'
	  matchesTranslatedUsing: [:l| translation at: l].

   output
	  cr;
	  print: size1; cr; 
	  print: size2; cr; 
	  print: s size; cr
]

{ #category : #helper }
BenchmarkGameRegexDNA >> substitutionPatterns [
	| arr |
	arr := arrFact new: 11.
	arr at:  1 put: (arrFact with: 'B' with: '(c|g|t)').
	arr at:  2 put: (arrFact with: 'D' with: '(a|g|t)').
	arr at:  3 put: (arrFact with: 'H' with: '(a|c|t)').
	arr at:  4 put: (arrFact with: 'K' with: '(g|t)').
	arr at:  5 put: (arrFact with: 'M' with: '(a|c)').
	arr at:  6 put: (arrFact with: 'N' with: '(a|c|g|t)').
	arr at:  7 put: (arrFact with: 'R' with: '(a|g)').
	arr at:  8 put: (arrFact with: 'S' with: '(c|g)').
	arr at:  9 put: (arrFact with: 'V' with: '(a|c|g)').
	arr at: 10 put: (arrFact with: 'W' with: '(a|t)').
	arr at: 11 put: (arrFact with: 'Y' with: '(c|t)').
	^ arr
]
