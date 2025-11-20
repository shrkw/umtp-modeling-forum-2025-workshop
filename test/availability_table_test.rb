# frozen_string_literal: true

require_relative 'test_helper'
require 'availability_table'

class AvailabilityTableTest < Minitest::Test
  def test_finalize_result_returns_best_date_and_score
    table = AvailabilityTable.new
    table.add(Participant.new('Alice', required: true), [['2024-07-01', '⚪︎'], ['2024-07-02', 'x']])
    table.add(Participant.new('Bob'), [['2024-07-01', '△'], ['2024-07-02', '⚪︎']])

    result = table.finalize_result

    assert_equal '2024-07-01', result[:date]
    assert_in_delta 2.5, result[:score]
  end

  def test_finalize_result_handles_no_data
    table = AvailabilityTable.new

    assert_equal({ date: nil, score: nil }, table.finalize_result)
  end
end
