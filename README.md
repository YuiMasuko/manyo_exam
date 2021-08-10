## テーブルスキーマ

### tasksテーブル
*モデル名：Task*
| カラム名 | データ型 |
| -------- | -------- |
| title | string |
| content | string |
| priority | integer |
| limit | datetime |
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
| user_id | bigint |

### linksテーブル
*モデル名：Link*
| カラム名 | データ型 |
| -------- | -------- |
| task_id | bigint |
| label_id | bigint |
