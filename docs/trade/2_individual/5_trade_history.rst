=============================
trade_history
=============================


ユーザー自身の取引履歴を取得します。

パラメータ
==============
.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 20, 10, 5

   "from", "No", "この順番のレコードから取得", "int", "0"
   "count", "No", "取得するレコード数", "int", "1000"
   "from_id", "No", "このトランザクションIDのレコードから取得", "int", "0"
   "end_id", "No", "このトランザクションIDのレコードまで取得", "int", "infinity"
   "order", "No", "ソート順", "ASC (昇順)もしくは DESC (降順)", "DESC"
   "since", "No", "開始タイムスタンプ", "UNIX_TIMESTAMP", "0"
   "end", "No", "終了タイムスタンプ", "UNIX_TIMESTAMP", "infinity"
   "currency_pair", "No", "通貨ペア。指定なしでbtc_jpy/mona_jpy/mona_btc/xem_jpy/xem_btc。eth_jpyやbch_jpyなどは指定の必要あり", "(例) btc_jpy", "指定なし"
   "is_token", "No", "【非推奨、削除予定】true：カウンターパーティトークンの情報を取得 false：カウンターパーティトークン以外の情報を取得", "bool", "false"


注意:
  | ・“since”もしくは”end”をセットした場合、”order”は強制的に”ASC”となります。
  | ・“from_id”もしくは”end_id”をセットした場合、”order”は強制的に”ASC”となります。
  | ・“currency_pair”と”is_token”の両方を指定した場合は”currency_pair”が優先されます。両方指定しない場合はカウンターパーティトークン以外の情報を取得します。


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "182": {
                "currency_pair": "btc_jpy",
                "action": "bid",
                "amount": 0.03,
                "price": 56000,
                "fee": 0,
                "your_action": "ask",
                "bonus": 1.6,
                "timestamp": 1402018713,
                "comment" : "demo"
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "currency_pair", "通貨ペア", "str"
   "action", "bid(買い) or ask(売り)", "str"
   "amount", "数量", "float"
   "price", "価格", "float"
   "fee", "手数料", "int"
   "your_action", "bidまたはask、自己取引の場合はbothとなります", "str"
   "bonus", "マイナス手数料分", "float"
   "timestamp", "取引日時", "UNIX_TIMESTAMP"
   "comment", "注文のコメント", "str"
