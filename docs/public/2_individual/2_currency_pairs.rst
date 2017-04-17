.. _public-currency-pairs:

=============================
currency_pairs
=============================
通貨ペア情報を取得します。

リクエスト
==============
/currency_pairs/{currency_pair}

パラメータ
==============
なし


戻り値
==============
currency_pairにallを指定した場合、有効な全ての通貨ペア情報を取得します。

.. code-block:: python

    [
        {
            "name": "BTC/JPY",
            "title": "BTC/JPY",
            "currency_pair": "btc_jpy",
            "description": "ビットコイン・日本円の取引を行うことができます",
            "is_token": false,
            "event_number": 0,
            "item_unit_min": 0.0001,
            "item_unit_step": 0.0001,
            "aux_unit_min": 5.0,
            "aux_unit_step": 5.0
        },
        {
            "name": "KINOKOUSAKA/JPY",
            "title": "KINOKOUSAKA/JPY 取引所 - ZAIF Exchange",
            "currency_pair": "kinokousaka_jpy",
            "description": "KINOKOUSAKA/JPY 取引所。KINOKOUSAKAと日本円の取引が行えます。",
            "is_token": true,
            "event_number": 1,
            "item_unit_min": 0.01,
            "item_unit_step": 0.01,
            "aux_unit_min": 0.01,
            "aux_unit_step": 0.01
        }
        ...
    ]

|
currency_pairにbtc_jpy等、有効な通貨ペア情報を指定した場合、その情報のみを取得します。

.. code-block:: python

    [
        {
            "name": "BTC/JPY",
            "title": "BTC/JPY",
            "currency_pair": "btc_jpy",
            "description": "ビットコイン・日本円の取引を行うことができます",
            "is_token": false,
            "event_number": 0,
            "item_unit_min": 0.0001,
            "item_unit_step": 0.0001,
            "aux_unit_min": 5.0,
            "aux_unit_step": 5.0
        }
    ]

.. csv-table::
   :header: "キー", "詳細", "型"

   "name", "通貨ペアの名前", "string"
   "title", "通貨ペアのタイトル", "string"
   "currency_pair", "通貨ペアのシステム文字列", "string"
   "description", "通貨ペアの詳細", "string"
   "is_token", "token種別", "boolean"
   "event_number", "イベントトークンの場合、0以外", "int"
   "item_unit_min", "アイテム通貨最小値", "float"
   "item_unit_step", "アイテム通貨入力単位", "float"
   "aux_unit_min", "相手通貨最小値", "float"
   "aux_unit_step", "相手通貨入力単位", "float"

補足
==============

token種別
--------------

| tokenの場合、true
