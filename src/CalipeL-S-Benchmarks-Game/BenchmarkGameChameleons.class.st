Class {
	#name : #BenchmarkGameChameleons,
	#superclass : #Object,
	#instVars : [
		'chameleonFactory',
		'meetingPlaceFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #'benchmark scripts' }
BenchmarkGameChameleons class >> chameneos [
	" reports back the number of meetings "
	^ self chameneos: 1000000

]

{ #category : #benchmarking }
BenchmarkGameChameleons class >> chameneos: n [
	^ self new chameneos: n
]

{ #category : #documentation }
BenchmarkGameChameleons class >> copyright [
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
BenchmarkGameChameleons class >> defaultProblemSize [
		^ 1000000

	"Modified: / 21-06-2013 / 16:52:51 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instance creation' }
BenchmarkGameChameleons class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkGameChameleons class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarking }
BenchmarkGameChameleons >> chameneos: n [
	| c1 c2 c3 c4 mp |
	c1 := chameleonFactory color: #blue.
	c2 := chameleonFactory color: #red.
	c3 := chameleonFactory color: #yellow.
	c4 := chameleonFactory color: #blue.
	mp := meetingPlaceFactory forMeetings: n.
	c1 fork: mp.
	c2 fork: mp.
	c3 fork: mp.
	c4 fork: mp.
	c1 wait.
	c2 wait.
	c3 wait.
	c4 wait.
	^ c1 meetings + c2 meetings + c3 meetings + c4 meetings
]

{ #category : #'initialize-release' }
BenchmarkGameChameleons >> initialize [
	super initialize.
	chameleonFactory := BenchmarkGameChameleon.
	meetingPlaceFactory := BenchmarkGameMeetingPlace.

]
