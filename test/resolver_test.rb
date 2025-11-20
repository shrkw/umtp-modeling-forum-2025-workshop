# frozen_string_literal: true

require_relative 'test_helper'
require 'resolver'

class ResolverTest < Minitest::Test
  def test_finalize_date_returns_best_slot
    resolver = Resolver.new
    resolver.add_slots(%w[2024-07-01 2024-07-02])
    resolver.register_availability('Alice', [['2024-07-01', '⚪︎'], ['2024-07-02', 'x']])
    resolver.register_availability('Bob', [['2024-07-01', '△'], ['2024-07-02', '⚪︎']])

    assert_equal '2024-07-01', resolver.finalize_date
  end

  def test_finalize_date_requests_readjustment_when_below_threshold
    resolver = Resolver.new(minimum_score_threshold: 1)
    resolver.add_slots(['2024-07-01'])
    resolver.register_availability('Alice', [%w[2024-07-01 x]])

    assert_equal Resolver::READJUSTMENT, resolver.finalize_date
  end

  def test_finalize_date_requests_readjustment_when_no_score
    resolver = Resolver.new(minimum_score_threshold: 1)

    assert_equal Resolver::READJUSTMENT, resolver.finalize_date
  end
end
