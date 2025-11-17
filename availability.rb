class Availability
  attr_reader :name, :date_slot, :available

  def initialize(name, date_slot, available)
    @name = name
    @date_slot = date_slot
    @available = available
  end

  def to_s
    "#{@name} - #{@date_slot} : #{@available}"
  end
end
