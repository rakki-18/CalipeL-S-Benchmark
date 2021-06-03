Class {
	#name : #Benchmark,
	#superclass : #Object,
	#category : #'CalipeL-S-Core'
}

{ #category : #documentation }
Benchmark class >> documentation [
"
	Base abstract superclass for benchmarks.

	NOTE: There's no need to inherit from this class, everything
	is specified by annotations. However, this class provides some
	convenient class methods.

	[author:]
		Jan Vrany <jan.vrany@fit.cvut.cz>

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #testing }
Benchmark class >> isAbstract [
	^ self == Benchmark

	"Created: / 11-03-2014 / 23:10:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
Benchmark class >> run [
	^ (BenchmarkSuite class:self) run

	"Created: / 10-06-2013 / 21:53:58 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
Benchmark class >> run: benchmark [
	^ (BenchmarkInstance class:self selector:benchmark) run

	"Created: / 31-05-2013 / 10:39:53 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-06-2013 / 21:53:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #running }
Benchmark class >> run: benchmark with: parameters [
	^ (BenchmarkInstance class:self selector:benchmark) runWith: parameters

	"Created: / 10-03-2014 / 00:12:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
