baselines
baseline01: spec
	<version: '0.1-baseline'>
	
	spec for: #common do:[
		spec package: 'Compatibility-SmalltalkX' with: [ 
			spec repository: 'http://smalltalkhub.com/mc/PharoExtras/SmalltalkCompatibility/main'. 
		].
		spec package: 'Compatibility-ANSI' with: [ 
			spec repository: 'http://smalltalkhub.com/mc/PharoExtras/SmalltalkCompatibility/main'. 
		].
		spec
			repository: 'http://smalltalkhub.com/mc/JanVrany/CalipeL-S/main';
			package: 'CalipeL-S-Core';
			package: 'CalipeL-S-Pharo';
			package: 'CalipeL-S-Benchmarks-Micro';
			package: 'CalipeL-S-Benchmarks-Game';
			package: 'CalipeL-S-Tests';				
			yourself
	]