inspecting
inspector2TabTEXT
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'Text report';
		priority:51;
		text: [ String streamContents: [:s | BenchmarkReport text write: self on: s ] ];
		yourself

	"Created: / 25-11-2014 / 01:07:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"