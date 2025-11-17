require_relative 'resolver'
require_relative 'availability'
require_relative 'availability_row'
require_relative 'date_slot'
require_relative 'availability_table'

def run_test_case(name, slots:, availabilities:, expected:, minimum_score_threshold: nil)
  resolver = Resolver.new(minimum_score_threshold: minimum_score_threshold)
  resolver.add_slots(slots)

  availabilities.each do |participant, availability_slots|
    resolver.register_availability(participant, availability_slots)
  end

  actual = resolver.finalize_date

  if actual == expected
    puts "[PASS] #{name}: #{actual}"
  else
    puts "[FAIL] #{name}: expected #{expected}, got #{actual.inspect}"
  end
end

run_test_case(
  '単純多数決',
  slots: ['2024-07-01', '2024-07-02', '2024-07-03'],
  availabilities: {
    'Alice' => [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']],
    'Bob' => [['2024-07-01', 'x'], ['2024-07-02', '⚪︎'], ['2024-07-03', '⚪︎']],
    'Charlie' => [['2024-07-01', '⚪︎'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']],
    'Dave' => [['2024-07-01', 'x'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']]
  },
  expected: '2024-07-03'
)

run_test_case(
  '閾値を下回ると再調整',
  slots: ['2024-07-01', '2024-07-02', '2024-07-03'],
  availabilities: {
    'Alice' => [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']],
    'Bob' => [['2024-07-01', 'x'], ['2024-07-02', '⚪︎'], ['2024-07-03', '⚪︎']],
    'Charlie' => [['2024-07-01', '⚪︎'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']],
    'Dave' => [['2024-07-01', 'x'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']]
  },
  minimum_score_threshold: 3,
  expected: '再調整'
)

run_test_case(
  '△のスコアが反映される',
  slots: ['2024-10-01', '2024-10-02'],
  availabilities: {
    'Alice' => [['2024-10-01', '⚪︎'], ['2024-10-02', '⚪︎']],
    'Bob' => [['2024-10-01', 'x'], ['2024-10-02', '△']],
    'Charlie' => [['2024-10-01', 'x'], ['2024-10-02', '△']]
  },
  expected: '2024-10-02'
)

run_test_case(
  '全員が初日を選択',
  slots: ['2024-08-01', '2024-08-02', '2024-08-03'],
  availabilities: {
    'Alice' => [['2024-08-01', '⚪︎'], ['2024-08-02', 'x'], ['2024-08-03', 'x']],
    'Bob' => [['2024-08-01', '⚪︎'], ['2024-08-02', '⚪︎'], ['2024-08-03', 'x']],
    'Charlie' => [['2024-08-01', '⚪︎'], ['2024-08-02', 'x'], ['2024-08-03', '⚪︎']]
  },
  expected: '2024-08-01'
)

run_test_case(
  '出欠が未登録',
  slots: ['2024-09-01', '2024-09-02'],
  availabilities: {},
  expected: nil
)
