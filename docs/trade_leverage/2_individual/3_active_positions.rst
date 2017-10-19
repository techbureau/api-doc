=============================
active_positions
=============================


レバレッジ取引の現在有効な注文一覧を取得します（未約定注文一覧）。

パラメータ
==============
.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 20, 10, 5

      "type", "Yes", "marginまたはfutures", "str", ""
      "group_id", "Yes/No", "type=futuresの場合は必須", "int", ""
      "currency_pair", "No", "通貨ペア。指定なしで全ての通貨ペア", "(例) btc_jpy", "全ペア"


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "184": {
                "group_id": "1",
                "currency_pair": "btc_jpy",
                "action": "ask",
                "amount": 0.0001,
                "price": 450000,
                "timestamp": 1402021125,
                "term_end": 1404613125,
                "leverage": 1,
                "fee_spent": 0.0015,
                "price_avg": 450000,
                "amount_done": 0.0001,
                "deposit_jpy": 48.72
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "184(一例であり、レバレッジ注文idによって変わります)", "leverage_id(レバレッジ注文id)", "int"
   "group_id",  "グループID", "int"
   "currency_pair", "通貨ペア", "str"
   "action", "bid(買い) or ask(売り)", "str"
   "amount", "数量", "float"
   "price", "価格", "float"
   "limit", "リミット価格", "float"
   "stop",  "ストップ格", "float"
   "timestamp", "発注日時", "UNIX_TIMESTAMP"
   "term_end", "注文の有効期限", "UNIX_TIMESTAMP"
   "leverage",  "レバレッジ","float"
   "fee_spent", "支払い手数料","float"
   "price_avg", "建玉平均価格","float"
   "amount_done", "建玉数","float"
   "close_avg", "決済平均価格","float"
   "close_done", "決済数","float"
   "deposit_xxx", "実際にデポジットした額(xxxは通貨コード）","float"
   "deposit_price_xxx", "デポジット時計算レート(xxxは通貨コード）","float"
   "swap", "受け取ったスワップの額(AirFXのみ）","float"
