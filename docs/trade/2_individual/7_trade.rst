=============================
trade
=============================


取引注文を行います。

パラメータ
==============

.. csv-table::
   :header: "パラメーター", "必須", "詳細", "型"
   :widths: 5, 5, 10, 10

   "currency_pair", "Yes", "(例) btc_jpy", "str(例 btc_jpy)"
   "action", "Yes", "注文の種類", "bid もしくは ask"
   "price", "Yes", "指値注文価格", "numerical"
   "amount", "Yes", "数量(例: 0.3)", "numerical"
   "limit", "No", "リミット注文価格", "numerical"


価格および数量の数値について
下記の単位以外で注文しようとした場合、invalid price parameterまたはinvalid amount parameterというエラーが返されます

  ・価格（priceおよびlimit）
        | btc_jpy : 5円単位
        | mona_jpy : 0.1円単位
        | mona_btc : 0.00000001BTC単位
  ・数量（amount）
        | btc_jpy : 0.0001BTC単位
        | mona_jpy : 1MONA単位
        | mona_btc : 1MONA単位

指定できる単位等、詳細な情報は公開API情報APIのcurrency_pairsで取得できます


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "received": 0.1,
            "remains": 0,
            "order_id": 0,
            "funds": {
                "jpy": 325,
                "btc": 1.392,
                "mona": 2600
            }
        }
    }


.. csv-table::
   :header: "キー", "詳細", "型"

   "received", "今回の注文で約定した取引量", "float"
   "remains", "今回の注文で約定せず、板に残った取引量", "float"
   "order_id", "今回の注文がすべて成立した場合は0、一部、もしくはすべて約定しなかった場合は板に残った注文のID。", "int"
   "funds", "残高", "dict"
