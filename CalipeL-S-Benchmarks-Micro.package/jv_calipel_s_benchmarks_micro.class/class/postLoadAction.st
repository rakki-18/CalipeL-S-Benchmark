description - actions
postLoadAction
	"invoked after loading a project"

	Smalltalk silentlyLoadingDo: [ 
		self classes do:[:cls | cls autoload ].
	].

	"Created: / 14-07-2013 / 16:50:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"