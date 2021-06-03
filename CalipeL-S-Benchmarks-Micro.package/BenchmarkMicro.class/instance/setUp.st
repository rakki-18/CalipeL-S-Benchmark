running
setUp
	<setup>

	stream := WriteStream on:String new.
	hello := 'hello' , Character cr asString.
	iterations := iterations isNil ifTrue:[ 1000 ] ifFalse:[ iterations ].
	table := Dictionary new: (iterations * 1000) + ((iterations * 1000) // 5).
	ary1 := (1 to:iterations * 100) asArray.
	ary2 := Array new:iterations * 100 withAll: 0.

	"Created: / 28-05-2013 / 00:50:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 11-06-2013 / 01:25:15 / Jan Vrany <jan.vrany@fit.cvut.cz>"