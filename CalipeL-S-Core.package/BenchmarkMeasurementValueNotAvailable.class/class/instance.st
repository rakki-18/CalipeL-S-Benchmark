instance creation
instance
	"returns a singleton"

	Instance isNil ifTrue:[
		Instance := self basicNew initialize.
	].
	^ Instance.

	"Created: / 01-12-2014 / 02:53:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"