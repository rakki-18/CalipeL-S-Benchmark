*Compatibility-SmalltalkX
newTemporary
	"Return new temporary file. 
	 Note that this method is by definition insecure - 
	 it may happen that somebody else will open file with
	 the same name..."
	^self newTempFilePrefix: '' suffix: 'tmp'