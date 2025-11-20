# frozen_string_literal: true

require_relative 'availability_row'

class AvailabilityTable
  # availability_rows: { '2024-07-01' => AvailabilityRow, '2024-07-02' => AvailabilityRow, ... }
  def initialize
    @availability_rows = {}
  end

  # participant: Participant or String name, available_slots: [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']]
  def add(participant, available_slots)
    # TODO: available_slotsが親クラスの日付にあっているかを確認したい
    available_slots.each do |date, availability|
      @availability_rows[date] = AvailabilityRow.new unless @availability_rows[date]
      @availability_rows[date].add!(Availability.new(participant, date, availability))
    end
  end

  # 各日付行での合計スコアと候補日を返す
  def finalize_result
    best_date = nil
    max_available_count = nil

    @availability_rows.each do |date, row|
      available_count = row.count_score
      if max_available_count.nil? || available_count > max_available_count
        max_available_count = available_count
        best_date = date
      end
    end

    { date: best_date, score: max_available_count }
  end

  def finalize_date
    finalize_result[:date]
  end

  def to_s
    @availability_rows.map(&:to_s).join("\n")
  end
end
