Extension { #name : #BenchmarkResultC }

{ #category : #'*NewTools-Inspector' }
BenchmarkResultC >> inspectionBenchmarkResult [

	<inspectorPresentationOrder: 0 title: 'Report'>

	

	^ (SpTablePresenter new)
	items: self outcomes;
	addColumn: (SpStringTableColumn  title: 'Implementation' evaluated: [:each | each benchmark name]);
	addColumn: (SpStringTableColumn title: 'Time(ms)' evaluated: [:each | ((each measurements at: 1) at: 3 ) value]);
	addColumn: (SpStringTableColumn title: 'Memory(Byte)' evaluated: [:each | each spaceMeasurements ]);
	addColumn: (SpStringTableColumn title: 'MatrixSize' evaluated: [:each | (each parameters at: 1) value]);
	
	yourself
]
