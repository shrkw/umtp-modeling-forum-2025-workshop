# 日程調整ソフトウェア

候補日
参加者
出欠登録
確定した日付

```ruby
resolver = Resolver.new(minimum_score_threshold: 2)
resolver.add_slots(['2024-07-01', '2024-07-02', '2024-07-03'])
resolver.register_availability('Alice', [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']])
resolver.register_availability('Bob', [['2024-07-01', 'x'], ['2024-07-02', '⚪︎'], ['2024-07-03', '⚪︎']])
resolver.register_availability('Charlie', [['2024-07-01', '⚪︎'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']])

resolver.finalize_date
# => '2024-07-03'
```

閾値 (`minimum_score_threshold`) を設定すると、最高スコアがその値以下のときは `'再調整'` が返り、参加者の再調整が必要であることを示します。閾値を省略すれば従来どおりに最もスコアが高い日付を返します。
