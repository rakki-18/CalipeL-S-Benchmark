running
setUp
	<setup>

	| rng1 rng2 |

	nreceivers isNil ifTrue:[
		BenchmarkParameterError new signal:'No value set for parameter ''nreceivers''!'.    
	].
	nselectors isNil ifTrue:[
		BenchmarkParameterError new signal:'No value set for parameter ''nselectors''!'.    
	].

	receivers := Smalltalk allClasses asArray copyFrom: 1 to: nreceivers.

	rng1 := Random new seed: 173.
	selectors := Array new: 16.
	1 to: 16 do:[:na|
		| bucket |

		bucket := (1 to: nselectors) collect:[:i|
			| no suffixSel suffixMethod |
			suffixSel := #(
							"00" ''
							"01" ':'
							"02" ':a:'
							"03" ':a:a:'
							"04" ':a:a:a:'
							"05" ':a:a:a:a:'
							"06" ':a:a:a:a:a:'
							"07" ':a:a:a:a:a:a:'
							"08" ':a:a:a:a:a:a:a:'
							"09" ':a:a:a:a:a:a:a:a:'
							"10" ':a:a:a:a:a:a:a:a:a:'
							"11" ':a:a:a:a:a:a:a:a:a:a:'
							"12" ':a:a:a:a:a:a:a:a:a:a:a:'
							"13" ':a:a:a:a:a:a:a:a:a:a:a:a:'
							"14" ':a:a:a:a:a:a:a:a:a:a:a:a:a:'
							"15" ':a:a:a:a:a:a:a:a:a:a:a:a:a:a:'
				) at: na.
				suffixMethod := #(
							"00" ''
							"01" ':a1'
							"02" ':a1 a:a2'
							"03" ':a1 a:a2 a:a3'
							"04" ':a1 a:a2 a:a3 a:a4'
							"05" ':a1 a:a2 a:a3 a:a4 a:a5'
							"06" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6'
							"07" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7'
							"08" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8'
							"09" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9'
							"10" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA'
							"11" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB'
							"12" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC'
							"13" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD'
							"14" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD a:aE'
							"15" ':a1 a:a2 a:a3 a:a4 a:a5 a:a6 a:a7 a:a8 a:a9 a:aA a:aB a:aC a:aD a:aE a:aF'
				) at: na.
				no := (rng1 nextInt: SmallInteger maxVal) printString.
				Object compile: 'm' , no , suffixMethod , '
				^ 123456' classified: 'benchmark-mocks'.
				('m', no , suffixSel) asSymbol.
		].
		selectors at: na put: bucket.
	].

	rng2 := Generators at: recdistrib.
	recindices := Array new: nreceivers.
	1 to: recindices size do:[:i|
		recindices  at: i put: (rng2 value: recindices size).
	].

	rng2 := Generators at: seldistrib.
	selindices  := Array new: nselectors.
	1 to: selindices size do:[:i|
		selindices  at: i put: (rng2 value: selindices  size).
	].

	hasPerformWith4 := Object canUnderstand: #perform:with:with:with:with:.
	hasPerformWith5 := Object canUnderstand: #perform:with:with:with:with:with:.
	hasPerformWith6 := Object canUnderstand: #perform:with:with:with:with:with:with:.

	"Created: / 20-07-2013 / 00:55:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 16-10-2015 / 19:54:19 / Jan Vrany <jan.vrany@fit.cvut.cz>"