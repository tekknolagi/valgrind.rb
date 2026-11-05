# frozen_string_literal: true

require "rake/extensiontask"
require "rake/testtask"

Rake::ExtensionTask.new("valgrind") do |ext|
  ext.lib_dir = "lib/valgrind"
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test" << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task test: :compile
task default: :test
