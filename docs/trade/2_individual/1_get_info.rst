=============================
get_info
=============================


現在の残高（余力および残高・トークン）、APIキーの権限、過去のトレード数、アクティブな注文数、サーバーのタイムスタンプを取得します。

パラメータ
==============
なし

戻り値
==============
.. code-block:: python

    {
        "success":1,
        "return":{
            "funds":{
                "jpy":15320,
                "btc":1.389,
                "xem":100.2,
                "mona":2600,
                "kaori":0.1
            },
            "deposit":{
                "jpy":20440,
                "btc":1.479,
                "xem":100.2,
                "mona":3200,
                "kaori":0.1
            },
            "rights":{
                "info":1,
                "trade":1,
                "withdraw":0,
                "personal_info":0,
                "id_info":0,
            },
            "trade_count":18,
            "open_orders":3,
            "server_time":1401950833
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "funds", "残高", "dict"
   "deposit", "余力?", "dict"
   "rights", "APIキーの確認", "dict"
   "trade_count", "総トレード数", "int"
   "open_orders", "アクティブな注文", "int"
   "server_time", "サーバータイム", "int"
