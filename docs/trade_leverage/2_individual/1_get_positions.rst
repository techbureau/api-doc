=============================
get_positions
=============================


レバレッジ取引のユーザー自身の取引履歴を取得します。

パラメータ
==============
.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 20, 10, 5

   "type", "Yes", "marginまたはfutures", "str", ""
   "group_id", "Yes/No", "type=futuresの場合は必須", "int", ""
   "from", "No", "この順番のレコードから取得", "int", "0"
   "count", "No", "取得するレコード数", "int", "1000"
   "from_id", "No", "このトランザクションIDのレコードから取得", "int", "0"
   "end_id", "No", "このトランザクションIDのレコードまで取得", "int", "infinity"
   "order", "No", "ソート順", "ASC (昇順)もしくは DESC (降順)", "DESC"
   "since", "No", "開始タイムスタンプ", "UNIX_TIMESTAMP", "0"
   "end", "No", "終了タイムスタンプ", "UNIX_TIMESTAMP", "infinity"
   "currency_pair", "No", "通貨ペア。指定なしで全ての通貨ペア", "(例) btc_jpy", "全ペア"


注意:
  | ・“since”もしくは”end”をセットした場合、”order”は強制的に”ASC”となります。
  | ・“from_id”もしくは”end_id”をセットした場合、”order”は強制的に”ASC”となります。


戻り値
==============
.. code-block:: python

     {
        "success": 1,
        "return": {
            "182": {
                "group_id": 1,
                "currency_pair": "btc_jpy",
                "action": "bid",
                "leverage": 2.5,
                "price": 110005,
                "limit": 130000,
                "stop": 90000,
                "amount": 0.03,
                "fee_spent": 0,
                "timestamp": 1402018713,
                "term_end": 1404610713,
                "timestamp_closed": 1402019000,
                "deposit": 35.76 ,
                "deposit_jpy": 35.76,
                "refunded": 35.76 ,
                "refunded_jpy": 35.76,
                "swap": 0,
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "182(一例であり、レバレッジ注文idによって変わります)", "leverage_id(レバレッジ注文id)", "int"
   "group_id",  "グループID", "int"
   "currency_pair", "通貨ペア", "str"
   "action", "bid(買い) or ask(売り)", "str"
   "amount", "数量", "float"
   "price", "価格", "float"
   "limit", "リミット価格", "float"
   "stop",  "ストップ価格", "float"
   "timestamp", "発注日時", "UNIX_TIMESTAMP"
   "term_end", "注文の有効期限", "UNIX_TIMESTAMP"
   "leverage",  "レバレッジ","float"
   "fee_spent", "支払い手数料","float"
   "timestamp_closed", "クローズ日時", "UNIX_TIMESTAMP"
   "price_avg", "建玉平均価格","float"
   "amount_done", "建玉数","float"
   "close_avg", "決済平均価格","float"
   "close_done", "決済数","float"
   "deposit_xxx", "実際にデポジットした額(xxxは通貨コード）","float"
   "deposit_price_xxx", "デポジット時計算レート(xxxは通貨コード）","float"
   "refunded_xxx", "実際に返却した額(xxxは通貨コード）","float"
   "refunded_price_xxx", "実際に返却した額(xxxは通貨コード）","float"
   "swap", "受け取ったスワップの額(AirFXのみ）","float"
   "guard_fee", "追証ガード手数料(信用取引のみ)","float"
