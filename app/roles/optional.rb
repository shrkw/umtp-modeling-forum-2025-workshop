# frozen_string_literal: true

require_relative 'base'

module Roles
  class Optional < Base
    def initialize
      super(name: 'Optional', required: false, score_weight: 1)
    end
  end
end
