running-private
tearDown
	tearDownSelector1 notNil ifTrue:[
		instance perform: tearDownSelector1 
	].
	tearDownSelectors2 notNil ifTrue:[
		tearDownSelectors2 do:[:each |  
			instance perform: each 
		].
	].

	"Created: / 27-05-2013 / 19:02:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 09-03-2014 / 23:18:17 / Jan Vrany <jan.vrany@fit.cvut.cz>"