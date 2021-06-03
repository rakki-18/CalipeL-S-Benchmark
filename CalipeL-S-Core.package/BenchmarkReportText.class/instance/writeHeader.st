writing
writeHeader
	stream
		nextPutAll: 'Generated at :';
		nextPutAll: Date today printString;
		nextPutAll: ' ';
		nextPutAll: Time now printString;
		cr;
		cr.
	1 to: colwidths size do:[:i |
		self format: (colheaders at:i) width: (colwidths at: i) align: #right.
		stream space; "nextPut: $|;"space; space.
	].
	stream nextPutAll: 'Parameters'

	"Modified: / 25-11-2014 / 01:50:49 / Jan Vrany <jan.vrany@fit.cvut.cz>"