class AvailabilityTable
  # availability_collections: { '2024-07-01' => AvailabilityCollection, '2024-07-02' => AvailabilityCollection, ... }
  def initialize
    @availability_collections = {}
  end

  # participant_name: 'Alice', available_slots: [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']]
  def add(participant_name, available_slots)
    available_slots.each do |date, availability|
      if @availability_collections[date]
      @availability_collections[date].add!(Availability.new(participant_name, date, availability))
      else
      @availability_collections[date] = AvailabilityCollection.new
      @availability_collections[date].add!(Availability.new(participant_name, date, availability))
      end
    end
  end

  def finalize_date
    # 各日付行で、xを0、⚪︎を1として集計し、最も多くの参加者が参加可能な日付を特定するロジックをここに実装できます
    best_date = nil
    max_available_count = -1

    @availability_collections.each do |date, collection|
      available_count = collection.count
      if available_count > max_available_count
      max_available_count = available_count
      best_date = date
      end
    end

    best_date
  end

  def to_s
    @availability_collections.map(&:to_s).join("\n")
  end
end
