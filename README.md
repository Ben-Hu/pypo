## foo.bar
```
Operating System: Linux
CPU Information: AMD Ryzen 7 3700X 8-Core Processor
Number of Available Cores: 16
Available memory: 7.77 GB
Elixir 1.10.3
Erlang 22.2.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
parallel: 1
inputs: none specified
Estimated total run time: 28 s

Benchmarking nimble...
Benchmarking server...

Name             ips        average  deviation         median         99th %
nimble         41.82       23.91 ms   ±143.28%        4.33 ms      136.32 ms
server          6.79      147.25 ms     ±5.53%      144.71 ms      170.92 ms

Comparison:
nimble         41.82
server          6.79 - 6.16x slower +123.34 ms

Memory usage statistics:

Name           average  deviation         median         99th %
nimble        405.84 B     ±2.46%          408 B          408 B
server           472 B     ±0.00%          472 B          472 B

Comparison:
nimble           408 B
server           472 B - 1.16x memory usage +66.16 B
```

## sci.run
```
Operating System: Linux
CPU Information: AMD Ryzen 7 3700X 8-Core Processor
Number of Available Cores: 16
Available memory: 7.77 GB
Elixir 1.10.3
Erlang 22.2.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
parallel: 1
inputs: none specified
Estimated total run time: 28 s

Benchmarking nimble...
Benchmarking server...

Name             ips        average  deviation         median         99th %
nimble         14.48       69.07 ms   ±162.29%       24.24 ms      493.58 ms
server          3.47      288.02 ms     ±5.75%      282.04 ms      337.76 ms

Comparison:
nimble         14.48
server          3.47 - 4.17x slower +218.95 ms

Memory usage statistics:

Name      Memory usage
nimble           400 B
server           464 B - 1.16x memory usage +64 B
```
