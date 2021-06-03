accessing
time
	^ (self times select:[:t | t notNil]) min

	"Modified (format): / 25-11-2014 / 01:23:40 / Jan Vrany <jan.vrany@fit.cvut.cz>"