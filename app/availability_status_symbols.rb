# frozen_string_literal: true

require_relative 'availability_status_symbols/available'
require_relative 'availability_status_symbols/half_available'
require_relative 'availability_status_symbols/unavailable'
require_relative 'availability_status_symbols/negative'

module AvailabilityStatusSymbols
  SYMBOLS = [
    AvailabilityStatusSymbols::Available.new,
    AvailabilityStatusSymbols::HalfAvailable.new,
    AvailabilityStatusSymbols::Unavailable.new,
    AvailabilityStatusSymbols::Negative.new
  ].freeze

  def self.value_of(symbol)
    SYMBOLS.find { |enum| enum.value == symbol }
  end
end
