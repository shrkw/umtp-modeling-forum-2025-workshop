# frozen_string_literal: true

require_relative 'test_helper'
require 'availability_status_symbols'

class AvailabilityStatusSymbolsTest < Minitest::Test
  def test_value_of_returns_matching_enum
    status = AvailabilityStatusSymbols.value_of('⚪︎')

    assert_instance_of AvailabilityStatusSymbols::Available, status
    assert_equal 1, status.score
  end

  def test_value_of_returns_nil_when_not_registered
    status = AvailabilityStatusSymbols.value_of('unknown')

    assert_nil status
  end
end
