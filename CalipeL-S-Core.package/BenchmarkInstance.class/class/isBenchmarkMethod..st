testing
isBenchmarkMethod:method
	self benchmarkAnnotationKeywords do:[:keyword|
		(method pragmaAt: keyword) notNil ifTrue:[
			^ true
		].
	].
	^false

	"Created: / 23-06-2013 / 01:51:30 / Jan Vrany <jan.vrany@fit.cvut.cz>"