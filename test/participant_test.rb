# frozen_string_literal: true

require_relative 'test_helper'
require 'participant'

class ParticipantTest < Minitest::Test
  def test_accepts_optional_participant
    participant = Participant.new('Bob', role: Role.optional)

    assert_equal 'Bob', participant.name
    assert_equal false, participant.required?
    assert_equal Role.optional, participant.role
    assert_equal 1, participant.score_weight
  end

  def test_can_mark_participant_as_required
    participant = Participant.new('Alice', role: Role.required)

    assert_equal 'Alice', participant.name
    assert_equal true, participant.required?
    assert_equal Role.required, participant.role
    assert_equal 2, participant.score_weight
  end
end
