tests
test_basic_02a
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