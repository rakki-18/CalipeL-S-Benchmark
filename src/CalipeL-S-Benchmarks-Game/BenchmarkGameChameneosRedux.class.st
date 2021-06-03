Class {
	#name : #BenchmarkGameChameneosRedux,
	#superclass : #Object,
	#instVars : [
		'lastSum',
		'colorFactory',
		'mallFactory',
		'arrayFactory',
		'collectionFactory',
		'creatureFactory'
	],
	#category : #'CalipeL-S-Benchmarks-Game'
}

{ #category : #'benchmarking-scripts' }
BenchmarkGameChameneosRedux class >> chameneosredux2 [
	"ChameneosRedux chameneosredux2" 
	| report |
	report := TextStream with: String new.
	self new runBenchMark: 600 on: report.
	^report contents

]

{ #category : #documentation }
BenchmarkGameChameneosRedux class >> copyright [
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
BenchmarkGameChameneosRedux class >> defaultProblemSize [
	^ 6000

]

{ #category : #'instance creation' }
BenchmarkGameChameneosRedux class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkGameChameneosRedux class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #'instance creation' }
BenchmarkGameChameneosRedux >> createAllowing: maxRendezvous [ 
   ^ mallFactory basicNew initialize maxRendezvous: maxRendezvous
]

{ #category : #'instance creation' }
BenchmarkGameChameneosRedux >> createCreaturesWith: aCollectionOfColours [ 
   | aName |
   aName := 0.
   ^aCollectionOfColours collect: 
		 [:aColour | 
		 aName := aName + 1.
		 creatureFactory withName: aName colour: aColour]
]

{ #category : #reporting }
BenchmarkGameChameneosRedux >> generateReportFor: creatures printOn: stream [ 
   | sum |
   sum := creatures inject: 0 into: [:accum :each | accum + each creaturesMet].
   creatures do: 
		 [:aCreature | 
		 aCreature creaturesMet printOn: stream.
		 stream
			space;
			nextPutAll: (mallFactory units at: aCreature selfMet + 1);
			cr].
   stream space.
   sum printString 
	  do: [:el | stream nextPutAll: (mallFactory units at: el digitValue + 1)]
	  separatedBy: [stream space].
		lastSum := sum.
   ^ stream
]

{ #category : #reporting }
BenchmarkGameChameneosRedux >> generateReportForColours: colours printOn: stream [ 
   stream space.
   colours do: [:colour | colour printOn: stream] separatedBy: [stream space].
   ^ stream
]

{ #category : #'initialize-release' }
BenchmarkGameChameneosRedux >> initialize [
	super initialize.
	colorFactory := BenchmarkGameChameneosColour.
	mallFactory  := BenchmarkGameMall.
	creatureFactory := BenchmarkGameCreature.
	
	arrayFactory := Array.
	collectionFactory := OrderedCollection.

]

{ #category : #setup }
BenchmarkGameChameneosRedux >> openMall: aMall forCreatures: creatures usingGuard: sema [ 
   | processes |
   processes := creatures 
			collect: [:aCreature | 
			   [aCreature visitMall: aMall.
			   sema signal] newProcess].
   processes do: 
		 [:proc | 
		 proc priority: Processor userBackgroundPriority.
		 proc resume]
]

{ #category : #setup }
BenchmarkGameChameneosRedux >> openMallWith: aCollectionOfColours forNumberOfMeets: aNumber [ 
   | mall creatures guard |
   mall := self createAllowing: aNumber.
   mall run.
   creatures := self createCreaturesWith: aCollectionOfColours.
   guard := Semaphore new.
   self 
	  openMall: mall
	  forCreatures: creatures
	  usingGuard: guard.
   self 
	  waitForClosingOfMall: mall
	  withCreatures: creatures
	  usingGuard: guard.
   ^creatures
]

{ #category : #public }
BenchmarkGameChameneosRedux >> runBenchMark: number on: anOutputStream [ 
   "self runBenchMark: 60000 on: Transcript."

   | firstTestColours secondTestColours blue red yellow creatures |
   blue   := colorFactory blue.
   red    := colorFactory red.
   yellow := colorFactory yellow.
   firstTestColours := arrayFactory 
			with: blue
			with: red
			with: yellow.
   secondTestColours := (collectionFactory new: 10)
			add: blue;
			add: red;
			add: yellow;
			add: red;
			add: yellow;
			add: blue;
			add: red;
			add: yellow;
			add: red;
			add: blue;
			yourself.

   (colorFactory generateReportOfColoursOn: anOutputStream) cr.
   (self generateReportForColours: firstTestColours printOn: anOutputStream) 
	  cr.
   creatures := self openMallWith: firstTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
	  cr;
	  cr.
   (self generateReportForColours: secondTestColours printOn: anOutputStream) 
	  cr.
   creatures := self openMallWith: secondTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
	  cr;
	  cr.
		^ lastSum
]

{ #category : #setup }
BenchmarkGameChameneosRedux >> waitForClosingOfMall: aMall withCreatures: creatures usingGuard: guard [ 
   creatures size timesRepeat: [guard wait].
   aMall close
]
