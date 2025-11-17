require_relative 'availability_row'

class AvailabilityTable
  # availability_rows: { '2024-07-01' => AvailabilityRow, '2024-07-02' => AvailabilityRow, ... }
  def initialize
    @availability_rows = {}
  end

  # participant_name: 'Alice', available_slots: [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']]
  def add(participant_name, available_slots)
    # TODO: available_slotsが親クラスの日付にあっているかを確認したい
    available_slots.each do |date, availability|
      if @availability_rows[date]
        @availability_rows[date].add!(Availability.new(participant_name, date, availability))
      else
        @availability_rows[date] = AvailabilityRow.new
        @availability_rows[date].add!(Availability.new(participant_name, date, availability))
      end
    end
  end

  # 各日付行で、xを0、⚪︎を1として集計し、最も多くの参加者が参加可能な日付を特定する
  def finalize_date
    best_date = nil
    max_available_count = -1

    @availability_rows.each do |date, collection|
      available_count = collection.count
      if available_count > max_available_count
        max_available_count = available_count
        best_date = date
      end
    end

    best_date
  end

  def to_s
    @availability_rows.map(&:to_s).join("\n")
  end
end
