"
A BGMeteor is xxxxxxxxx.

* The Computer Language Benchmarks Game
    http://benchmarksgame.alioth.debian.org/
    contributed by Nicolas Cellier *

Instance Variables

"
Class {
	#name : #BenchmarkGameMeteor,
	#superclass : #Object,
	#instVars : [
		'meteorBoardFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameMeteor class >> copyright [
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
BenchmarkGameMeteor class >> defaultProblemSize [
	^ 2098

]

{ #category : #benchmarking }
BenchmarkGameMeteor class >> meteor [
	^ self meteor: 2098

]

{ #category : #benchmarking }
BenchmarkGameMeteor class >> meteor: n [
	| output |
	output := TextStream with: String new.
	self new meteor: n to: output.
	^ output

]

{ #category : #'instance creation' }
BenchmarkGameMeteor class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #'test data' }
BenchmarkGameMeteor class >> output [
	^ '2098 solutions found

0 0 0 0 1 
 2 2 2 0 1 
2 6 6 1 1 
 2 6 1 5 5 
8 6 5 5 5 
 8 6 3 3 3 
4 8 8 9 3 
 4 4 8 9 3 
4 7 4 7 9 
 7 7 7 9 9 

9 9 9 9 8 
 9 6 6 8 5 
6 6 8 8 5 
 6 8 2 5 5 
7 7 7 2 5 
 7 4 7 2 0 
1 4 2 2 0 
 1 4 4 0 3 
1 4 0 0 3 
 1 1 3 3 3 

'

]

{ #category : #documentation }
BenchmarkGameMeteor class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkGameMeteor >> initialize [
	meteorBoardFactory := BenchmarkGameMeteorBoard

]

{ #category : #benchmarking }
BenchmarkGameMeteor >> meteor: nMax to: outputStream [
	^ self meteor: nMax with: meteorBoardFactory default to: outputStream

]

{ #category : #benchmarking }
BenchmarkGameMeteor >> meteor: nMax with: aBoard to: outputStream [
	| board count minSolution maxSolution |
	count := 0.
	minSolution := String new: 50 withAll: $9.
	maxSolution := String new: 50 withAll: $0.
	aBoard solvedPuzzleDo:
		[:aString |
			count := count + 1.
			aString < minSolution ifTrue: [minSolution := aString].
			aString > maxSolution ifTrue: [maxSolution := aString]]. 
	outputStream print: count; nextPutAll: ' solutions found'; cr; cr.
	aBoard printSolution: minSolution on: outputStream.
	outputStream cr.
	aBoard printSolution: maxSolution on: outputStream.
	outputStream cr.
]
