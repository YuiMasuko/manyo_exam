## テーブルスキーマ

### tasksテーブル
*モデル名：Task*
| カラム名 | データ型 |
| -------- | -------- |
| title | string |
| content | string |
| priority | integer |
| expired_at | datetime |
| status | integer |
| user_id | bigint |

### usersテーブル
*モデル名：User*
| カラム名 | データ型 |
| -------- | -------- |
| name | string |
| email | string |
| password_digest | string |

### labelsテーブル
*モデル名：Label*
| カラム名 | データ型 |
| -------- | -------- |
| name | string |

### labelingsテーブル
*モデル名：Labeling*
| カラム名 | データ型 |
| -------- | -------- |
| task_id | bigint |
| label_id | bigint |


## Herokuへのデプロイ手順

1. Heroku CLIのインストール
```
brew tap heroku/brew && brew install heroku
```

2. Herokuにログイン
```
heroku login
```

3. ~/workspace/○○_appに位置していることを確認

4. Herokuに新しいアプリケーションを作成
(heroku-20では、Ruby2.6.5がサポートの対象外なのでheroku-18で)
```
$ heroku create --remote heroku-18 --stack heroku-18
```

5. アセットプリコンパイル
```
$ rails assets:precompile RAILS_ENV=production
```

6. コミット
```
$ git add -A
$ git commit -m "＊＊＊"
```

7. Heroku buildpackを追加
```
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
```

8. Herokuにデプロイ
```
$ git push heroku-18 master
（ブランチをheroku masterにデプロイする場合）
$ git push heroku-18 ブランチ名:master
```

9. データベースの移行
```
$ heroku run rails db:migrate
```
