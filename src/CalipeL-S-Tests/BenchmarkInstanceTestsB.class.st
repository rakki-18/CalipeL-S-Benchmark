Class {
	#name : #BenchmarkInstanceTestsB,
	#superclass : #BenchmarkInstanceTestsA,
	#instVars : [
		'param3',
		'param4',
		'param5'
	],
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkInstanceTestsB class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarks }
BenchmarkInstanceTestsB >> fake09a [
	<benchmark>
	<setup: #(#fakeSetUp1 #fakeSetUp9)>          
	log add:#fake09a

	"Created: / 30-09-2015 / 08:03:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsB >> fakeSetUp9 [
	log add:#fakeSetUp9

	"Created: / 30-09-2015 / 08:03:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param1:anInteger [
	<parameter: #param1 type: #Integer default: 5678>

	param1 := anInteger.

	"Created: / 09-03-2014 / 22:46:51 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param3 [
	^ param3
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param3:aBoolean [
	<parameter: #param3 type: #Boolean default: false>
	param3 := aBoolean.

	"Modified: / 30-07-2013 / 23:09:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param4 [
	^ param4
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param4:anObject [
	<parameter: #param4 type: #Float>
	param4 := anObject.

	"Modified: / 30-07-2013 / 23:41:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param5 [
	^ param5
]

{ #category : #parameters }
BenchmarkInstanceTestsB >> param5:something [
	<parameter: #param5 type: #Symbol default: #uniform values: #(#sequential #uniform #normal)>
	param5 := something.

	"Modified: / 01-08-2013 / 23:40:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_03a [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
		at: #'param4' put: '0.0';
		yourself).

	"parem1 is overridden here..."
	self assert: param1 == 5678

	"Created: / 09-03-2014 / 22:46:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_05a [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param4' put: '0.0';
						at: #'param1' put: '9876';
						at: #'BenchmarkInstanceTestsB#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 30-07-2013 / 23:14:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:55 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_05b [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param4' put: '0.0';
						at: #'param1' put: '9876';
						at: #'BenchmarkInstanceTestsA#param1' put: '1234'; yourself).

	self assert: param1 == 9876

	"Created: / 30-07-2013 / 23:14:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_05c [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param4' put: '0.0';
						at: #'param1' put: '9876';
						at: #'BenchmarkInstanceTestsA#param1' put: '1234';
						at: #'BenchmarkInstanceTestsB#param1' put: '5555';
						yourself).

	self assert: param1 == 5555

	"Created: / 30-07-2013 / 23:15:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:01 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_06 [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	"param4 value's missing..."
	self should:[
		r := b run: BenchmarkResultC new with: (Dictionary new
							yourself).
	] raise: BenchmarkParameterError.

	"Created: / 30-07-2013 / 23:42:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_07 [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b
			run: BenchmarkResultC new
			with: (Dictionary new
					at: 'param4' put:'1.0';
					at: 'param5' put:'sequential,uniform';
					yourself).

	self assert: r outcomes size == 2.

	"Created: / 01-08-2013 / 23:41:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsB >> test_09a [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake09a'.
	r := b run: BenchmarkResultC new with: (Dictionary new
					at: 'param4' put:'1.0';
					yourself).

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fakeSetUp9 #fake09a #fakeSetUp #fakeSetUp1 #fakeSetUp9 #fake09a).

	"Created: / 30-09-2015 / 08:06:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
