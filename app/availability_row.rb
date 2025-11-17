# frozen_string_literal: true

require_relative 'availability'

# 日付行での出欠登録群を保持するクラス
class AvailabilityRow
  def initialize(availabilities = [])
    @availabilities = availabilities
  end

  def add!(availability)
    @availabilities << availability
  end

  def count
    @availabilities.sum { |availability| availability.status.score }
  end

  def to_s
    @availabilities.map(&:to_s).join("\n")
  end

  def run
    ac = AvailabilityRow.new
    ac.add!(Availability.new('Alice', '2024-07-01', '⚪︎'))
    ac.add!(Availability.new('Bob', '2024-07-01', 'x'))
    ac.add!(Availability.new('Charlie', '2024-07-01', 'x'))
    ac.count
  end
end
