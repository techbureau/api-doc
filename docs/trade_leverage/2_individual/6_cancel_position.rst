=============================
cancel_position
=============================


レバレッジ取引の注文の取消しを行います。

パラメータ
==============

.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型"
   :widths: 5, 5, 13, 5

   "type", "Yes", "marginまたはfutures", "str"
   "group_id", "Yes/No", "type=futuresの場合は必須", "int"
   "leverage_id", "Yes", "レバレッジ注文ID（get_positionsまたはactive_positionsで取得できます）", "int"


戻り値
==============
.. code-block:: python

    {
        'success': 1,
        'return': {
            'leverage_id': 2072,
            'refunded_jpy': 645.96,
            'funds': {
                'btc': 0.496,
                'jpy': 1564.96,
                'xem': 0.0,
                'mona': 10.0
            },
            'fee_spent': 0.0,
            'timestamp_closed': '1508384951',
            'swap': 0.0
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "leverage_id", "レバレッジID", "int"
   "fee_spent", "支払い手数料", "float"
   "timestamp_closed", "クローズ日時", "UNIX_TIMESTAMP"
   "price_avg", "建玉平均価格", "float"
   "amount_done", "建玉数", "float"
   "close_avg", "決済平均価格", "float"
   "close_done", "決済数", "float"
   "refunded_xxx", "実際に返却した額(xxxは通貨コード）", "float"
   "refunded_price_xxx", "実際に返却した額(xxxは通貨コード）", "float"
   "swap", "受け取ったスワップの額(AirFXのみ）", "float"
   "guard_fee", "追証ガード手数料(信用取引のみ)", "float"
   "funds", "残高", "dict"
