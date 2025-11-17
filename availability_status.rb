class AvailabilityStatus
  AVAILABLE = '⚪︎'
  UNAVAILABLE = 'x'

  SCORE_MAP = {
    AVAILABLE => 1,
    UNAVAILABLE => 0
  }

  def initialize(value)
    @value = value
  end

  def score
    SCORE_MAP[@value] || 0
  end
end
