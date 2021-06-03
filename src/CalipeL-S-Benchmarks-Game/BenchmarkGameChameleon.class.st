Class {
	#name : #BenchmarkGameChameleon,
	#superclass : #Object,
	#instVars : [
		'meetings',
		'color',
		'semaphore',
		'waitingForPair'
	],
	#classVars : [
		'WaitBlock'
	],
	#category : #'CalipeL-S-Benchmarks-Game-Chameleons'
}

{ #category : #'instance creation' }
BenchmarkGameChameleon class >> color: c [
	^self new
		initialize;
		color: c
]

{ #category : #documentation }
BenchmarkGameChameleon class >> copyright [
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

{ #category : #initialization }
BenchmarkGameChameleon class >> initialize [
	"Invoked at system start or when the class is dynamically loaded."

	Smalltalk isSmalltalkX ifTrue:[
		WaitBlock := [:semaphore :timeout |
			(semaphore waitTimeoutSeconds: timeout) isNil ifTrue:[
				semaphore halt.
			]
		].
		^self.
	].

	Smalltalk isSqueak ifTrue:[
		WaitBlock := [:semaphore :timeout |
			(semaphore waitTimeoutSeconds: timeout) ifTrue:[
				Halt now.
			]
		]
	].

	"Modified: / 21-06-2013 / 03:46:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 22-06-2013 / 15:05:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkGameChameleon class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkGameChameleon >> color [
	^color
]

{ #category : #'changing colours' }
BenchmarkGameChameleon >> color: c [
	color := c
]

{ #category : #'changing colours' }
BenchmarkGameChameleon >> fade [
	color := #faded.
	waitingForPair signal.
	semaphore signal
]

{ #category : #running }
BenchmarkGameChameleon >> fork: meetingPlace [
	^[ self run: meetingPlace ] fork
]

{ #category : #'initialize-release' }
BenchmarkGameChameleon >> initialize [
	meetings := 0.
	waitingForPair := Semaphore new.
	semaphore := Semaphore new
]

{ #category : #accessing }
BenchmarkGameChameleon >> meetings [
	^meetings
]

{ #category : #'changing colours' }
BenchmarkGameChameleon >> met: other [
	| newColor |
	meetings := meetings + 1.
	color == #red ifTrue: [
	newColor := other == #yellow ifTrue: [ #blue ] ifFalse: [ #yellow ] ].
	color == #yellow ifTrue: [
	newColor := other == #red ifTrue: [ #blue ] ifFalse: [ #red ] ].
	color == #blue ifTrue: [
	newColor := other == #red ifTrue: [ #yellow ] ifFalse: [ #red ] ].
	color := newColor.
	waitingForPair signal
]

{ #category : #running }
BenchmarkGameChameleon >> run: meetingPlace [
	[ color == #faded ] whileFalse: [
		meetingPlace reachedBy: self.
		waitingForPair wait ]
]

{ #category : #accessing }
BenchmarkGameChameleon >> wait [
	WaitBlock value: semaphore value: 60*60.

	"Modified: / 22-06-2013 / 22:33:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
