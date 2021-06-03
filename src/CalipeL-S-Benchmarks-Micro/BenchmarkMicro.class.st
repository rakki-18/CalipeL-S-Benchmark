Class {
	#name : #BenchmarkMicro,
	#superclass : #Object,
	#instVars : [
		'iterations',
		'stream',
		'hello',
		'table',
		'ary1',
		'ary2'
	],
	#category : #'CalipeL-S-Benchmarks-Micro'
}

{ #category : #running }
BenchmarkMicro class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicro class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkMicro class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkMicro class >> version_MC [
	^ 'CalipeL_S-Benchmarks-JanVrany.1 b5f61090-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:51:48 JanVrany'
]

{ #category : #benchmarks }
BenchmarkMicro >> ackermann [
	"<benchmark: 'Ackermann'>"

	self ackermann: 3 with: 8.
	self ackermann: 3 with: 8.
	self ackermann: 3 with: 8.
	self ackermann: 3 with: 8.

	"Created: / 11-06-2013 / 01:29:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 23-06-2013 / 02:30:01 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkMicro >> ackermann: x with: y [
   ^x = 0
	  ifTrue: [y + 1]
	  ifFalse: [
		 y = 0
			ifTrue: [self ackermann: x - 1 with: 1]
			ifFalse: [self ackermann: x - 1 with: (self ackermann: x with: y - 1)] ]

	"Created: / 11-06-2013 / 01:29:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkMicro >> ary [
	<benchmark: 'Ary'>

	| n |

	n := ary1 size.
	1 to: 1000 do: [:ignored|
					n to: 1 by: -1 do: [:i| ary2 at: i put: (ary2 at: i) + (ary1 at: i)] ].

	"Created: / 11-06-2013 / 01:25:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkMicro >> hsh [
	<benchmark: 'Hash 1'>

	| n count |

	n := iterations * 1000.
	count := 0.

	1 to:n do:[:each | 
		table at:(each printStringRadix:16) put:each
	].

	1 to:n do:[:each | 
		(table includesKey:(each printStringRadix:10)) ifTrue:[
			count := count + 1
		]
	].

	"Created: / 11-06-2013 / 01:21:28 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicro >> iterations [
	^ iterations
]

{ #category : #accessing }
BenchmarkMicro >> iterations:anInteger [
	<parameter: #iterations type: #Integer default: 1000>
	iterations := anInteger.

	"Modified: / 20-07-2013 / 00:35:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicro >> setUp [
	<setup>

	stream := WriteStream on:String new.
	hello := 'hello' , Character cr asString.
	iterations := iterations isNil ifTrue:[ 1000 ] ifFalse:[ iterations ].
	table := Dictionary new: (iterations * 1000) + ((iterations * 1000) // 5).
	ary1 := (1 to:iterations * 100) asArray.
	ary2 := Array new:iterations * 100 withAll: 0.

	"Created: / 28-05-2013 / 00:50:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 11-06-2013 / 01:25:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkMicro >> strcat [
	<benchmark: 'String Concatenation'>

	1 to: (iterations * 5000) do: [:idx|
		stream nextPutAll:hello
	].

	"Created: / 28-05-2013 / 00:49:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:30:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
