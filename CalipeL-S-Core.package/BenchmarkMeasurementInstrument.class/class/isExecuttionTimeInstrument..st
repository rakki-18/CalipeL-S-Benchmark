testing
isExecuttionTimeInstrument: instrument
	^ (instrument respondsTo:#isExecutionTimeInstrument) and:[instrument isExecutionTimeInstrument]

	"Created: / 02-12-2014 / 23:26:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"