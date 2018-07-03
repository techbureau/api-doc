=============================
trade
=============================


取引注文を行います。

パラメータ
==============

.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型"
   :widths: 5, 5, 10, 10

   "currency_pair", "Yes", "(例) btc_jpy", "str(例 btc_jpy)"
   "action", "Yes", "注文の種類", "bid もしくは ask"
   "price", "Yes", "指値注文価格", "numerical"
   "amount", "Yes", "数量(例: 0.3)", "numerical"
   "limit", "No", "リミット注文価格", "numerical"
   "comment", "No", "コメントの追加", "str"

| **パラメータ limitについて**
| リミット値（利確のための反対売買の指値）を指定することができます
| リミット値を指定した場合、注文が成立した分だけの数量について、自動的にリミット注文が発行されます

| **パラメータ commentについて**
| コメントは255字以内で半角英数字記号のみに対応しています
| また、スラッシュは使えませんでご注意ください
| コメントをつけた取引注文が約定した場合、該当する取引履歴にそのコメントが付与されます
| 取引注文の管理にご利用ください

| **価格および数量の数値について**
| 下記の単位以外で注文しようとした場合、invalid price parameterまたはinvalid amount parameterというエラーが返されます
| 価格（priceおよびlimit）、もしくは数量(amount)が適切でない場合があります
| 適切な価格や数量は公開APIのcurrency_pairs :doc:`public/2_individual/2_currency_pairs` で取得できます
| 通貨ペアごとに適切な価格や数量の最低量や単位は変わりますので、ご注意ください


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
