accessing
times
	^ measurements collect:[ :run | 
		| timeMeasurement |

		timeMeasurement := run detect:[:each | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: each instrument ] ifNone:[ nil ].
		timeMeasurement value.
	]

	"Modified: / 02-12-2014 / 23:27:48 / Jan Vrany <jan.vrany@fit.cvut.cz>"