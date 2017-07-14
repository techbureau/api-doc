=============================
ticker
=============================
ティッカーを取得します。

リクエスト
==============
| /ticker/{currency_pair}
| 例. https://api.zaif.jp/api/1/ticker/btc_jpy

currency_pairに指定できる値は :ref:`public-currency-pairs` を参照してください。


パラメータ
==============
なし

戻り値
==============
.. code-block:: python

    {
        "last": 135875.0,
        "high": 136000.0,
        "low": 131570.0,
        "vwap": 133301.7489,
        "volume": 6889.215,
        "bid": 135875.0,
        "ask": 135920.0
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "last", "終値", "float"
   "high", "過去24時間の高値", "float"
   "low", "過去24時間の安値", "float"
   "vwap", "過去24時間の加重平均", "float"
   "volume", "過去24時間の出来高", "float"
   "bid", "買気配値", "float"
   "ask", "売気配値", "float"

補足
==============

vwap算出方法
--------------

| 個々の取引価格*個々の取引量　→　A
| Aの過去24時間分を合算　→　B
| 過去24時間分の個々の取引量を合算　→　C
| B/C →　vwap
