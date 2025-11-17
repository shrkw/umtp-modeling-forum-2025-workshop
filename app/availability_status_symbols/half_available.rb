# frozen_string_literal: true

require_relative 'base'

module AvailabilityStatusSymbols
  class HalfAvailable < Base
    def value
      '△'
    end

    def score
      0.5
    end
  end
end
