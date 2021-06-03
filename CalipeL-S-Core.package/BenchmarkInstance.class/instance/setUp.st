running-private
setUp
	setUpSelector1 notNil ifTrue:[
		instance perform: setUpSelector1 
	].
	setUpSelectors2 notNil ifTrue:[
		setUpSelectors2 do:[:each |  
			instance perform: each 
		].
	].

	"Created: / 27-05-2013 / 19:02:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 23:18:02 / Jan Vrany <jan.vrany@fit.cvut.cz>"