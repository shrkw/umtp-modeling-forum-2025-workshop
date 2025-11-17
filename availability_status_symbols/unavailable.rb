# frozen_string_literal: true

require_relative 'base'

module AvailabilityStatusSymbols
  class Unavailable < Base
    def value
      'x'
    end

    def score
      0
    end
  end
end
