running
setUpString
	<setup>

	str := String new: strsize.
	1 to: strsize do:[:i | str at: i put: (Character codePoint: (i \\ (127-32)) + 32) ]

	"Created: / 27-11-2014 / 21:14:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"