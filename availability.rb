require_relative 'availability_status'

class Availability
  attr_reader :name, :date_slot, :status

  def initialize(name, date_slot, status)
    @name = name
    @date_slot = date_slot
    @status = AvailabilityStatus.new(status)
  end

  def to_s
    "#{@name} - #{@date_slot} : #{@status}"
  end
end
