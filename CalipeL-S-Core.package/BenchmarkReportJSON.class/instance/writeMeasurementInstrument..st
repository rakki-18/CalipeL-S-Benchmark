writing
writeMeasurementInstrument: instrument
	json writeDictionaryWith:[
		json writeKey: 'name' value: instrument measurementInstrumentName.
		json writeElementSeparator.
		json writeKey: 'class' value: instrument class name.
		json writeElementSeparator.
		json writeKey: 'unit' value: instrument measurementUnit.        
	].

	"Created: / 24-11-2014 / 23:46:39 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-10-2015 / 09:11:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"