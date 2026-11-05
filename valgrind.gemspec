# frozen_string_literal: true

require_relative "lib/valgrind/version"

Gem::Specification.new do |spec|
  spec.name = "valgrind"
  spec.version = Valgrind::VERSION
  spec.summary = "Control callgrind instrumentation from Ruby."
  spec.description = "Thin Ruby bindings for the callgrind client request " \
                     "macros: start/stop instrumentation, zero stats, dump stats."
  spec.authors = ["Max Bernstein"]
  spec.email = ["ruby@bernsteinbear.com"]
  spec.homepage = "https://github.com/tekknolagi/valgrind.rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.files = Dir["lib/**/*.rb", "ext/**/*.{c,h,rb}", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/valgrind/extconf.rb"]

  spec.metadata["source_code_uri"] = spec.homepage
end
