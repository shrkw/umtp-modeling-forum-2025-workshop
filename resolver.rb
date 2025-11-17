class Resolver
  attr_reader :slots, :availability_table

  def initialize
    @slots = []
    @availability_table = AvailabilityTable.new
  end

  def add_slots(string_date_slots)
    @slots = string_date_slots.map { |slot_string| DateSlot.new(slot_string) }
    self
  end

  # input: 'Alice', ['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']
  def register_availability(participant_name, available_slots)
    @availability_table.add(participant_name, available_slots)
  end

  # 候補日を出す
  def 最適な候補日を出す
    @availability_table.finalize_date
  end

  def to_s
    <<~EOS
    Slots:
    #{@slots.map(&:to_s).join(", ")}

    Availability:
    #{@availability_table.to_s}
    EOS
  end
end
