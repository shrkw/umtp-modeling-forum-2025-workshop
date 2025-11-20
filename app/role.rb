# frozen_string_literal: true

# 参加者の役割とスコア重みを表すモデル
class Role
  attr_reader :name, :required, :score_weight

  def initialize(name:, required:, score_weight:)
    @name = name
    @required = required
    @score_weight = score_weight
  end

  def self.optional
    @optional ||= new(name: 'Optional', required: false, score_weight: 1)
  end

  def self.required
    @required ||= new(name: 'Required', required: true, score_weight: 2)
  end
end
