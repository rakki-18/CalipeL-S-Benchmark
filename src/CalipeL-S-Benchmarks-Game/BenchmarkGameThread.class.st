"
A BGThread is xxxxxxxxx.

* The Computer Language Benchmarks Game
    http://benchmarksgame.alioth.debian.org/
    adapted from a program by Paolo Bonzini
    contributed by Isaac Gouy 
    modified by Carlo Teixeira.
    Ported to Pharo/Squeak by Stefan Marr *

Instance Variables
	done:		<Object>
	name:		<Object>
	nextThread:		<Object>
	semaphore:		<Object>
	token:		<Object>

done
	- xxxxx

name
	- xxxxx

nextThread
	- xxxxx

semaphore
	- xxxxx

token
	- xxxxx

"
Class {
	#name : #BenchmarkGameThread,
	#superclass : #Object,
	#instVars : [
		'name',
		'nextThread',
		'token',
		'semaphore',
		'done'
	],
	#category : #'CalipeL-S-Benchmarks-Game-ThreadRing'
}

{ #category : #documentation }
BenchmarkGameThread class >> copyright [
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
BenchmarkGameThread class >> named: anInteger next: aThread done: completionBlock [
   ^ self new 
						name: anInteger;
						nextThread: aThread;
						done: completionBlock;
						fork
]

{ #category : #'instance creation' }
BenchmarkGameThread class >> new [
   ^ self basicNew
						semaphore: Semaphore new
]

{ #category : #documentation }
BenchmarkGameThread class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkGameThread >> done: completionBlock [
	done := completionBlock

]

{ #category : #thread }
BenchmarkGameThread >> fork [
   [ self run ] forkAt: Processor userBackgroundPriority
]

{ #category : #accessing }
BenchmarkGameThread >> name: anInteger [
   name := anInteger
]

{ #category : #accessing }
BenchmarkGameThread >> nextThread: aThread [
   nextThread := aThread
]

{ #category : #thread }
BenchmarkGameThread >> run [
   [ semaphore wait.
	 token < 503 ] whileFalse: [
																nextThread takeToken: token - 1].
		
		token == 0 ifFalse: [ nextThread takeToken: token - 1 ]
										 ifTrue:  [ done value: name ]
										 
		
   
]

{ #category : #accessing }
BenchmarkGameThread >> semaphore: aSemaphore [
   semaphore := aSemaphore
]

{ #category : #accessing }
BenchmarkGameThread >> takeToken: x [
   token := x.
   semaphore signal
]
