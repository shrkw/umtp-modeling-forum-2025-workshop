module AvailabilityStatusSymbols
  class Base
    def value
      raise NotImplementedError
    end

    def score
      raise NotImplementedError
    end

    def to_s
      "#{value}: #{score}"
    end
  end
end
