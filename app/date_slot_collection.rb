# frozen_string_literal: true

class DateSlotCollection
  def initialize(string_date_slots)
    @string_date_slots = string_date_slots
    @slots = string_date_slots.map { |slot_string| DateSlot.new(slot_string) }
  end

  def include?(string_date)
    @string_date_slots.include?(string_date)
  end
end
