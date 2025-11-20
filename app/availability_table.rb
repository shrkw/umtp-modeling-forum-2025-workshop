# frozen_string_literal: true

require_relative 'availability_row'

class AvailabilityTable
  attr_accessor :allowed_date_collection

  # availability_rows: { '2024-07-01' => AvailabilityRow, '2024-07-02' => AvailabilityRow, ... }
  def initialize(allowed_date_collection: nil)
    @availability_rows = {}
    @allowed_date_collection = allowed_date_collection
  end

  # participant: Participant or String name, available_slots: [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']]
  def add(participant, available_slots)
    raise ArgumentError, 'allowed_date_collection must be set' if @allowed_date_collection.nil?

    available_slots.each do |date, availability|
      next unless @allowed_date_collection.include?(date)

      @availability_rows[date] = AvailabilityRow.new unless @availability_rows[date]
      @availability_rows[date].add!(Availability.new(participant, date, availability))
    end
  end

  # 各日付行での合計スコアと候補日を返す
  def finalize_result
    @availability_rows.reduce({ date: nil, score: nil }) do |best, (date, row)|
      best[:score].nil? || row.count_score > best[:score] ? { date: date, score: row.count_score } : best
    end
  end

  def finalize_date
    finalize_result[:date]
  end

  def to_s
    @availability_rows.map(&:to_s).join("\n")
  end
end
