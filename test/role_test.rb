# frozen_string_literal: true

require_relative 'test_helper'
require 'role'

class RoleTest < Minitest::Test
  def test_optional_role_defaults
    role = Role.optional

    assert_equal 'Optional', role.name
    assert_equal false, role.required
    assert_equal 1, role.score_weight
  end

  def test_required_role_defaults
    role = Role.required

    assert_equal 'Required', role.name
    assert_equal true, role.required
    assert_equal 2, role.score_weight
  end
end
