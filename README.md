# CalipeL-S-Benchmark
Package to generate benchmarked reports in Pharo

# Installing the package
```Smalltalk
Metacello new
  baseline: 'CalipeLSBenchmark';
  repository: 'github://rakki-18/CalipeL-S-Benchmark/src';
  load.
```

# Depending on the project
To add a dependency to your project, add the following in your baseline method:
```Smalltalk
spec
  baseline: 'CalipeLSBenchmark'
  with: [spec repository: 'github://rakki-18/CalipeL-S-Benchmark/src' ].
```
