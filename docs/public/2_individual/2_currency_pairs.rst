.. _public-currency-pairs:

=============================
currency_pairs
=============================
通貨ペア情報を取得します。

リクエスト
==============
| /currency_pairs/{currency_pair}
| 例. https://api.zaif.jp/api/1/currency_pairs/btc_jpy

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
            "description": "\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3\u30fb\u65e5\u672c\u5186\u306e\u53d6\u5f15\u3092\u884c\u3046\u3053\u3068\u304c\u3067\u304d\u307e\u3059",
            "is_token": false,
            "event_number": 0,
            "item_unit_min": 0.0001,
            "item_unit_step": 0.0001,
            "aux_unit_min": 5.0,
            "aux_unit_step": 5.0,
            "seq": 0,
            "aux_japanese": "\u65e5\u672c\u5186",
            "item_japanese": "\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3",
            "aux_unit_point": 0,
        },
        {
            "name": "KINOKOUSAKA/JPY",
            "title": "KINOKOUSAKA/JPY \u53d6\u5f15\u6240 - ZAIF Exchange",
            "currency_pair": "kinokousaka_jpy",
            "description": "KINOKOUSAKA/JPY \u53d6\u5f15\u6240\u3002KINOKOUSAKA\u3068\u65e5\u672c\u5186\u306e\u53d6\u5f15\u304c\u884c\u3048\u307e\u3059\u3002",
            "is_token": true,
            "event_number": 1,
            "item_unit_min": 0.01,
            "item_unit_step": 0.01,
            "aux_unit_min": 0.01,
            "aux_unit_step": 0.01,
            "seq": 134,
            "aux_japanese": "\u65e5\u672c\u5186",
            "item_japanese": "KINOKOUSAKA",
            "aux_unit_point": 2,
        }
        ...
    ]


currency_pairにbtc_jpy等、有効な通貨ペア情報を指定した場合、その情報のみを取得します。

.. code-block:: python

    [
        {
            "name": "BTC/JPY",
            "title": "BTC/JPY",
            "currency_pair": "btc_jpy",
            "description": "\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3\u30fb\u65e5\u672c\u5186\u306e\u53d6\u5f15\u3092\u884c\u3046\u3053\u3068\u304c\u3067\u304d\u307e\u3059",
            "is_token": false,
            "event_number": 0,
            "item_unit_min": 0.0001,
            "item_unit_step": 0.0001,
            "aux_unit_min": 5.0,
            "aux_unit_step": 5.0,
            "seq": 0,
            "aux_japanese": "\u65e5\u672c\u5186",
            "item_japanese": "\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3",
            "aux_unit_point": 0,
        }
    ]

.. csv-table::
   :header: "キー", "詳細", "型"

   "name", "通貨ペアの名前", "str"
   "title", "通貨ペアのタイトル", "str"
   "currency_pair", "通貨ペアのシステム文字列", "str"
   "description", "通貨ペアの詳細", "str"
   "is_token", "token種別", "boolean"
   "event_number", "イベントトークンの場合、0以外", "int"
   "seq", "通貨シークエンス", "int"
   "item_unit_min", "アイテム通貨最小値", "float"
   "item_unit_step", "アイテム通貨入力単位", "float"
   "item_japanese", "アイテム通貨 日本語表記", "str"
   "aux_unit_min", "相手通貨最小値", "float"
   "aux_unit_step", "相手通貨入力単位", "float"
   "aux_unit_point", "相手通貨小数点", "int"
   "aux_japanese", "相手通貨 日本語表記", "str"

補足
==============

token種別
--------------

| tokenの場合、true
