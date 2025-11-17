# frozen_string_literal: true

require_relative 'availability_status_symbols'

class AvailabilityStatus
  def initialize(status_symbol)
    @status_symbol = AvailabilityStatusSymbols.value_of(status_symbol)
  end

  def score
    @status_symbol.score
  end

  def to_s
    @status_symbol.to_s
  end
end
