private
prepare
	| instruments timeInstrument ncols |

	instruments := Set new.
	result outcomes do:[:outcome |
		outcome best do:[:m | instruments add: m instrument ].
	].
	timeInstrument := instruments detect:[:instrument | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: instrument ] ifNone:[ nil ].
	instruments remove: timeInstrument ifAbsent:[nil].
	instruments := instruments asOrderedCollection sort:[:a :b | a measurementInstrumentName < b measurementInstrumentName ].
	timeInstrument notNil ifTrue:[ instruments addFirst: timeInstrument ].

	ncols := 1"benchmark name" + instruments size.
	colwidths := Array new: ncols.
	colheaders := Array new: ncols.
	colmap := Array new: ncols.

	colwidths at: 1 put: ((result outcomes inject: 0 into: [ :max :each | (max max: (each benchmark name size)) max: (each benchmark class name size) ]) max: 'Benchmark' size) + 3.
	colheaders at: 1 put: 'Benchmark'.
	colmap at: 1 put:[ :outcome :col | outcome benchmark name ].
	1 to: instruments size  do:[:i |
		| label |

		label := (instruments at:i) measurementInstrumentName , ' [' , (instruments at:i) measurementUnit, ']'.
		colwidths at: i + 1 put: label size + 3.
		colheaders at: i + 1 put: label.
		colmap at: i + 1 put: [ :outcome :col |
			| measurement value |

			measurement := outcome best detect:[:m | m instrument == (instruments at: col - 1) ] ifNone:[nil].
			value := measurement notNil ifTrue:[ measurement value ] ifFalse:[ BenchmarkMeasurementValueNotAvailable instance ].
			value ~~ BenchmarkMeasurementValueNotAvailable instance ifTrue:[ value ] ifFalse:[ 'N/A' ]
		].
	]

	"Created: / 25-11-2014 / 01:14:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-12-2014 / 23:26:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"