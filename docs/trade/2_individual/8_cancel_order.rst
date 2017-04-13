=============================
cancel_order 注文をキャンセル
=============================


注文の取消

パラメータ
==============

.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型"

   "order_id", "Yes", "注文ID（tradeまたはactive_ordersで取得できます）", "-"
   "is_token", "No", "	true：カウンターパーティトークンのオーダーを取り消したい時 false：カウンターパーティトークン以外のオーダーを取り消したい時", "false"


実行例
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
