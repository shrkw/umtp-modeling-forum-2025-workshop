# frozen_string_literal: true

module Roles
  class Base
    attr_reader :name, :required, :score_weight

    def initialize(name:, required:, score_weight:)
      @name = name
      @required = required
      @score_weight = score_weight
    end

    def ==(other)
      other.instance_of?(self.class) &&
        other.name == name &&
        other.required == required &&
        other.score_weight == score_weight
    end
  end
end
