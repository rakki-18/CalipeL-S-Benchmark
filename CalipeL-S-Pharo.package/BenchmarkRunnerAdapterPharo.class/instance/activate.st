activation
activate	
	| status |
	
	self activateHelp.	
	[
		status := runner main: self arguments.
	] on: Error do:[:ex|
		FileStream stderr 
      		nextPutAll: 'ERROR: ';
        	nextPutAll: ex class printString;
         nextPutAll: ': ';
         nextPutAll: ex description;
         cr.
		status := BenchmarkRunner statusError.
	].
	Smalltalk exit: status. 