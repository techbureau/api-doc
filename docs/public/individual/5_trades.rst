=============================
trades
=============================
全ての取引履歴を取得します。

リクエスト
==============
/trades/{currency_pair}

currency_pairに指定できる値は :ref:`public-currency-pairs` を参照してください。


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
            "tid": 43054307,
            "currency_pair": "btc_jpy",
            "trade_type": "ask"
        },
        {
            "date": 1491756591,
            "price": 135345.0,
            "amount": 0.01,
            "tid": 43054306,
            "currency_pair": "btc_jpy",
            "trade_type": "bid"
        },
        ...
    ]


.. csv-table::
   :header: "キー", "詳細", "型"

   "date", "取引日時(エポックタイム)", "int"
   "price", "取引価格", "float"
   "amount", "取引量", "float"
   "tid", "取引ID", "int"
   "currency_pair", "通貨ペア", "string"
   "trade_type", "取引種別", "string"

補足
==============

取引種別
--------------

| bid：買い　ask：売り

