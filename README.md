# 日程調整ソフトウェア

候補日と参加者ごとの出欠を登録し、最も参加しやすい日付を探す小さな Ruby プロジェクトです。

## 使い方

```ruby
resolver = Resolver.new(minimum_score_threshold: 2.5)
resolver.add_slots(['2024-07-01', '2024-07-02', '2024-07-03'])
resolver.register_availability('Alice', [['2024-07-01', '⚪︎'], ['2024-07-02', '⚪︎'], ['2024-07-03', 'x']])
resolver.register_availability('Bob', [['2024-07-01', 'x'], ['2024-07-02', '⚪︎'], ['2024-07-03', '⚪︎']])
resolver.register_availability('Charlie', [['2024-07-01', '⚪︎'], ['2024-07-02', 'x'], ['2024-07-03', '⚪︎']])

resolver.finalize_date
# => '2024-07-03'
```

- `minimum_score_threshold` を設定すると、最高スコアがその値以下の場合は `'再調整'` が返り、日程の再調整が必要であることを示します。
- 閾値を省略するとこれまでどおり最もスコアが高い日付を返します。

## ステータスとスコア

| 記号 | 意味             | スコア |
| ---- | ---------------- | ------ |
| ⚪︎   | 参加できる       | 1.0    |
| △    | 条件付きで参加可 | 0.5    |
| x    | 参加できない     | 0.0    |

各日付行は参加者のスコアを合計し、最も高いスコアを持つ日付が候補になります。

## テスト実行

依存関係を入れて `bundle exec rake test` を実行すると、`test/**/*_test.rb` にある Minitest が一括で走ります。

```bash
bundle install
bundle exec rake test
# => 各テストファイルが実行され、統計が表示されます
```
