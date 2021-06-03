class initialization
initialize 
	OsVersionXlats := Dictionary newFromPairs:#(
		'linux-gnu' 'Linux'
		
		"Following are taken from:
		https://msdn.microsoft.com/en-gb/library/windows/desktop/ms724832(v=vs.85).aspx"
		
		'5.0'	 'Windows 2000'
		'5.1'	 'Windows XP'
		'5.2'	 'Windows Server 2003'
		'6.0'  'Windows Vista / Server 2008'
		'6.1'  'Windows 7 / Server 2008 R2'
		'6.2'  'Windows 8 / Server 2012'
		'6.3'  'Windows 8.1 / Server 2012 R2'
		'10.0' 'Windows 10'
	).
	Current := self new.
	
	"
	BenchmarkPlarformPharo initialize.
	"
	