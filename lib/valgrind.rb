# frozen_string_literal: true

require_relative "valgrind/version"
require "valgrind/valgrind"

# Control callgrind instrumentation from Ruby.
#
# Each method is a thin wrapper around the corresponding callgrind client
# request macro. Outside of valgrind they are no-ops.
module Valgrind
end
