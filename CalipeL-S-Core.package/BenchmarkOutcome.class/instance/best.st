accessing
best
	"Return the best run, i.e., run with minimal time"

	^ measurements inject: measurements anyOne into:[ :best :each |
		| bestTime eachTime |

		bestTime := best detect:[:m | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: m instrument ] ifNone:[ nil ].
		eachTime := best detect:[:m | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: m instrument ] ifNone:[ nil ].

		bestTime notNil ifTrue:[ 
			eachTime notNil ifTrue:[ 
				eachTime value < bestTime value ifTrue:[ each ] ifFalse:[ best ]
			] ifFalse:[
				best
			]
		] ifFalse:[ 
			eachTime notNil ifTrue:[ each ] ifFalse:[ best ]
		].
	].

	"Created: / 25-11-2014 / 01:18:25 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-12-2014 / 23:28:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"