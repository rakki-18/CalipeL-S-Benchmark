description
excludedFromPreRequisites
	"list all packages which should be ignored in the automatic
	 preRequisites scan. See #preRequisites for more."

	^ #(
		#'stx:goodies/monticello'    "MCDirectoryRepository - referenced by jv_calipel_s class>>monticelloExportTo: "
		#'stx:libscm/mercurial/monticello'    "HGMCVersionInfo - referenced by jv_calipel_s class>>monticelloExportTo: "
	)