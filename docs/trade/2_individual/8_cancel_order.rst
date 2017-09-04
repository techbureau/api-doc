=============================
cancel_order
=============================


注文の取消しを行います。

パラメータ
==============

.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 13, 5

   "order_id", "Yes", "注文ID（tradeまたはactive_ordersで取得できます）", "int", " "
   "currency_pair", "No", "通貨ペア。", "(例) btc_jpy", " "
   "is_token", "No", "【非推奨、削除予定】true：カウンターパーティトークンのオーダーを取り消したい時　false：カウンターパーティトークン以外のオーダーを取り消したい時", "false"

注意:
  | ・“currency_pair”と”is_token”の両方を指定した場合は”currency_pair”が優先されます。両方指定しない場合はカウンターパーティトークン以外の情報を操作します。


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "order_id": 184,
            "funds": {
                "jpy": 15320,
                "btc": 1.392,
                "mona": 2600,
                "kaori": 0.1
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "order_id", "注文id", "int"
   "funds", "残高", "dict"
