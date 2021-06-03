initialize-release
mask: p islands: i
	"/WAS: i = 0, but does not compile because of stc bug, sigh."
	^ i == 0
		ifTrue:  [self createMeteorPiece mask: p]
		ifFalse: [self createMeteorPieceWithIsland mask: p; islands: i]