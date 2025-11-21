# frozen_string_literal: true

require_relative 'base'

module Roles
  class Required < Base
    def initialize
      super(name: 'Required', required: true, score_weight: 2)
    end
  end
end
