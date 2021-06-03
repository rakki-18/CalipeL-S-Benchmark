Class {
	#name : #BenchmarkMicroStringConcatN,
	#superclass : #Object,
	#instVars : [
		'iterations',
		'strsize',
		'str',
		'nconcats'
	],
	#category : #'CalipeL-S-Benchmarks-Micro'
}

{ #category : #running }
BenchmarkMicroStringConcatN class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicroStringConcatN class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicroStringConcatN >> iterations [
	^ iterations
]

{ #category : #accessing }
BenchmarkMicroStringConcatN >> iterations:anInteger [
	<parameter: #iterations type: #Integer default: 300>
	iterations := anInteger.

	"Modified: / 20-07-2013 / 00:35:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicroStringConcatN >> nconcats:anInteger [
	<parameter: #strsize type: #Integer default: 10>
	nconcats := anInteger.

	"Created: / 27-11-2014 / 21:29:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkMicroStringConcatN >> setUpString [
	<setup>

	str := String new: strsize.
	1 to: strsize do:[:i | str at: i put: (Character codePoint: (i \\ (127-32)) + 32) ]

	"Created: / 27-11-2014 / 21:14:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcatN >> streamconcat_a [
	<benchmark: 'Stream Concatenation - N strings, default size'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := String new writeStream.
		1 to: nconcats do:[:i | s nextPutAll: str ].
		s := s contents.
	].

	"Created: / 27-11-2014 / 21:30:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcatN >> streamconcat_b [
	<benchmark: 'Stream Concatenation - N strings, preallocated bigger'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := (String new:(strsize * (nconcats + 1))) writeStream.
		1 to: nconcats do:[:i | s nextPutAll: str ].
		s := s contents.
	].

	"Created: / 27-11-2014 / 21:35:20 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcatN >> streamconcat_c [
	<benchmark: 'Stream Concatenation - N strings, preallocated exact'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := (String new:(strsize * (nconcats))) writeStream.
		1 to: nconcats do:[:i | s nextPutAll: str ].
		s := s contents.
	].

	"Created: / 27-11-2014 / 21:35:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmark }
BenchmarkMicroStringConcatN >> stringconcat [
	<benchmark: 'String Concatenation - 2 strings'>

	1 to: (iterations * 5000) do: [:idx|
		| s |

		s := str.
		1 to: nconcats - 1 do:[:i | s := s , str ]
	].

	"Created: / 27-11-2014 / 21:34:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
BenchmarkMicroStringConcatN >> strsize [
	^ strsize
]

{ #category : #accessing }
BenchmarkMicroStringConcatN >> strsize:anInteger [
	<parameter: #strsize type: #Integer values: #(5 10 15 20 50 100 200 500 1000)>
	strsize := anInteger.

	"Modified: / 27-11-2014 / 21:28:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
