Class {
	#name : #BenchmarkGameSpectralNorm,
	#superclass : #Object,
	#instVars : [
		'arrayFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #documentation }
BenchmarkGameSpectralNorm class >> copyright [
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
BenchmarkGameSpectralNorm class >> defaultProblemSize [
	^ 100

]

{ #category : #'instance creation' }
BenchmarkGameSpectralNorm class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkGameSpectralNorm class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkGameSpectralNorm >> initialize [
	arrayFactory := Array

]

{ #category : #helper }
BenchmarkGameSpectralNorm >> matrixA: a and: b [
   ^ 1.0d0 / ((b + a - 2) * (b + a - 1) /2  + b)
]

{ #category : #helper }
BenchmarkGameSpectralNorm >> multiplyAtAv: arr [
	^ self multiplyAtv: (self multiplyAv: arr)

]

{ #category : #helper }
BenchmarkGameSpectralNorm >> multiplyAtv: arr [
   | n atv sum |
   n := arr size.
   atv := arrayFactory new: n.
   1 to: n do: [:i|
	  sum := 0.0d0.
	  1 to: n do: [:j|
		 sum := sum + ((self matrixA: i and: j) * (arr at: j)) ].
	  atv at: i put: sum].
   ^atv
]

{ #category : #helper }
BenchmarkGameSpectralNorm >> multiplyAv: arr [
   | n av sum |
   n := arr size.
   av := arrayFactory new: n.
   1 to: n do: [:i|
	  sum := 0.0d0.
	  1 to: n do: [:j|
		 sum := sum + ((self matrixA: j and: i) * (arr at: j)) ].
	  av at: i put: sum].
   ^av
]

{ #category : #benchmark }
BenchmarkGameSpectralNorm >> spectralnorm: n [
   | u v vBv vv |
   u := arrayFactory new: n withAll: 1.0d0.
   10 timesRepeat:
	  [v := self multiplyAtAv: u.
	   u := self multiplyAtAv: v].
   vBv := 0.0d0.
   vv := 0.0d0.
   1 to: n do:
	  [:i |
	   vBv := vBv + ((u at: i) * (v at: i)).
	   vv := vv + ((v at: i) * (v at: i))].
   ^ (vBv / vv) sqrt
]
