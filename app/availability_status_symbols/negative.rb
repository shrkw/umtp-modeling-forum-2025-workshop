# frozen_string_literal: true

module AvailabilityStatusSymbols
  class Negative < Base
    def value
      'u_u'
    end

    def score
      -1
    end
  end
end
