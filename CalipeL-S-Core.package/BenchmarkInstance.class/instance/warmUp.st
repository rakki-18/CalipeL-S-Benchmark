running-private
warmUp
	| warmed |

	BenchmarkPlatform current warmUpPre.
	warmed := false.
	warmUpSelector1 notNil ifTrue:[
		instance perform: warmUpSelector1.
		warmed := true.
	].
	warmUpSelector2 notNil ifTrue:[
		instance perform: warmUpSelector2.
		warmed := true.
	].
	"Default warmup"
	warmed ifFalse:[
		instance perform: benchmarkSelector 
	].
	BenchmarkPlatform current warmUpPost.

	"Created: / 27-05-2013 / 19:02:36 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 07-06-2013 / 02:08:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"