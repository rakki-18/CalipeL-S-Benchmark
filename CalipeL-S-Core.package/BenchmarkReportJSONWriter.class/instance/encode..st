private
encode: string

	string do:[:char|
		| code escape |

		code := char codePoint.
		escape := EscapeTable at: code ifAbsent:[nil].
		escape notNil ifTrue:[
			stream nextPutAll: escape
		] ifFalse:[
			(code < 32 or:[code > 127]) ifTrue:[
				self error: 'Unimplemented \u escaping'.
			] ifFalse:[
				stream nextPut: char.
			]
		]
	].

	"Created: / 12-06-2013 / 13:42:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"