# frozen_string_literal: true

require_relative 'availability_status'
require_relative 'participant'

class Availability
  attr_reader :participant, :date_slot, :status

  def initialize(participant, date_slot, status)
    @participant = participant
    @date_slot = date_slot
    @status = AvailabilityStatus.new(status)
  end

  def name
    @participant.name
  end

  def score
    base = @status.score
    return base * 2 if @participant.required

    base
  end

  def to_s
    "#{name} - #{@date_slot} : #{@status}"
  end
end
