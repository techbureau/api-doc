=============================
position_history
=============================


レバレッジ取引のユーザー自身の取引履歴の明細を取得します。

パラメータ
==============
.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 20, 10, 5

   "type", "Yes", "marginまたはfutures", "str", ""
   "group_id", "Yes/No", "type=futuresの場合は必須", "int", ""
   "leverage_id", "Yes", "レバレッジ注文ID（get_positionsまたはactive_positionsで取得できます）", "int", "　"


注意:
  | ・typeとgroup_idの詳細は共通情報をご参照ください。


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "182": {
                "group_id": 1,
                "currency_pair": "btc_jpy",
                "action": "bid",
                "amount": 0.0001,
                "price": 499000
                "timestamp": 1504251232
                "your_action": "bid",
                "bid_leverage_id": 182,
            },
            "183": {
                "group_id": 1,
                "currency_pair": "btc_jpy",
                "action": "ask",
                "amount": 0.0001,
                "price": 450000
                "timestamp": 1504251267
                "your_action": "ask",
                "ask_leverage_id": 182,
            },

        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "group_id",  "グループID", "int"
   "currency_pair", "通貨ペア", "str"
   "action", "bid(買い) or ask(売り)", "str"
   "amount", "数量", "float"
   "price", "価格", "float"
   "timestamp", "発注日時", "UNIX_TIMESTAMP"
   "your_action", "bidまたはask、自己取引の場合はbothとなります", "str"
   "bid_leverage_id", "買いレバレッジID(自分の注文の場合のみ)", "int"
   "ask_leverage_id", "売りレバレッジID(自分の注文の場合のみ)", "int"
