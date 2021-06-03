running-private
benchmarkUsingInstruments:instruments 
	| profile  profiler  measurements  instrumentArray executuonTimeInstrument |

	instrumentArray := instruments asArray.
	executuonTimeInstrument := instrumentArray detect:[:each | BenchmarkMeasurementInstrument isExecuttionTimeInstrument: each ] ifNone:[ nil ].
	executuonTimeInstrument notNil ifTrue:[ 
		instrumentArray swap: (instrumentArray identityIndexOf: executuonTimeInstrument) with: instrumentArray size.  
	].
	 " Special - check if running under callgrind, if so,
	 request instrumentation - supported only on Smalltalk/X "
	profile := Smalltalk isSmalltalkX 
			and:[
				(Smalltalk at:#Profiler) notNil 
					and:[ (Smalltalk at:#Profiler) valgrind runningUnderValgrind ]
			].
	profile ifTrue:[
		profiler := (Smalltalk at:#Profiler) valgrind.
		profiler callgrindInstrumentationStart.
	].
	instrumentArray do:[:i | 
		i measurementStart:self
	].
	instance perform:benchmarkSelector.
	instrumentArray reverseDo:[:i | 
		i measurementStop:self
	].
	profile ifTrue:[
		profiler callgrindInstrumentationStop.
	].
	measurements := instrumentArray collect:[:i | BenchmarkMeasurement instrument:i value:i measurementValue ].
	^ measurements

	"Created: / 24-11-2014 / 00:17:37 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-12-2014 / 23:32:18 / Jan Vrany <jan.vrany@fit.cvut.cz>"