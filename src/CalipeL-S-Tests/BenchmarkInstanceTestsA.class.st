Class {
	#name : #BenchmarkInstanceTestsA,
	#superclass : #TestCase,
	#instVars : [
		'log',
		'param1',
		'param2',
		'measurementValue'
	],
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkInstanceTestsA class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake01 [
	<benchmark>
	log add:#'fake01'

	"Created: / 27-05-2013 / 22:08:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 22:55:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake02 [
	<benchmark>
	log add:#'fake02' add:param1

	"Created: / 27-05-2013 / 23:28:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 22:55:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake03a [
	<benchmark>
	<setup: #fakeSetUp1>
	log add:#'fake03'

	"Created: / 09-03-2014 / 23:35:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake03b [
	<benchmark>
	<setup: #(#fakeSetUp1 #fakeSetUp2)>
	log add:#'fake03'

	"Created: / 09-03-2014 / 23:35:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake04a [
	<benchmark>
	<teardown: #fakeTearDown1>
	log add:#'fake03'

	"Created: / 09-03-2014 / 23:36:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fake04b [
	<benchmark>
	<teardown: #(#fakeTearDown1 #fakeTearDown2)>
	log add:#'fake03'

	"Created: / 09-03-2014 / 23:35:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fakeSetUp [
	<setup>
	log add:#'fakeSetUp'

	"Created: / 28-05-2013 / 08:34:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 22:56:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fakeSetUp1 [
	log add:#'fakeSetUp1'

	"Created: / 09-03-2014 / 22:52:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fakeSetUp2 [
	log add:#'fakeSetUp2'

	"Created: / 09-03-2014 / 22:52:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fakeTearDown1 [
	log add:#'fakeTearDown1'

	"Created: / 09-03-2014 / 22:52:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> fakeTearDown2 [
	log add:#'fakeTearDown2'

	"Created: / 09-03-2014 / 22:52:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instrument mimicry' }
BenchmarkInstanceTestsA >> measurementInstrumentName [
	^ self name

	"Created: / 01-12-2014 / 02:38:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instrument mimicry' }
BenchmarkInstanceTestsA >> measurementStart:anObject [ 
	"void"
	"Created: / 28-11-2014 / 00:00:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instrument mimicry' }
BenchmarkInstanceTestsA >> measurementStop:anObject [ 
	"void"
	"Created: / 28-11-2014 / 00:00:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instrument mimicry' }
BenchmarkInstanceTestsA >> measurementUnit [
	^ '1'

	"Created: / 28-11-2014 / 00:26:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'instrument mimicry' }
BenchmarkInstanceTestsA >> measurementValue [
	^ measurementValue

	"Created: / 01-12-2014 / 02:47:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsA >> param1 [
	^ param1
]

{ #category : #parameters }
BenchmarkInstanceTestsA >> param1:anInteger [
	<parameter: #param1 type: #Integer default: 1234>

	param1 := anInteger.

	"Modified: / 27-07-2013 / 13:02:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parameters }
BenchmarkInstanceTestsA >> param2 [
	^ param2
]

{ #category : #parameters }
BenchmarkInstanceTestsA >> param2:anInteger [
	<parameter: #param2 type: #Integer default: 9876 values: #(1234 9876)>

	param2 := anInteger.

	"Modified: / 27-07-2013 / 13:08:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
BenchmarkInstanceTestsA >> setUp [
	log := OrderedCollection new.
	measurementValue := 9999

	"Created: / 27-05-2013 / 22:08:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-12-2014 / 02:55:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> skipped01 [
	<benchmark>

	BenchmarkSkipRequest signal.    
	log add:#'skipped01'

	"Created: / 20-04-2015 / 12:36:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> skipped02 [
	<setup: #skippedSetup02>
	<benchmark>


	log add:#'skipped01'

	"Created: / 20-04-2015 / 12:40:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #benchmarks }
BenchmarkInstanceTestsA >> skippedSetup02 [
	BenchmarkSkipRequest signal.    
	log add:#'skippedSetup02'

	"Created: / 20-04-2015 / 12:40:54 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_01 [

	| b r |

	b := BenchmarkInstance new instance:self selector:#fake01.
	r := b run.

	self assert: r outcomes size == 1.
	self assert: r outcomes anyOne benchmark == b.
	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == BenchmarkPlatform current instruments size.
	self assert: (r outcomes anyOne measurements anyOne allSatisfy:[:each | BenchmarkPlatform current instruments includes: each instrument ]).

	self assert: log asArray = #(#fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01 ).

	"Created: / 27-05-2013 / 22:08:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 23:58:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_02 [

	self 
		should: [BenchmarkInstance class:self class selector:#'non_existent_benchmark']
		raise: Error

	"Created: / 27-05-2013 / 22:13:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03a [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: Dictionary new.

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:04:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03b [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new at: #param1 put: '4321'; yourself).

	self assert: param1 == 4321

	"Created: / 28-05-2013 / 00:05:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03c [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
		r := b run: BenchmarkResultC new with: (Dictionary new at: #'BenchmarkInstanceTests#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:05:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03d [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b run: BenchmarkResultC new with: (Dictionary new
						at: #'param1' put: '9876'; 
						at: #'BenchmarkInstanceTestsA#param1' put: '1234'; yourself).

	self assert: param1 == 1234

	"Created: / 28-05-2013 / 00:06:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:17:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03e [

	| b |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	self should: [
		b runWith: (Dictionary new 
						at: #'param2' put: '5555'; yourself).
	] raise: BenchmarkParameterError.

	"Created: / 28-05-2013 / 00:11:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:34 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_03f [

	| b |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	self should: [
		b runWith: (Dictionary new 
						at: #'param1' put: 'asdf'; yourself).
	] raise: BenchmarkParameterError.

	"Created: / 28-05-2013 / 00:12:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_04a [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b runWith:(Dictionary new at: 'param1' put:'10,20'; yourself).

	self assert: r outcomes size == 2.
	self assert: r outcomes first benchmark == b.
	self assert: r outcomes second benchmark == b.
	self assert: log asArray = #(#fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01 #fakeSetUp #fake01 "<--warmup" #fakeSetUp #fake01).

	"Created: / 27-07-2013 / 13:19:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:13:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_04b [

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake01'.
	r := b runWith:(Dictionary new at: 'param1' put:'10,20'; at: 'param2' put:'1234,9876'; yourself).

	self assert: r outcomes size == 4.
	self assert: r outcomes first benchmark == b.
	self assert: r outcomes second benchmark == b.

	"Created: / 27-07-2013 / 13:20:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:10:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_05a [
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake03a'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fake03"<--warmaup" #fakeSetUp #fakeSetUp1 #fake03)

	"Created: / 09-03-2014 / 22:53:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_05b [
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake03b'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fakeSetUp1 #fakeSetUp2 #fake03"<--warmaup" #fakeSetUp #fakeSetUp1 #fakeSetUp2 #fake03)

	"Created: / 09-03-2014 / 22:58:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_06a [
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04a'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1)

	"Created: / 09-03-2014 / 23:36:59 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_06b [
	"Tests per-benchmark setup/teardown"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run.

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2)

	"Created: / 09-03-2014 / 23:36:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-03-2014 / 10:14:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_07a [
	"Tests custom instrument"

	| b r |

	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run: BenchmarkResultC new with: Dictionary new executor: (BenchmarkExecutor new instruments: (Array with: self)).

	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (r outcomes anyOne measurements anyOne contains:[:e | e instrument == self]).

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2)

	"Created: / 27-11-2014 / 23:58:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_07b [
	"Tests custom instrument"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'fake04b'.
	r := b run: BenchmarkResultC new with: Dictionary new executor: (BenchmarkExecutor new instruments: (Array with: self)).

	self assert: r outcomes anyOne measurements size == 1.
	self assert: r outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (r outcomes anyOne measurements anyOne contains:[:e | e instrument == self]).

	self assert: log asArray = #(#fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2"<--warmaup" #fakeSetUp #fake03 #fakeTearDown1 #fakeTearDown2).

	String streamContents: [:s | BenchmarkReport text write: r on: s ]

	"Created: / 01-12-2014 / 02:57:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:18:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_08a [
	"Tests benchmark skip"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'skipped01'.
	r := b run.

	self assert: r outcomes isEmpty.

	"Created: / 20-04-2015 / 12:38:01 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkInstanceTestsA >> test_08b [
	"Tests benchmark skip"

	| b r |

	measurementValue := BenchmarkMeasurementValueNotAvailable instance.
	b := BenchmarkInstance new instance:self selector:#'skipped02'.
	r := b run.

	self assert: r outcomes isEmpty.

	"Created: / 20-04-2015 / 12:41:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
