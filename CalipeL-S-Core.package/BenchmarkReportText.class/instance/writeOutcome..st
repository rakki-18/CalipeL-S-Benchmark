writing
writeOutcome: outcome
	1 to: colwidths size do:[:i |
		self format: ((colmap at:i) value: outcome value: i) width: (colwidths at: i) align: #right.
		stream space; "nextPut: $|;"space; space.
	].
	outcome parameters notEmpty ifTrue:[
			stream nextPutAll: '{'.
			(outcome parameters  asSortedCollection:[:a :b | a key name < b key name ]) do:[:paramAndValue|
				stream nextPutAll: paramAndValue key name.
				stream nextPutAll: '='.
				stream nextPutAll: paramAndValue value storeString.
			] separatedBy:[
				stream nextPutAll: ', '.
			].
			stream nextPutAll: '}'.
			].
	stream cr.

	"Created: / 11-06-2013 / 23:24:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 27-11-2014 / 13:25:56 / Jan Vrany <jan.vrany@fit.cvut.cz>"