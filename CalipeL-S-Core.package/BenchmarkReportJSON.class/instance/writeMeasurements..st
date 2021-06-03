writing
writeMeasurements: measurements
	json writeArrayWith:[
		measurements do:[:run | 
			json writeArrayWith:[
				run do:[:measurement |  
					self writeMeasurement: measurement
				] separatedBy:[  
					json writeElementSeparator
				].
			].
		] separatedBy:[ 
			json writeElementSeparator
		].
	].

	"Created: / 24-11-2014 / 23:37:03 / Jan Vrany <jan.vrany@fit.cvut.cz>"