// Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
// Originally authored by Matthias Braun for Python; ported to Ruby.
#include <ruby.h>

#include "callgrind.h"

static VALUE callgrind_dump_stats(int argc, VALUE *argv, VALUE self) {
  VALUE description = Qnil;
  rb_scan_args(argc, argv, "01", &description);

  if (NIL_P(description)) {
    CALLGRIND_DUMP_STATS;
  } else {
    const char *str = StringValueCStr(description);
    CALLGRIND_DUMP_STATS_AT(str);
    (void)str; // No-op on platforms valgrind.h does not support.
  }
  return Qnil;
}

static VALUE callgrind_start_instrumentation(VALUE self) {
  CALLGRIND_START_INSTRUMENTATION;
  return Qnil;
}

static VALUE callgrind_stop_instrumentation(VALUE self) {
  CALLGRIND_STOP_INSTRUMENTATION;
  return Qnil;
}

static VALUE callgrind_zero_stats(VALUE self) {
  CALLGRIND_ZERO_STATS;
  return Qnil;
}

void Init_valgrind(void) {
  VALUE mValgrind = rb_define_module("Valgrind");
  rb_define_module_function(mValgrind, "callgrind_dump_stats",
                            callgrind_dump_stats, -1);
  rb_define_module_function(mValgrind, "callgrind_start_instrumentation",
                            callgrind_start_instrumentation, 0);
  rb_define_module_function(mValgrind, "callgrind_stop_instrumentation",
                            callgrind_stop_instrumentation, 0);
  rb_define_module_function(mValgrind, "callgrind_zero_stats",
                            callgrind_zero_stats, 0);
}
