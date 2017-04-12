=============================
trade_history
=============================


ユーザー自身の取引履歴を取得します。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型", "デフォルト"

   "from", "No", "この順番のレコードから取得", "dict", "dict"
   "count", "No", "取得するレコード数", "dict", "dict"
   "from_id", "No", "このトランザクションIDのレコードから取得", "dict", "dict"
   "end_id", "No", "このトランザクションIDのレコードまで取得", "dict", "dict"
   "order", "No", "ソート順", "dict", "dict"
   "since", "No", "開始タイムスタンプ", "dict", "dict"
   "end", "No", "終了タイムスタンプ", "dict", "dict"
   "currency_pair", "No", "通貨ペア。指定なしで全ての通貨ペア", "dict", "dict"
   "is_token", "No", "true：カウンターパーティトークンの情報を取得"
                      "false：カウンターパーティトークン以外の情報を取得", "dict", "dict"
