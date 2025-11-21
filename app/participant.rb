# frozen_string_literal: true

require_relative 'role'

# イベント参加者を表すモデル
class Participant
  attr_reader :name, :role

  def initialize(name, role:)
    @name = name
    @role = role
  end

  def required?
    @role.required
  end

  def score_weight
    @role.score_weight
  end
end
