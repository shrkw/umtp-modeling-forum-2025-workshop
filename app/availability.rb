# frozen_string_literal: true

require_relative 'availability_status'

class Availability
  attr_reader :name, :date_slot, :status

  def initialize(name, date_slot, status)
    @name = name
    @date_slot = date_slot
    @status = AvailabilityStatus.new(status)
  end

  def score
    base = @status.score
    return base * 2 if @name == 'Alice'

    base
  end

  def to_s
    "#{@name} - #{@date_slot} : #{@status}"
  end
end
