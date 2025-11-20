# frozen_string_literal: true

require_relative 'test_helper'
require 'availability_status'

class AvailabilityStatusTest < Minitest::Test
  def test_wraps_registered_symbol_and_exposes_score
    status = AvailabilityStatus.new('x')

    assert_equal 0, status.score
    assert_equal 'x: 0', status.to_s
  end

  def test_uses_half_available_score
    status = AvailabilityStatus.new('△')

    assert_in_delta 0.5, status.score
  end
end
