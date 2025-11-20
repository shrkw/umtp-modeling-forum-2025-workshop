# frozen_string_literal: true

require_relative 'test_helper'
require 'availability_row'

class AvailabilityRowTest < Minitest::Test
  def test_add_and_count_sums_scores
    row = AvailabilityRow.new
    row.add!(Availability.new('Alice', '2024-07-01', '⚪︎'))
    row.add!(Availability.new('Bob', '2024-07-01', '△'))
    row.add!(Availability.new('Carol', '2024-07-01', 'u_u'))

    assert_in_delta 0.5, AvailabilityStatus.new('△').score
    assert_in_delta 1.5, row.count_score
  end
end
