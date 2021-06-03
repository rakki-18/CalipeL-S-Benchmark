description - contents
classNamesAndAttributes
	"lists the classes which are to be included in the project.
	 Each entry in the list may be: a single class-name (symbol),
	 or an array-literal consisting of class name and attributes.
	 Attributes are: #autoload or #<os> where os is one of win32, unix,..."

	^ #(
		"<className> or (<className> attributes...) in load order"
		(BenchmarkGameBinaryTrees autoload)
		(BenchmarkGameBitOps autoload)
		(BenchmarkGameBody autoload)
		(BenchmarkGameChameleon autoload)
		(BenchmarkGameChameleons autoload)
		(BenchmarkGameChameneosColour autoload)
		(BenchmarkGameChameneosRedux autoload)
		(BenchmarkGameCreature autoload)
		(BenchmarkGameFannkuchRedux autoload)
		(BenchmarkGameFasta autoload)
		(BenchmarkGameFastaCache autoload)
		(BenchmarkGameKNucleotide autoload)
		(BenchmarkGameMall autoload)
		(BenchmarkGameMandelbrot autoload)
		(BenchmarkGameMeetingPlace autoload)
		(BenchmarkGameMeteor autoload)
		(BenchmarkGameMeteorBoard autoload)
		(BenchmarkGameMeteorPiece autoload)
		(BenchmarkGameNBody autoload)
		(BenchmarkGamePair autoload)
		(BenchmarkGamePermGeneratorRedux autoload)
		(BenchmarkGamePiDigitSpigot autoload)
		(BenchmarkGamePiDigits autoload)
		(BenchmarkGameRandomNumber autoload)
		(BenchmarkGameRegexDNA autoload)
		(BenchmarkGameRepeatStream autoload)
		(BenchmarkGameReverseComplement autoload)
		(BenchmarkGameSpectralNorm autoload)
		(BenchmarkGameSuite autoload)
		(BenchmarkGameTests autoload)
		(BenchmarkGameThread autoload)
		(BenchmarkGameThreadRing autoload)
		(BenchmarkGameTreeNode autoload)
		#'jv_calipel_s_benchmarks_game'
		(BenchmarkGameMeteorPieceWithIsland autoload)
		(BenchmarkGameRandomStream autoload)
	)