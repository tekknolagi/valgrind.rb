# frozen_string_literal: true

require "minitest/autorun"
require "valgrind"

class ValgrindTest < Minitest::Test
  def test_start_stop_are_noops_outside_valgrind
    assert_nil Valgrind.callgrind_start_instrumentation
    assert_nil Valgrind.callgrind_stop_instrumentation
  end

  def test_zero_stats
    assert_nil Valgrind.callgrind_zero_stats
  end

  def test_toggle_collect
    assert_nil Valgrind.callgrind_toggle_collect
  end

  def test_dump_stats_without_description
    assert_nil Valgrind.callgrind_dump_stats
  end

  def test_dump_stats_with_description
    assert_nil Valgrind.callgrind_dump_stats("myprofile")
  end

  def test_dump_stats_rejects_non_string
    assert_raises(TypeError) { Valgrind.callgrind_dump_stats(42) }
  end

  def test_dump_stats_rejects_extra_args
    assert_raises(ArgumentError) { Valgrind.callgrind_dump_stats("a", "b") }
  end
end
