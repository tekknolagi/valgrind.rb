# `valgrind`

Control callgrind instrumentation from Ruby. A port of
[tekknolagi/valgrind](https://github.com/tekknolagi/valgrind) (Python).

## Usage

Run `gem install valgrind`.

In `benchmark.rb` put:

```ruby
require "valgrind"

some_startup_code
Valgrind.callgrind_start_instrumentation
some_expensive_function
Valgrind.callgrind_stop_instrumentation
Valgrind.callgrind_dump_stats("myprofile")
```

Run `valgrind --tool=callgrind --instr-atstart=no ruby benchmark.rb`.

See profile in `myprofile` file. Consider opening with KCachegrind or
QCachegrind.

## API

All methods are module functions on `Valgrind` and return `nil`. Outside of
valgrind the underlying client requests are no-ops.

- `Valgrind.callgrind_start_instrumentation`
- `Valgrind.callgrind_stop_instrumentation`
- `Valgrind.callgrind_zero_stats`
- `Valgrind.callgrind_toggle_collect` — toggle whether events are collected
  (pair with `--collect-atstart=no`)
- `Valgrind.callgrind_dump_stats(description = nil)`

## Development

```sh
bundle install
bundle exec rake        # compile + test
```

## Authors

Matthias Braun (original C), Max Bernstein
