Class {
	#name : #BenchmarkGameMall,
	#superclass : #Object,
	#instVars : [
		'guard',
		'maxRendezvous',
		'open',
		'process',
		'queue',
		'cache',
		'pairCache',
		'pairFactory',
		'sharedQueueFactory',
		'orderedCollectionFactory'
	],
	#classVars : [
		'Units'
	],
	#classInstVars : [
		'lastSum'
	],
	#category : #'CalipeL-S-Benchmarks-Game-ChameneosRedux'
}

{ #category : #documentation }
BenchmarkGameMall class >> copyright [
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

{ #category : #'initialize-release' }
BenchmarkGameMall class >> initialize [
   "self initialize"

   Units := #('zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine')
]

{ #category : #'initialize-release' }
BenchmarkGameMall class >> new [
   ^self shouldNotImplement
]

{ #category : #accessing }
BenchmarkGameMall class >> units [
   ^Units
]

{ #category : #documentation }
BenchmarkGameMall class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #controlling }
BenchmarkGameMall >> close [
   open := false
]

{ #category : #'initialize-release' }
BenchmarkGameMall >> initialize [
	super initialize.
	self initializeFactories.
   guard := Semaphore forMutualExclusion.
   queue := sharedQueueFactory new.
   cache := orderedCollectionFactory new.
   1 to: 10 do: [:x | cache add: pairFactory new].

]

{ #category : #'initialize-release' }
BenchmarkGameMall >> initializeFactories [
	pairFactory := BenchmarkGamePair.
	sharedQueueFactory := SharedQueue.
	orderedCollectionFactory := OrderedCollection.

]

{ #category : #accessing }
BenchmarkGameMall >> maxRendezvous: max [ 
   maxRendezvous := max
]

{ #category : #private }
BenchmarkGameMall >> obtainPair [
   ^cache removeFirst
]

{ #category : #private }
BenchmarkGameMall >> processVisitors [
   [open] whileTrue: 
		 [1 to: maxRendezvous
			do: 
			   [:x | 
			   | first second |
			   first := queue next.
			   second := queue next.
			   self setPartnersOn: first and: second.
			   first signal.
			   second signal].
		 [queue isEmpty] whileFalse: [queue next signal]].
   process terminate.
   process := nil
]

{ #category : #private }
BenchmarkGameMall >> releasePair: pair [ 
   pair release.
   cache addFirst: pair
]

{ #category : #'initialize-release' }
BenchmarkGameMall >> run [
   open := true.
   process ifNil: 
		 [process := [self processVisitors] newProcess.
		 process priority: Processor userBackgroundPriority -1 ].
   process resume
]

{ #category : #private }
BenchmarkGameMall >> setPartnersOn: first and: second [
   first partner: second me.
   second partner: first me.
]

{ #category : #private }
BenchmarkGameMall >> shutdown [
   [queue isEmpty] whileFalse: [queue next signal].
   process terminate.
   process := nil
]

{ #category : #controlling }
BenchmarkGameMall >> visitWith: aChameneos [ 
   | pair partner |
   pair := self obtainPair.
   pair me: aChameneos.
   queue nextPut: pair.
   pair wait.
   partner := pair partner.
   self releasePair: pair.
   ^partner
]
