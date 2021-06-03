main
options
	"Prints common command line options to stderr"

	BenchmarkPlatform current stderr nextPutAll:
'
Common options:
  -o FILE ................ write output to FILE instead of to standard output (default: stdout)
  -n RUNS ................ how many times to run each bechmark (default: 5)
  -r REPORTCLASS ......... use REPORTCLASS to generate report (default: BenchmarkReportText)
  -i | --instrument CLS .. add instance if CLS to set instruments (may be specified multiple times)
  --arguments FILE ....... read additional arguments from FILE
  --setup EXPR ........... evaluate EXPR before actually running any benchmark
  --setup-script FILE .... evaluate code in FILE before actually running any benchmark
  --teardown EXPR ........ evaluate EXPR after all benchmarks are run
  --teardown-script FILE . evaluate code in FILE  after all benchmarks are run
  --text ................. generate text report (equivalent to -r BenchmarkReportText)
  --json ................. generate JSON report (equivalent to -r BenchmarkReportJSON)
  --tag TAG .............. tag for the current benchmark set (default: "default")
  --description .......... short string describing the current configuration (default: nothing)
  -DNAME=VALUE ........... defines a parameter NAME with value of VALUE

Suitespec format:
  <suitespec> is CLASSNAME[#SELECTOR]

More documetation:
  see https://bitbucket.org/janvrany/jv-calipel/wiki/Home

'

	"Created: / 06-06-2013 / 11:01:42 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 28-11-2014 / 00:16:52 / Jan Vrany <jan.vrany@fit.cvut.cz>"