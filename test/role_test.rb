# frozen_string_literal: true

require_relative 'test_helper'
require 'roles/optional'
require 'roles/required'

class RolesTest < Minitest::Test
  def test_optional_role_defaults
    role = Roles::Optional.new

    assert_equal 'Optional', role.name
    refute role.required
    assert_equal 1, role.score_weight
  end

  def test_required_role_defaults
    role = Roles::Required.new

    assert_equal 'Required', role.name
    assert role.required
    assert_equal 2, role.score_weight
  end
end
