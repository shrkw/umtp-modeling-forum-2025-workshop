# frozen_string_literal: true

# イベント参加者を表すモデル
class Participant
  attr_reader :name, :required

  def initialize(name, required: false)
    @name = name
    @required = required
  end

  def score_weight
    required ? 2 : 1
  end
end
