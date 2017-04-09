=============================
currencies
=============================
通貨情報を取得します。

リクエスト
==============
/currencies/{currency}

パラメータ
==============
なし

戻り値
==============
currencyにallを指定した場合、有効な全ての通貨情報を取得します。

.. code-block:: python

    [
        {
            "name": "btc",
            "is_token": false
        },
        {
            "name": "XCP",
            "is_token": true
        },
        ...
    ]

currencyにbtc等、有効な通貨情報を指定した場合、その情報のみを取得します。

.. code-block:: python

    [
        {
            "name": "btc",
            "is_token": false
        }
    ]

.. csv-table::
   :header: "キー", "詳細", "型"

   "name", "通貨の名前", "string"
   "is_token", "token種別", "boolean"

補足
==============

token種別
--------------

| tokenの場合、true
