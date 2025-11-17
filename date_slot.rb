require 'date'

class DateSlot
  attr_reader :date

  def initialize(date)
    @date = Date.parse(date)
  end

  def to_s
    @date.strftime("%Y-%m-%d")
  end
end
