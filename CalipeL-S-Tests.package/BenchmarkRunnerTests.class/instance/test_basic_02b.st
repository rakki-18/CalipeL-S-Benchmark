tests
test_basic_02b
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