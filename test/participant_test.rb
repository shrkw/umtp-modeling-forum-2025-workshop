# frozen_string_literal: true

require_relative 'test_helper'
require 'participant'

class ParticipantTest < Minitest::Test
  def test_accepts_optional_participant
    optional_role = Roles::Optional.new
    participant = Participant.new('Bob', role: optional_role)

    assert_equal 'Bob', participant.name
    refute_predicate participant, :required?
    assert_equal optional_role, participant.role
    assert_equal 1, participant.score_weight
  end

  def test_can_mark_participant_as_required
    required_role = Roles::Required.new
    participant = Participant.new('Alice', role: required_role)

    assert_equal 'Alice', participant.name
    assert_predicate participant, :required?
    assert_equal required_role, participant.role
    assert_equal 2, participant.score_weight
  end
end
