# frozen_string_literal: true

require_relative 'test_helper'
require 'availability'

class AvailabilityTest < Minitest::Test
  def test_initializes_with_attributes_and_status_wrapper
    availability = Availability.new('Alice', '2024-07-01', '⚪︎')

    assert_equal 'Alice', availability.name
    assert_equal '2024-07-01', availability.date_slot
    assert_equal 2, availability.score
    assert_equal 'Alice - 2024-07-01 : ⚪︎: 1', availability.to_s
  end

  def test_score_is_not_doubled_for_other_names
    availability = Availability.new('Bob', '2024-07-01', '⚪︎')

    assert_equal 1, availability.score
  end
end
