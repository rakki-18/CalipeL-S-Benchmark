initialization
initialize
	"Invoked at system start or when the class is dynamically loaded."

	EscapeTable := Dictionary new.
	EscapeTable at:  8 put: '\b'.
	EscapeTable at:  9 put: '\t'.
	EscapeTable at: 10 put: '\n'.
	EscapeTable at: 12 put: '\f'.
	EscapeTable at: 13 put: '\r'.
	EscapeTable at: 34 put: '\"'.
	EscapeTable at: 92 put: '\\'.

	Rules := OrderedCollection new.
	Rules add: [:obj | obj isNil ];             add:#writeNull: .
	Rules add: [:obj | obj isString ];          add:#writeString: .
	Rules add: [:obj | obj isBoolean ];         add:#writeBoolean: .
	Rules add: [:obj | obj isInteger ];         add:#writeInteger: .
	Rules add: [:obj | obj isFloat ];           add:#writeFloat: .
	"CalipeL/S specific mappings"
	Rules add: [:obj | obj isClass ];           add:#writeClass: .

	"Modified: / 12-06-2013 / 13:53:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified (comment): / 16-06-2013 / 00:53:32 / Jan Vrany <jan.vrany@fit.cvut.cz>"