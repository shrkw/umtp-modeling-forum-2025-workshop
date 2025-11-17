require_relative 'availability'

# 日付行での出欠登録群を保持するクラス
class AvailabilityCollection
  def initialize(availabilities = [])
    @availabilities = availabilities
  end

  def add!(availability)
    @availabilities << availability
  end

  def count
    counts = 0
    @availabilities.each do |availability|
      case availability.available
      when '⚪︎'
        counts += 1
      end
    end
    counts
  end

  def to_s
    @availabilities.map(&:to_s).join("\n")
  end

  def run
    ac = AvailabilityCollection.new
    ac.add!(Availability.new('Alice', '2024-07-01', '⚪︎'))
    ac.add!(Availability.new('Bob', '2024-07-01', 'x'))
    ac.add!(Availability.new('Charlie', '2024-07-01', 'x'))
    ac.count
  end
end
