Class {
	#name : #BenchmarkReportJSON,
	#superclass : #BenchmarkReport,
	#instVars : [
		'json'
	],
	#category : #'CalipeL-S-Core-Reports'
}

{ #category : #documentation }
BenchmarkReportJSON class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #accessing }
BenchmarkReportJSON >> stream:something [
	stream := something.
	json := BenchmarkReportJSONWriter on: stream.

	"Created: / 12-06-2013 / 14:22:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> write [
	json writeDictionaryWith:[ 
		json writeKey: 'tags' value: self name.
		json writeElementSeparator.
		json writeKey: 'timestamp' value: result timestamp printISO8601.
		json writeElementSeparator.
		json writeKey: 'configuration' valueWith: [ self writeConfiguration ].
		json writeElementSeparator.
		json writeKey: 'outcomes' valueWith: [ self writeOutcomes ]
	].

	"Created: / 12-06-2013 / 14:03:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 19-09-2013 / 23:27:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeBenchmark: benchmark [
	json writeDictionaryWith:[
		json writeKey: 'name' value: benchmark name.
		json writeElementSeparator.
		json writeKey: 'description' value: benchmark description.
		json writeElementSeparator.
		json writeKey: 'class' value: benchmark instance class name.
		json writeElementSeparator.
		json writeKey: 'selector' value: benchmark selector.
	]

	"Created: / 12-06-2013 / 14:10:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 23-06-2013 / 02:27:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeConfiguration [
	json writeDictionaryWith: [
		description notNil ifTrue:[
			json writeKey: 'description' value: self description.
			json writeElementSeparator.
		].
		json writeKey: 'language'   value: 'Smalltalk'.
		json writeElementSeparator.
		json writeKey: 'runtime'    value: BenchmarkPlatform current configurationStringRuntime.
		json writeElementSeparator.
		json writeKey: 'os'         value: BenchmarkPlatform current configurationStringOS.
		json writeElementSeparator.
		json writeKey: 'machineid'   value: (BenchmarkPlatform current configurationStringMachineId)
	].

	"Created: / 22-06-2013 / 22:43:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 08-11-2013 / 21:45:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeFooter [
	"superclass BenchmarkReport says that I am responsible to implement this method"

	"Modified: / 12-06-2013 / 14:14:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeHeader [
	"superclass BenchmarkReport says that I am responsible to implement this method"

	"Modified: / 12-06-2013 / 14:14:27 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeMeasurement: measurement [
	measurement value ~~ BenchmarkMeasurementValueNotAvailable instance ifTrue:[  
		json writeDictionaryWith:[
			json writeKey: 'instrument' valueWith: [ self writeMeasurementInstrument: measurement instrument ].
			json writeElementSeparator.
			json writeKey: 'value' value: measurement value
		].
	].

	"Created: / 24-11-2014 / 23:41:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 01-12-2014 / 03:04:22 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeMeasurementInstrument: instrument [
	json writeDictionaryWith:[
		json writeKey: 'name' value: instrument measurementInstrumentName.
		json writeElementSeparator.
		json writeKey: 'class' value: instrument class name.
		json writeElementSeparator.
		json writeKey: 'unit' value: instrument measurementUnit.        
	].

	"Created: / 24-11-2014 / 23:46:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 09:11:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeMeasurements: measurements [
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
]

{ #category : #writing }
BenchmarkReportJSON >> writeOutcome:outcome [
	json writeDictionaryWith:[
		json writeKey: 'benchmark' valueWith: [ self writeBenchmark: outcome benchmark ].
		json writeElementSeparator.
		json writeKey: 'measurements' valueWith: [ self writeMeasurements: outcome measurements ].
		json writeElementSeparator.        
		json writeKey: 'parameters' valueWith: [ self writeParameters: outcome ].
		json writeElementSeparator.        
		"For backward compatibility, will wanish"
		json writeKey: 'times' value: outcome times.
	]

	"Modified: / 24-11-2014 / 23:36:46 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeOutcomes [
	"raise an error: must be redefined in concrete subclass(es)"
	json writeArrayWith:[
		result 
		   outcomesDo: [:outcome| self writeOutcome: outcome] 
		   separatedBy:[json writeElementSeparator]
	]

	"Created: / 11-06-2013 / 23:39:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (format): / 12-06-2013 / 14:06:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #writing }
BenchmarkReportJSON >> writeParameters: outcome [
	json writeDictionaryWith: [
		outcome parameters do:[:paramAndValue |
			json writeKey: paramAndValue key name value: paramAndValue value 
		] separatedBy:[
			json writeElementSeparator
		]
	]

	"Created: / 12-06-2013 / 14:10:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 30-07-2013 / 23:58:43 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
