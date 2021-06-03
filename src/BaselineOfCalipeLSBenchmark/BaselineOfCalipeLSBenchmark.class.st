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
				package: 'CalipeL-S-Core';
				package: 'CalipeL-S-Pharo';
				package: 'CalipeL-S-Benchmarks-Micro';
				package: 'CalipeL-S-Benchmarks-Game';
				package: 'CalipeL-S-Tests'.
			spec
				group: 'default'				with: #('CalipeL-S-Core' 'CalipeL-S-Pharo' 'CalipeL-S-Benchmarks-Micro' 'CalipeL-S-Tests' 'CalipeL-S-Benchmarks-Game')			
			]
]
