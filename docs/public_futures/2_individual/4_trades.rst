=============================
trades
=============================
全ての取引履歴を取得します。

リクエスト
==============
| /trades/{group_id}/{currency_pair}
| 例. https://api.zaif.jp/fapi/1/trades/1/btc_jpy

group_id,currency_pairに指定できる値は :ref:`public_futures-groups` を参照してください。


パラメータ
==============
なし


戻り値
==============
.. code-block:: python

    [
        {
            "date": 1491756592,
            "price": 135340.0,
            "amount": 0.02,
            "tid": 102659,
            "currency_pair": "btc_jpy",
            "trade_type": "ask"
        },
        {
            "date": 1491756591,
            "price": 135345.0,
            "amount": 0.01,
            "tid": 102658,
            "currency_pair": "btc_jpy",
            "trade_type": "bid"
        },
        ...
    ]


.. csv-table::
   :header: "キー", "詳細", "型"

   "date", "取引日時", "UNIX_TIMESTAMP"
   "price", "取引価格", "float"
   "amount", "取引量", "float"
   "tid", "取引ID", "int"
   "currency_pair", "通貨ペア", "str"
   "trade_type", "取引種別", "str"

補足
==============

取引種別
--------------

| bid：買い　ask：売り

