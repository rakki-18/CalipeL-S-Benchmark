get / set
set: value in: instance
	| setter |

	values notNil ifTrue:[
		(values includes: value) ifFalse:[
			"JV: Note for Smalltalk/X: #signal: is actually an ANSI 1.9 protocol!"
			BenchmarkParameterError new signal:'Invalid parameter value for ', name , ' (' , value storeString ,')'.
		].
	].
	setter := self setter.
	(instance respondsTo: setter) ifFalse:[
		BenchmarkParameterError new signal:'Cannot set parameter ', name , ' (' ,instance class name , ' does not respond to ', setter storeString , ')'.
	].
	[
		instance perform: setter with: value
	] on: Error do:[:ex|
		BenchmarkParameterError new signal:'Cannot set parameter ', name , ' (', ex description , ')'
	]

	"Created: / 27-07-2013 / 11:43:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"