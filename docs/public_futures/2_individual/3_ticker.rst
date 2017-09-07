=============================
ticker
=============================
ティッカーを取得します。

リクエスト
==============
| /ticker/{group_id}/{currency_pair}
| 例. https://api.zaif.jp/fapi/1/ticker/1/btc_jpy

group_id,currency_pairに指定できる値は :ref:`public_futures-groups` を参照してください。


パラメータ
==============
なし

戻り値
==============
.. code-block:: python

   {
      "last": 112155.0,
      "high": 117000.0,
      "low": 112155.0,
      "vwap": 115847.1429,
      "volume": 150.0007,
      "bid": 116995.0,
      "ask": 117000.0
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
