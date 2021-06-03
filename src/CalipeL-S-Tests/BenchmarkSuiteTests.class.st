Class {
	#name : #BenchmarkSuiteTests,
	#superclass : #TestCase,
	#category : #'CalipeL-S-Tests'
}

{ #category : #documentation }
BenchmarkSuiteTests class >> version_HG [

	^ '$Changeset: <not expanded> $'
]

{ #category : #tests }
BenchmarkSuiteTests >> test_isEmpty [
	| suite |

	suite := BenchmarkSuite class: self class.
	self assert: suite isEmptyOrNil.
	self assert: suite isEmpty.

	suite := BenchmarkSuite class: BenchmarkTestsSuiteA.
	self assert: suite notEmptyOrNil.
	self assert: suite notEmpty.

	suite := BenchmarkSuite new.
	suite addBenchmark: (BenchmarkSuite class: self class).
	self assert: suite isEmptyOrNil.
	self assert: suite isEmpty.

	suite := BenchmarkSuite new.
	suite addBenchmark: (BenchmarkSuite class:BenchmarkTestsSuiteA).
	self assert: suite notEmptyOrNil.
	self assert: suite notEmpty.

	"Created: / 30-09-2015 / 08:32:09 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
