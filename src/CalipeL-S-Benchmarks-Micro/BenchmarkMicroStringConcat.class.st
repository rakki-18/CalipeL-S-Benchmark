Class {
	#name : #BenchmarkMicroStringConcat,
	#superclass : #Object,
	#instVars : [
		'iterations',
		'strsize',
		'str'
	],
	#category : #'CalipeL-S-Benchmarks-Micro'
}

{ #category : #running }
BenchmarkMicroStringConcat class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicroStringConcat class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicroStringConcat >> iterations [
	^ iterations
]

{ #category : #accessing }
BenchmarkMicroStringConcat >> iterations:anInteger [
	<parameter: #iterations type: #Integer default: 300>
	iterations := anInteger.

	"Modified: / 20-07-2013 / 00:35:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicroStringConcat >> setUpString [
	<setup>

	str := String new: strsize.
	1 to: strsize do:[:i | str at: i put: (Character codePoint: (i \\ (127-32)) + 32) ]

	"Created: / 27-11-2014 / 21:14:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat2a [
	<benchmark: 'Stream Concatenation - 2 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat2b [
	<benchmark: 'Stream Concatenation - 2 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 3*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:21:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat2c [
	<benchmark: 'Stream Concatenation - 2 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 2*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:23:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat3a [
	<benchmark: 'Stream Concatenation - 3 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat3b [
	<benchmark: 'Stream Concatenation - 3 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 4*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:21:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat3c [
	<benchmark: 'Stream Concatenation - 3 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 3*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:23:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat4a [
	<benchmark: 'Stream Concatenation - 4 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat4b [
	<benchmark: 'Stream Concatenation - 4 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 5*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:22:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat4c [
	<benchmark: 'Stream Concatenation - 4 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 4*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:23:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat5a [
	<benchmark: 'Stream Concatenation - 5 strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		String new writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:20:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat5b [
	<benchmark: 'Stream Concatenation - 5 strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 6*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:22:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> streamconcat5c [
	<benchmark: 'Stream Concatenation - 5 strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		(String new: 5*strsize) writeStream
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			nextPutAll: str;
			contents
	].

	"Created: / 27-11-2014 / 21:24:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> stringconcat2 [
	<benchmark: 'String Concatenation - 2 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str
	].

	"Created: / 27-11-2014 / 21:15:00 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> stringconcat3 [
	<benchmark: 'String Concatenation - 3 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str
	].

	"Created: / 27-11-2014 / 21:16:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> stringconcat4 [
	<benchmark: 'String Concatenation - 4 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str , str
	].

	"Created: / 27-11-2014 / 21:16:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcat >> stringconcat5 [
	<benchmark: 'String Concatenation - 5 strings'>

	1 to: (iterations * 5000) do: [:idx|
		str , str , str , str , str
	].

	"Created: / 27-11-2014 / 21:16:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicroStringConcat >> strsize [
	^ strsize
]

{ #category : #accessing }
BenchmarkMicroStringConcat >> strsize:anInteger [
	<parameter: #strsize type: #Integer values: #(5 10 15 20 50 100 200 500 1000)>
	strsize := anInteger.

	"Modified: / 27-11-2014 / 21:27:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
