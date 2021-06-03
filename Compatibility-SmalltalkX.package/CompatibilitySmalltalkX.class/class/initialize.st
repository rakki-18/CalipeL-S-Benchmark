initialization
initialize
	"Define some aliases. This allows loading .mcz generated on Smalltalk/X as Smalltalk/X 
	 names of certain classes differently"
	
	Smalltalk at: #Block put: BlockClosure.
	"Define an BlockContext alias.
	 Some older Pharo had no BlockContext but had MethodContext.
	 In Pharo 5.0, there's no MethodContext but only Context..."
	(Smalltalk includesKey: #MethodContext) ifTrue:[
		Smalltalk at: #BlockContext put: (Smalltalk at: #MethodContext).
	] ifFalse:[	
		(Smalltalk includesKey: #Context) ifTrue:[
			Smalltalk at: #Context put: (Smalltalk at: #Context).
		]
	].

	"Define alias Filename, which is FileReference. I never understood
	 why Pharoers named it like this when all other Smalltalks had 
	 Filename for decades..."
	(Smalltalk includesKey: #FileReference) ifTrue:[
		Smalltalk at: #Filename put: (Smalltalk at: #FileReference)
	]	
	
	