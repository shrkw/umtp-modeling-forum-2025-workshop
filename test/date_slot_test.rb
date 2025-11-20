# frozen_string_literal: true

require_relative 'test_helper'
require 'date_slot'

class DateSlotTest < Minitest::Test
  def test_parses_string_and_formats_to_s
    slot = DateSlot.new('2024-07-15')

    assert_instance_of Date, slot.date
    assert_equal '2024-07-15', slot.to_s
  end
end
