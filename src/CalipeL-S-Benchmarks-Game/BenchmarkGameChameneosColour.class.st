Class {
	#name : #BenchmarkGameChameneosColour,
	#superclass : #Object,
	#instVars : [
		'color'
	],
	#classInstVars : [
		'Blue',
		'Red',
		'Yellow'
	],
	#category : #'CalipeL-S-Benchmarks-Game-ChameneosRedux'
}

{ #category : #accessing }
BenchmarkGameChameneosColour class >> blue [
   ^ Blue
]

{ #category : #accessing }
BenchmarkGameChameneosColour class >> blue: anObject [
   Blue := anObject
]

{ #category : #documentation }
BenchmarkGameChameneosColour class >> copyright [
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
BenchmarkGameChameneosColour class >> createBlue [
   "comment stating purpose of message"

   ^ self new color: #blue
]

{ #category : #'initialize-release' }
BenchmarkGameChameneosColour class >> createRed [
   "comment stating purpose of message"

   ^ self new color: #red
]

{ #category : #'initialize-release' }
BenchmarkGameChameneosColour class >> createYellow [
   "comment stating purpose of message"

   ^ self new color: #yellow
]

{ #category : #printing }
BenchmarkGameChameneosColour class >> generateReportOfColoursOn: readOut [ 
   | colours |
   colours := Array 
			with: Blue
			with: Red
			with: Yellow.
   colours do: 
		 [:aColour | 
		 colours do: 
			   [:anotherColour | 
			   aColour printOn: readOut.
			   readOut nextPutAll: ' + '.
			   anotherColour printOn: readOut.
			   readOut nextPutAll: ' -> '.
			   (aColour complementaryColourFor: anotherColour) printOn: readOut.
			   readOut cr]].
   ^readOut
]

{ #category : #'initialize-release' }
BenchmarkGameChameneosColour class >> initialize [
   "self initialize"

   Red := self createRed.
   Blue := self createBlue.
   Yellow := self createYellow
]

{ #category : #accessing }
BenchmarkGameChameneosColour class >> red [
   ^ Red
]

{ #category : #accessing }
BenchmarkGameChameneosColour class >> red: anObject [
   Red := anObject
]

{ #category : #documentation }
BenchmarkGameChameneosColour class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkGameChameneosColour class >> yellow [
   ^ Yellow
]

{ #category : #accessing }
BenchmarkGameChameneosColour class >> yellow: anObject [
   Yellow := anObject
]

{ #category : #accessing }
BenchmarkGameChameneosColour >> color [
   ^color
]

{ #category : #accessing }
BenchmarkGameChameneosColour >> color: aColor [ 
   color := aColor
]

{ #category : #helper }
BenchmarkGameChameneosColour >> complementaryColourFor: aChameneosColour [ 
   "determine the complementary colour defined as..."

   self == aChameneosColour ifTrue: [^self].
   self isBlue 
	  ifTrue: 
		 [aChameneosColour isRed 
			ifTrue: [^self class yellow]
			ifFalse: [^self class red]].
   self isRed 
	  ifTrue: 
		 [aChameneosColour isBlue 
			ifTrue: [^self class yellow]
			ifFalse: [^self class blue]].
   aChameneosColour isBlue 
	  ifTrue: [^self class red]
	  ifFalse: [^self class blue]
]

{ #category : #testing }
BenchmarkGameChameneosColour >> hasSameColorAs: aChameneos [ 
   ^self color == aChameneos color
]

{ #category : #testing }
BenchmarkGameChameneosColour >> isBlue [
   ^self == self class blue
]

{ #category : #testing }
BenchmarkGameChameneosColour >> isRed [
   ^self == self class red
]

{ #category : #testing }
BenchmarkGameChameneosColour >> isYellow [
   ^self == self class yellow
]

{ #category : #printing }
BenchmarkGameChameneosColour >> printOn: aStream [ 
   aStream nextPutAll: self color
]
