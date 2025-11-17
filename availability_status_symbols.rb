# frozen_string_literal: true

require_relative 'availability_status_symbols/available'
require_relative 'availability_status_symbols/half_available'
require_relative 'availability_status_symbols/unavailable'

module AvailabilityStatusSymbols
  ENUMS = {
    available: AvailabilityStatusSymbols::Available.new,
    half_available: AvailabilityStatusSymbols::HalfAvailable.new,
    unavailable: AvailabilityStatusSymbols::Unavailable.new
  }.freeze

  def self.value_of(symbol)
    ENUMS.each_value do |enum|
      return enum if enum.value == symbol
    end
    nil
  end
end
