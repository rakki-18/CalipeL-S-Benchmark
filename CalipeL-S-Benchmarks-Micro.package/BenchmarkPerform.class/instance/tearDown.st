running
tearDown
	<teardown>

	selectors do:[:bucket|
		bucket do:[:selector|
			Object removeSelector: selector
		]
	]

	"Created: / 20-07-2013 / 02:11:14 / Jan Vrany <jan.vrany@fit.cvut.cz>"