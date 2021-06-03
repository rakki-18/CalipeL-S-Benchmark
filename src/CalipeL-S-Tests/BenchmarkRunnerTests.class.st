Class {
	#name : #BenchmarkRunnerTests,
	#superclass : #TestCase,
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkRunnerTests class >> documentation [
"
 Replace 'Object', 'NewClass1' and
 the empty string arguments by true values.

 Install (or change) the class by 'accepting',
 either via the menu or the keyboard (usually CMD-A).

 You can also change the category simply by editing
 the categoryString and accepting.

 To be nice to others (and yourself later), do not forget to
 add some documentation; preferably under the classes documentation
 protocol.
 (see the `create documentation stubs' item in the methodList menu;
  switch from instance to class to find this menu item.)

 Notice, that ST/X uses the convention to document the class using
 comment-only class methods (however, ST80 comments are supported and
 can be changed via the class-documentation menu).

"
]

{ #category : #accessing }
BenchmarkRunnerTests class >> resources [
	^Array with: BenchmarkTestsLog

	"Created: / 18-07-2013 / 02:42:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #documentation }
BenchmarkRunnerTests class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #running }
BenchmarkRunnerTests >> setUp [
	BenchmarkTestsLog current setUp

	"Created: / 18-07-2013 / 02:43:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01a [

	| runner status |

	runner := BenchmarkRunner new.
	status := runner main: #('BenchmarkTestsSuiteA').

	self assert: status == BenchmarkRunner statusSuccess.
	self assert: runner result outcomes size = 2.

	"Created: / 19-07-2013 / 21:48:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 15:06:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01b [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first >= 200.

	"Created: / 19-07-2013 / 21:49:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:29:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01c [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-Dmsecs=10' 'BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first < 200.

	"Created: / 19-07-2013 / 21:49:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:30:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01d [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-n' '1' '-Dmsecs=10' 'BenchmarkTestsSuiteA#benchmark2').

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 1.
	self assert: runner result outcomes anyOne times first < 200.

	"Created: / 19-07-2013 / 21:49:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 12-08-2013 / 00:30:05 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01e [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-n' '1' '-Dmsecs=10,250' 'BenchmarkTestsSuiteA#benchmark2').



	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes first times size = 1.
	self assert: runner result outcomes first times first >= runner result outcomes first parameters first value.

	self assert: runner result outcomes second times size = 1.
	self assert: runner result outcomes second times first >= runner result outcomes second parameters first value.

	"Created: / 31-07-2013 / 00:06:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-08-2013 / 19:16:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01f [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--json' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.

	"Created: / 12-08-2013 / 18:23:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01g [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--setup' 'Smalltalk at: #''test_basic_01g'' put: 12345' 'BenchmarkTestsSuiteA').
	[
	self assert: (Smalltalk includesKey:#'test_basic_01g').
	self assert: (Smalltalk at:#'test_basic_01g') == 12345.
	] ensure:[ 
		(Smalltalk includesKey:#'test_basic_01g') ifTrue:[ 
			Smalltalk removeKey:#'test_basic_01g'
		].
	].

	"Created: / 19-09-2013 / 22:43:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-03-2014 / 16:27:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_01h [

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--teardown' 'Smalltalk at: #''test_basic_01g'' put: 12345' 'BenchmarkTestsSuiteA').
	[
	self assert: (Smalltalk includesKey:#'test_basic_01g').
	self assert: (Smalltalk at:#'test_basic_01g') == 12345.
	] ensure:[ 
		(Smalltalk includesKey:#'test_basic_01g') ifTrue:[ 
			Smalltalk removeKey:#'test_basic_01g'
		].
	].

	"Created: / 08-03-2014 / 16:27:47 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_02a [
	| runner file |

	file := Filename newTemporary.
	[
	file writingFileDo:[:s|
		s nextPutAll: '-Dmsecs=10'; cr.
		s nextPutAll: 'BenchmarkTestsSuiteA#benchmark2'; cr.
	].
	runner := BenchmarkRunner new.
	runner main: (Array with:'--arguments' with: file pathName).

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first < 200.

	] ensure:[
		file remove
	].

	"Created: / 31-07-2013 / 00:21:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 12:16:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_02b [
	| runner file |

	file := Filename newTemporary.
	[
	file writingFileDo:[:s|
		s nextPutAll: '-Dmsecs=10'; cr.
		s nextPutAll: 'BenchmarkTestsSuiteA#benchmark2'; cr.
	].
	runner := BenchmarkRunner new.
	runner main: (Array with:'--script' with: file pathName).

	self assert: runner result outcomes size = 1.
	self assert: runner result outcomes anyOne times size = 5.
	self assert: runner result outcomes anyOne times first < 200.

	] ensure:[
		file remove
	].

	"Created: / 08-03-2014 / 16:09:25 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 12:17:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05a [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '#!./benchmark-runner.sh --json
			Suite1#bench1'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('Suite1#bench1')

	"Created: / 08-03-2014 / 11:06:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05b [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description "Something with \"space\" in there"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Something with "space" in there').

	"Created: / 08-03-2014 / 11:08:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05c [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description ''Something with \"space\" in there'''.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Something with \"space\" in there').

	"Created: / 08-03-2014 / 11:09:38 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05d [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description "Something with newline
in there"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Something with newline
in there').

	"Created: / 08-03-2014 / 11:10:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05e [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description \
"Allow shell-like continuation"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Allow shell-like continuation').

	"Created: / 08-03-2014 / 11:11:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05f [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '--description
"Next line"'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('--description' 'Next line').

	"Created: / 08-03-2014 / 15:49:16 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_05g [

	| runner file argv |

	runner := BenchmarkRunner new.
	argv := OrderedCollection new.
	file := '#!./benchmark-runner.sh --json
			 # Simple script
			 # to test comments
			Suite1#bench1
			# Another commeht here...

			# And here...

			'.


	runner parseArguments: file readStream into: argv.
	self assert: argv asArray = #('Suite1#bench1')

	"Created: / 08-03-2014 / 15:57:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_07a [
	"Test custom instruments"

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('-i' 'BenchmarkInstanceTestsA' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes anyOne measurements size == 5.
	self assert: runner result outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (runner result outcomes anyOne measurements anyOne contains:[:e | e instrument class == BenchmarkInstanceTestsA ]).

	"Created: / 28-11-2014 / 00:05:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_07b [
	"Test custom instruments"

	| runner |

	runner := BenchmarkRunner new.
	runner main: #('--instrument' 'BenchmarkInstanceTestsA' 'BenchmarkTestsSuiteA').

	self assert: runner result outcomes size = 2.
	self assert: runner result outcomes anyOne measurements size == 5.
	self assert: runner result outcomes anyOne measurements anyOne size == (BenchmarkPlatform current instruments size + 1).
	self assert: (runner result outcomes anyOne measurements anyOne contains:[:e | e instrument class == BenchmarkInstanceTestsA ]).

	"Created: / 28-11-2014 / 00:17:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #tests }
BenchmarkRunnerTests >> test_basic_08a [

	| runner status |

	runner := BenchmarkRunner new.
	status := runner main: #('BenchmarkTestsSuiteA' 'BenchmarkTestsSuiteC').

	self assert: status == BenchmarkRunner statusFailure.
	self assert: runner result outcomes size = 2.

	"Created: / 22-10-2015 / 15:07:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
