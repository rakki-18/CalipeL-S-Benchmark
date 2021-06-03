"
A BGPiDigitSpigot is xxxxxxxxx.

* The Computer Language Benchmarks Game
    http://benchmarksgame.alioth.debian.org/
    contributed by Paolo Bonzini 
    modified by Andres Valloud *

Instance Variables
	accum:		<Object>
	denom:		<Object>
	k:		<Object>
	numer:		<Object>

accum
	- xxxxx

denom
	- xxxxx

k
	- xxxxx

numer
	- xxxxx

"
Class {
	#name : #BenchmarkGamePiDigitSpigot,
	#superclass : #Object,
	#instVars : [
		'numer',
		'accum',
		'denom',
		'k'
	],
	#category : #'CalipeL-S-Benchmarks-Game-PiDigits'
}

{ #category : #documentation }
BenchmarkGamePiDigitSpigot class >> copyright [
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
BenchmarkGamePiDigitSpigot class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #documentation }
BenchmarkGamePiDigitSpigot class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #testing }
BenchmarkGamePiDigitSpigot >> atEnd [
	^false
]

{ #category : #'pi digit generation' }
BenchmarkGamePiDigitSpigot >> eliminate: digit [
	accum := accum - (denom * digit).
	accum := accum * 10.
	numer := numer * 10
]

{ #category : #'pi digit generation' }
BenchmarkGamePiDigitSpigot >> extract [
	| tmp |
	numer > accum ifTrue: [^nil].
	tmp := numer + numer + numer + accum.
	tmp \\ denom >= (denom - numer) ifTrue: [^nil].
	^tmp // denom
]

{ #category : #'initialize-release' }
BenchmarkGamePiDigitSpigot >> initialize [
	numer := denom := 1.
	k := accum := 0.
]

{ #category : #accessing }
BenchmarkGamePiDigitSpigot >> next [
	| digit |
	[ self step. (digit := self extract) isNil ] whileTrue.
	self eliminate: digit.
	^digit
]

{ #category : #'stepping and presenter' }
BenchmarkGamePiDigitSpigot >> step [
	| y2 |
	k := k + 1.
	y2 := k * 2 + 1.
	accum := (numer + numer + accum) * y2.
	numer := numer * k.
	denom := denom * y2.
]
