inspecting
inspector2TabJSON
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'JSON report';
		priority:50;
		text: [ String streamContents: [:s | BenchmarkReport json write: self on: s ] ];
		yourself

	"Modified: / 25-11-2014 / 01:07:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"