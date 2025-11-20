# frozen_string_literal: true

require_relative 'role'

# イベント参加者を表すモデル
class Participant
  attr_reader :name, :role

  def initialize(name, required: false)
    @name = name
    @role = determine_role(required)
  end

  def required?
    @role.required
  end

  def score_weight
    @role.score_weight
  end

  private

  def determine_role(required_flag)
    return Role.required if required_flag == true

    Role.optional
  end
end
