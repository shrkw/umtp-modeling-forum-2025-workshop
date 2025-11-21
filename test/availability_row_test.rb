# frozen_string_literal: true

require_relative 'test_helper'
require 'availability_row'

class AvailabilityRowTest < Minitest::Test
  def test_add_and_count_sums_scores
    row = AvailabilityRow.new
    row.add!(Availability.new(Participant.new('Alice', role: Roles::Required.new), '2024-07-01', '⚪︎'))
    row.add!(Availability.new(Participant.new('Bob', role: Roles::Optional.new), '2024-07-01', '△'))
    row.add!(Availability.new(Participant.new('Carol', role: Roles::Optional.new), '2024-07-01', 'u_u'))

    assert_in_delta 0.5, AvailabilityStatus.new('△').score
    assert_in_delta 1.5, row.count_score
  end
end
