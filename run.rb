require_relative 'resolver'
require_relative 'availability'
require_relative 'availability_row'
require_relative 'date_slot'
require_relative 'availability_table'

resolver = Resolver.new
resolver.add_slots(['2024-07-01', '2024-07-02', '2024-07-03'])
resolver.register_availability('Alice', [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']])
resolver.register_availability('Bob', [['2024-07-01', 'x'], ['2024-07-02', '⚪︎'], ['2024-07-03', '⚪︎']])
resolver.register_availability('Charlie', [['2024-07-01', '⚪︎'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']])
resolver.register_availability('Dave', [['2024-07-01', 'x'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']])

# puts resolver
# puts resolver.slots
puts resolver.finalize_date
