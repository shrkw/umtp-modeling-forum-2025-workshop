# frozen_string_literal: true

require_relative 'test_helper'
require 'participant'

class ParticipantTest < Minitest::Test
  def test_defaults_to_optional_participant
    participant = Participant.new('Bob')

    assert_equal 'Bob', participant.name
    assert_equal false, participant.required
  end

  def test_can_mark_participant_as_required
    participant = Participant.new('Alice', required: true)

    assert_equal 'Alice', participant.name
    assert_equal true, participant.required
  end
end
