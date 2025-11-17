class AvailabilityStatus
  AVAILABLE = '⚪︎'
  UNAVAILABLE = 'x'
  HALF_AVAILABLE = '△'

  SCORE_MAP = {
    AVAILABLE => 1,
    UNAVAILABLE => 0,
    HALF_AVAILABLE => 0.5
  }

  def initialize(value)
    @value = value
  end

  def score
    SCORE_MAP[@value] || 0
  end

  def to_s
    @value
  end
end
