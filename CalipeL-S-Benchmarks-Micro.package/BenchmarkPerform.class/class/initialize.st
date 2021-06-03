initialization
initialize
	"Invoked at system start or when the class is dynamically loaded."

	| rng seq  |

	rng := Random new seed: 131.
	seq := 0.

	GeneratorSequential := [:upper | | v | v := seq. seq := seq + 1. (v \\ upper) + 1 ].
	GeneratorUniform := [:upper | rng nextInt: upper ].
	GeneratorGaussian := [:upper | 
		| nrng x1 x2 w y1 y2 v0 |

		nrng := [
			| v |
			y2 notNil ifTrue: [ 
				v := y2.
				y2 := nil.
			] ifFalse:[
				[
					x1 := (2.0 * rng next) - 1.0.
					x2 := (2.0 * rng next) - 1.0.
					w := x1 * x1 + (x2 * x2).
					w >= 1.0 
				] whileTrue.
				w := (-2.0 * w ln / w) sqrt.
				y1 := x1 * w.
				y2 := x2 * w.
				v :=  y1.
			].
			v
		].
		[ 
			v0 := (((nrng value) * (upper / 2.0 / 3.5"deviations")) +  (upper / 2.0)) truncated.
			v0 < 1 or:[v0 > upper ]
		] whileTrue.
		v0.
	].

	Generators := Dictionary new.
	Generators at: #sequential put: GeneratorSequential.
	Generators at: #uniform put: GeneratorUniform.
	Generators at: #normal put: GeneratorGaussian.

	"
	self initialize.

	GeneratorSequential value: 10.
	GeneratorUniform value: 10.
	GeneratorGaussian value: 10.





	"

	"Modified: / 01-08-2013 / 23:03:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"