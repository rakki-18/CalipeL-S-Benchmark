Class {
	#name : #BenchmarkReportText,
	#superclass : #BenchmarkReport,
	#instVars : [
		'colwidths',
		'colheaders',
		'colmap'
	],
	#category : #'CalipeL-S-Core-Reports'
}

{ #category : #documentation }
BenchmarkReportText class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #documentation }
BenchmarkReportText class >> version_MC [
	^ 'CalipeL_S-Core-JanVrany.7 5c300a20-c9d7-11e2-a959-606720e43e2c 2013-05-31T10:49:17 JanVrany'
]

{ #category : #formatting }
BenchmarkReportText >> format: anObject width: width align: align [
	| string |

	string := anObject isString ifTrue:[anObject] ifFalse:[anObject printString].
	align == #left ifTrue:[
		stream nextPutAll: string.
		stream next: ((width - string size) max: 0) put: Character space.
		^self.
	].
	align == #right ifTrue:[
		stream next: ((width - string size) max: 0) put: Character space.
		stream nextPutAll: string.
		^self.
	].
	align == #center ifTrue:[
		stream next: (((width - string size) max: 0) / 2 floor) put: Character space.
		stream nextPutAll: string.
		stream next: (((width - string size) max: 0) / 2 ceiling) put: Character space.
		^self.
	]

	"Created: / 31-05-2013 / 12:09:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #private }
BenchmarkReportText >> prepare [
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
]

{ #category : #writing }
BenchmarkReportText >> write [
	self prepare.
	super write.

	"Created: / 25-11-2014 / 01:13:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportText >> writeFooter [

	"Modified: / 11-06-2013 / 23:28:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportText >> writeHeader [
	stream
		nextPutAll: 'Generated at :';
		nextPutAll: Date today printString;
		nextPutAll: ' ';
		nextPutAll: Time now printString;
		cr;
		cr.
	1 to: colwidths size do:[:i |
		self format: (colheaders at:i) width: (colwidths at: i) align: #right.
		stream space; "nextPut: $|;"space; space.
	].
	stream nextPutAll: 'Parameters'

	"Modified: / 25-11-2014 / 01:50:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportText >> writeOutcome: outcome [
	1 to: colwidths size do:[:i |
		self format: ((colmap at:i) value: outcome value: i) width: (colwidths at: i) align: #right.
		stream space; "nextPut: $|;"space; space.
	].
	outcome parameters notEmpty ifTrue:[
			stream nextPutAll: '{'.
			(outcome parameters  asSortedCollection:[:a :b | a key name < b key name ]) do:[:paramAndValue|
				stream nextPutAll: paramAndValue key name.
				stream nextPutAll: '='.
				stream nextPutAll: paramAndValue value storeString.
			] separatedBy:[
				stream nextPutAll: ', '.
			].
			stream nextPutAll: '}'.
			].
	stream cr.

	"Created: / 11-06-2013 / 23:24:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 13:25:56 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportText >> writeOutcomes [
	| class |

	class := nil.
	result outcomesDo:[:outcome |
		outcome benchmark instance class == class ifFalse:[
			class := outcome benchmark instance class.
			stream cr; nextPutAll: class name; cr.
		].
		self writeOutcome: outcome
	].
	stream cr.

	"Created: / 11-06-2013 / 23:24:13 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 25-11-2014 / 01:45:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
