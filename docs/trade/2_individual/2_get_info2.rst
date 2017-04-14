=============================
get_info2
=============================


get_infoの軽量版で、過去のトレード数を除く項目を返します。

パラメータ
==============
なし

戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "funds": {
                "jpy": 15320,
                "btc": 1.389,
                "xem": 100.2,
                "mona": 2600,
                "kaori": 0.1
            },
            "deposit": {
                "jpy": 20440,
                "btc": 1.479,
                "xem": 100.2,
                "mona": 3200,
                "kaori": 0.1
            },
            "rights": {
                "info": 1,
                "trade": 1,
                "withdraw": 0,
                "personal_info": 0
            },
            "open_orders": 3,
            "server_time": 1401950833
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "funds", "残高", "dict"
   "deposit", "入金額", "dict"
   "rights", "APIキー", "dict"
   "open_orders", "アクティブな注文数", "int"
   "server_time", "サーバータイム", "int"
