Class {
	#name : #BenchmarkGamePiDigits,
	#superclass : #Object,
	#instVars : [
		'spigotFactory',
		'arrayFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGamePiDigits class >> copyright [
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
BenchmarkGamePiDigits class >> defaultProblemSize [
		^ 5000

	"Modified: / 21-06-2013 / 17:33:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkGamePiDigits class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #benchmarking }
BenchmarkGamePiDigits class >> piDigits: n [
	^ self new piDigitsTo: n

]

{ #category : #documentation }
BenchmarkGamePiDigits class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkGamePiDigits >> initialize [
	spigotFactory := BenchmarkGamePiDigitSpigot.
	arrayFactory  := Array.

]

{ #category : #benchmarking }
BenchmarkGamePiDigits >> piDigitsTo: n [
   ^ self piDigitsTo: n with: spigotFactory new.
 
]

{ #category : #benchmarking }
BenchmarkGamePiDigits >> piDigitsTo: n with: piDigits [
   | i array |
   array := arrayFactory new: n.
   i := 1.
   
   [i <= n] whileTrue:
	  [ array at: i put: piDigits next.
			 i := i + 1 ].
		^ array
]
