# frozen_string_literal: true

require "mkmf"

$INCFLAGS << " -I#{File.expand_path(__dir__)}"

create_makefile("valgrind/valgrind")
