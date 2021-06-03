Class {
	#name : #BenchmarkRunnerAdapterPharo,
	#superclass : #CommandLineHandler,
	#instVars : [
		'runner'
	],
	#category : #'CalipeL-S-Pharo'
}

{ #category : #'as yet unclassified' }
BenchmarkRunnerAdapterPharo class >> commandName [ 
	^'benchmark'
]

{ #category : #accessing }
BenchmarkRunnerAdapterPharo class >> description [ 
	^'Run CalipeL/S benchmarks'
]

{ #category : #activation }
BenchmarkRunnerAdapterPharo >> activate [	
	| status |
	
	self activateHelp.	
	[
		status := runner main: self arguments.
	] on: Error do:[:ex|
		FileStream stderr 
      		nextPutAll: 'ERROR: ';
        	nextPutAll: ex class printString;
         nextPutAll: ': ';
         nextPutAll: ex description;
         cr.
		status := BenchmarkRunner statusError.
	].
	Smalltalk exit: status. 
]

{ #category : #'initialize-release' }
BenchmarkRunnerAdapterPharo >> initialize [
	super initialize.
	runner := BenchmarkRunner new.
]

{ #category : #printing }
BenchmarkRunnerAdapterPharo >> printHelp [
	self stderr nextPutAll:'usage: ./pharo <image> benchmark <options> suitespec1 [suitespec2 [suitespec3 [...]]]
	
Pharo specific options:
'.
	runner options
]
