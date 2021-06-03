Class {
	#name : #BenchmarkGameMeetingPlace,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'first',
		'total',
		'max'
	],
	#category : #'CalipeL-S-Benchmarks-Game-Chameleons'
}

{ #category : #documentation }
BenchmarkGameMeetingPlace class >> copyright [
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
BenchmarkGameMeetingPlace class >> forMeetings: maxMeetings [
	^super new
		initialize;
		max: maxMeetings;
		yourself
]

{ #category : #documentation }
BenchmarkGameMeetingPlace class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'initialize-release' }
BenchmarkGameMeetingPlace >> initialize [
	mutex := Semaphore forMutualExclusion.
	total := 0
]

{ #category : #running }
BenchmarkGameMeetingPlace >> max: maxMeetings [
	max := maxMeetings
]

{ #category : #running }
BenchmarkGameMeetingPlace >> organizeMeetingWith: second [
	total >= max
		ifTrue: [
			first fade.
			second fade ]
		ifFalse: [
			first met: second color.
			second met: first color ].
	total := total + 1
]

{ #category : #running }
BenchmarkGameMeetingPlace >> reachedBy: chameleon [
	mutex critical: [
		first isNil
			ifTrue: [ first := chameleon ]
			ifFalse: [ self organizeMeetingWith: chameleon. first := nil ] ]
]
