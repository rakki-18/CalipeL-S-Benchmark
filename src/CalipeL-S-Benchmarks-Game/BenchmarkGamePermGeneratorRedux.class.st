Class {
	#name : #BenchmarkGamePermGeneratorRedux,
	#superclass : #Object,
	#instVars : [
		'timesRotated',
		'perm',
		'atEnd'
	],
	#category : #'CalipeL-S-Benchmarks-Game-FannkuchRedux'
}

{ #category : #documentation }
BenchmarkGamePermGeneratorRedux class >> copyright [
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
BenchmarkGamePermGeneratorRedux class >> new: size [
   ^self new
	  initialize: size;
	  yourself
]

{ #category : #documentation }
BenchmarkGamePermGeneratorRedux class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkGamePermGeneratorRedux >> atEnd [
   ^atEnd
]

{ #category : #'initialize-release' }
BenchmarkGamePermGeneratorRedux >> initialize: size [
   perm := (1 to: size) asArray.
   timesRotated := Array new: size withAll: 0.
   atEnd := false.
]

{ #category : #'initialize-release' }
BenchmarkGamePermGeneratorRedux >> makeNext [
   | temp remainder |
   "* Generate the next permutation. *"
   2 to: perm size do: [ :r |
	  "* Rotate the first r items to the left. *"
	  temp := perm at: 1.
	  1 to: r - 1 do: [ :i | perm at: i put: (perm at: i + 1) ].
	  perm at: r put: temp.

	  remainder := timesRotated at: r put: ((timesRotated at: r) + 1) \\ r.
	  remainder = 0 ifFalse: [ ^self ].

	  "* After r rotations, the first r items are in their original positions.
	  Go on rotating the first r+1 items. *"
   ].

   "* We are past the final permutation. *"
   atEnd := true
]

{ #category : #accessing }
BenchmarkGamePermGeneratorRedux >> next [
   | result |
   result := perm copy.
   self makeNext.
   ^result
]
