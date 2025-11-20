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

  def count_score
    @availabilities.sum(&:score)
  end

  def to_s
    @availabilities.map(&:to_s).join("\n")
  end
end
