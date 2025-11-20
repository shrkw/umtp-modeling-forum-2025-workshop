# frozen_string_literal: true

# 日程調整を行うブートストラップクラス
class Resolver
  attr_reader :slots, :availability_table, :minimum_score_threshold

  READJUSTMENT = '再調整'

  def initialize(minimum_score_threshold: nil)
    @slots = []
    @availability_table = AvailabilityTable.new
    @minimum_score_threshold = minimum_score_threshold
  end

  def add_slots(string_date_slots)
    @slots = string_date_slots.map { |slot_string| DateSlot.new(slot_string) }
  end

  # input: Participant or String name, ['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']
  def register_availability(participant, available_slots)
    @availability_table.add(participant, available_slots)
  end

  def finalize_date
    result = @availability_table.finalize_result
    return READJUSTMENT if needs_readjustment?(result[:score])

    result[:date]
  end

  private

  def needs_readjustment?(score)
    return false if @minimum_score_threshold.nil?
    return true if score.nil?

    score <= @minimum_score_threshold
  end
end
