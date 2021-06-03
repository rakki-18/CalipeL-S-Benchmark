Class {
	#name : #BenchmarkGameBody,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z',
		'vx',
		'vy',
		'vz',
		'mass'
	],
	#category : #'CalipeL-S-Benchmarks-Game-NBody'
}

{ #category : #documentation }
BenchmarkGameBody class >> copyright [
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

{ #category : #constants }
BenchmarkGameBody class >> daysPerYear [
   ^365.24d0
]

{ #category : #constants }
BenchmarkGameBody class >> jupiter [
   ^self new
	  x: 4.84143144246472090d0
	  y: -1.16032004402742839d0
	  z: -1.03622044471123109d-1
	  vx: 1.66007664274403694d-3 * self daysPerYear
	  vy: 7.69901118419740425d-3 * self daysPerYear
	  vz: -6.90460016972063023d-5 * self daysPerYear
	  mass: 9.54791938424326609d-4 * self solarMass
]

{ #category : #constants }
BenchmarkGameBody class >> neptune [
   ^self new
	  x: 1.53796971148509165d1
	  y: -2.59193146099879641d1
	  z: 1.79258772950371181d-1
	  vx: 2.68067772490389322d-3 * self daysPerYear
	  vy: 1.62824170038242295d-3 * self daysPerYear
	  vz: -9.51592254519715870d-5 * self daysPerYear
	  mass: 5.15138902046611451d-5 * self solarMass
]

{ #category : #constants }
BenchmarkGameBody class >> pi [
   ^3.141592653589793d0
]

{ #category : #constants }
BenchmarkGameBody class >> saturn [
   ^self new
	  x: 8.34336671824457987d0
	  y: 4.12479856412430479d0
	  z: -4.03523417114321381d-1
	  vx: -2.76742510726862411d-3 * self daysPerYear
	  vy: 4.99852801234917238d-3 * self daysPerYear
	  vz: 2.30417297573763929d-5 * self daysPerYear
	  mass: 2.85885980666130812d-4 * self solarMass
]

{ #category : #constants }
BenchmarkGameBody class >> solarMass [
   ^4.0d0 * self pi * self pi
]

{ #category : #constants }
BenchmarkGameBody class >> sun [
   ^self new
	  x: 0.0d0
	  y: 0.0d0
	  z: 0.0d0
	  vx: 0.0d0
	  vy: 0.0d0
	  vz: 0.0d0
	  mass: self solarMass
]

{ #category : #constants }
BenchmarkGameBody class >> uranus [
   ^self new
	  x: 1.28943695621391310d1
	  y: -1.51111514016986312d1
	  z: -2.23307578892655734d-1
	  vx: 2.96460137564761618d-3 * self daysPerYear
	  vy: 2.37847173959480950d-3 * self daysPerYear
	  vz: -2.96589568540237556d-5 * self daysPerYear
	  mass: 4.36624404335156298d-5 * self solarMass
]

{ #category : #documentation }
BenchmarkGameBody class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #nbody }
BenchmarkGameBody >> addMomentumTo: anArray [
   anArray at: 1 put: (anArray at: 1) + (vx * mass).
   anArray at: 2 put: (anArray at: 2) + (vy * mass).
   anArray at: 3 put: (anArray at: 3) + (vz * mass).
   ^anArray
]

{ #category : #nbody }
BenchmarkGameBody >> and: aBody velocityAfter: dt [        
   | dx dy dz distance mag |
   dx := x - aBody x.
   dy := y - aBody y.
   dz := z - aBody z.
   
   distance := ((dx*dx) + (dy*dy) + (dz*dz)) sqrt.
   mag := dt / (distance * distance * distance).

   self decreaseVelocity: dx y: dy z: dz m: aBody mass * mag.   
   aBody increaseVelocity: dx y: dy z: dz m: mass * mag
]

{ #category : #nbody }
BenchmarkGameBody >> decreaseVelocity: dx y: dy z: dz m: m [
   vx := vx - (dx * m).
   vy := vy - (dy * m).
   vz := vz - (dz * m)
]

{ #category : #nbody }
BenchmarkGameBody >> increaseVelocity: dx y: dy z: dz m: m [
   vx := vx + (dx * m).
   vy := vy + (dy * m).
   vz := vz + (dz * m)
]

{ #category : #nbody }
BenchmarkGameBody >> kineticEnergy [
   ^0.5d0 * mass * ((vx * vx) + (vy * vy) + (vz * vz))
]

{ #category : #accessing }
BenchmarkGameBody >> mass [
   ^mass
]

{ #category : #nbody }
BenchmarkGameBody >> offsetMomentum: anArray [ 
   | m |
   m := self class solarMass.
   vx := (anArray at: 1) negated / m.
   vy := (anArray at: 2) negated / m.
   vz := (anArray at: 3) negated / m
]

{ #category : #nbody }
BenchmarkGameBody >> positionAfter: dt [
   x := x + (dt * vx).
   y := y + (dt * vy).
   z := z + (dt * vz)
]

{ #category : #nbody }
BenchmarkGameBody >> potentialEnergy: aBody [
   | dx dy dz distance |
   dx := x - aBody x.
   dy := y - aBody y.
   dz := z - aBody z.

   distance := ((dx*dx) + (dy*dy) + (dz*dz)) sqrt.
   ^mass * aBody mass / distance
]

{ #category : #accessing }
BenchmarkGameBody >> x [
   ^x
]

{ #category : #accessing }
BenchmarkGameBody >> x: d1 y: d2 z: d3 vx: d4 vy: d5 vz: d6 mass: d7 [
   x := d1.
   y := d2. 
   z := d3. 
   vx := d4.
   vy := d5.
   vz := d6.
   mass := d7
]

{ #category : #accessing }
BenchmarkGameBody >> y [
   ^y
]

{ #category : #accessing }
BenchmarkGameBody >> z [
   ^z
]
