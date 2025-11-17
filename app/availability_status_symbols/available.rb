# frozen_string_literal: true

require_relative 'base'

module AvailabilityStatusSymbols
  class Available < Base
    def value
      '⚪︎'
    end

    def score
      1
    end
  end
end
