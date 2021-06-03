utilities - monticello
monticelloExportTo: directory
	"Export .mcz packages to given directory"

	| packages exporter mcrepo |

	Smalltalk loadPackage: 'stx:goodies/monticello'.
	Smalltalk loadPackage: 'stx:libscm/mercurial/monticello'.
	Class tryLocalSourceFirst: true.


   packages := #(
		'jv:calipel/s'
		'jv:calipel/s/benchmarks/micro'
		'jv:calipel/s/benchmarks/game'
		'jv:calipel/s/tests'
	).

	exporter := [:pkgnm|
		| mcpkg mcwc mcvi mcversion |

		Smalltalk loadPackage: pkgnm.
		mcpkg := MCPackage named: pkgnm.
		mcwc := mcpkg workingCopy.
		mcvi := (Smalltalk at:#HGMCVersionInfo) forPackage: pkgnm.
		[
		   mcversion := mcwc newVersion.
		   mcversion snapshot includeExtrasForSTX: true.
		] on: MCVersionNameAndMessageRequest do:[:ex |
			ex resume: (Array with: mcvi name with: mcvi message)
		].
		mcversion info: mcvi.
		mcrepo storeVersion: mcversion.
	].

	mcrepo := MCDirectoryRepository new directory: directory.
	packages do: exporter.

	"Created: / 11-06-2013 / 02:06:08 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 18-09-2015 / 09:24:33 / Jan Vrany <jan.vrany@fit.cvut.cz>"