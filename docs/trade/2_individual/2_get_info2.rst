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
        "return": {
            "deposit": {
                "btc": 1.479,
                "jpy": 20440,
                "kaori": 0.1,
                "mona": 3200,
                "xem": 100.2
            },
            "funds": {
                "btc": 1.389,
                "jpy": 15320,
                "kaori": 0.1,
                "mona": 2600,
                "xem": 100.2
            },
            "open_orders": 3,
            "rights": {
                "info": 1,
                "personal_info": 0,
                "trade": 1,
                "withdraw": 0
            },
            "server_time": 1401950833
        },
        "success": 1
    }
