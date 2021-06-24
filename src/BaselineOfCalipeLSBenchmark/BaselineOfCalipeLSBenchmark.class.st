Class {
	#name : #BaselineOfCalipeLSBenchmark,
	#superclass : #BaselineOf,
	#category : #BaselineOfCalipeLSBenchmark
}

{ #category : #baselines }
BaselineOfCalipeLSBenchmark >> baseline: spec [
	<baseline>
	spec
		for: #(common)
		do: [ 
			spec
				package: 'Compatibility-SmalltalkX';
				package: 'CalipeL-S-Core' 	with: [ spec requires: #('Compatibility-SmalltalkX') ];
				package: 'CalipeL-S-Pharo'	with: [ spec requires: #('Compatibility-SmalltalkX') ];
				package: 'CalipeL-S-Benchmarks-Micro'	with: [ spec requires: #('Compatibility-SmalltalkX') ];
				package: 'CalipeL-S-Benchmarks-Game'	with: [ spec requires: #('Compatibility-SmalltalkX') ];
				package: 'CalipeL-S-Tests'	with: [ spec requires: #('Compatibility-SmalltalkX') ];
				package: 'NewTools-Core';
				package: 'NewTools-Inspector' with: [ spec requires: #('CalipeL-S-Core' 'NewTools-Core') ].
			spec
				group: 'default'				with: #('NewTools-Inspector' 'Compatibility-SmalltalkX' 'CalipeL-S-Core' 'CalipeL-S-Pharo' 'CalipeL-S-Benchmarks-Micro' 'CalipeL-S-Tests' 'CalipeL-S-Benchmarks-Game')			
			]
]
