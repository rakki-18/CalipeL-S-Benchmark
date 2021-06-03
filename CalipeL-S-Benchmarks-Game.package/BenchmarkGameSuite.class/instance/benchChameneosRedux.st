benchmarking
benchChameneosRedux
	"Not yet updated to CalipeL-S"

"/        | result report  |"
"/        problemSize isNil ifTrue:[ "
"/            problemSize := BenchmarkGameChameneosRedux defaultProblemSize "
"/        ]."
"/        report := TextStream with: String new."
"/        result := BenchmarkGameChameneosRedux new runBenchMark: problemSize on: report."
"/        "
"/        Result should be 2*problemSize"
"/        self flag: 'TODO: adapt once verification is supported'."
"/        result = (2 * problemSize) ifFalse: ["
"/                Error signal: self class name, ' benchmark failed. Input: ',"
"/                                                                 runner processes asString, ' Output: ', result asString  ]."
"/"

	"Modified (comment): / 21-06-2013 / 16:42:12 / Jan Vrany <jan.vrany@fit.cvut.cz>"