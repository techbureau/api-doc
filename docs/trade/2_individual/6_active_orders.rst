=============================
actiuve_orders
=============================


現在有効な注文一覧を取得します（未約定注文一覧）。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型", "デフォルト"

   "currency_pair", "No", "取得する通貨ペア。
公開情報APIのcurrency_pairsで取得できるものが指定できます。
指定なしで全ての通貨ペアの情報を取得します。", "str(例 btc_jpy)", "全てのペア"
   "is_token", "No", "true：カウンターパーティトークンの情報を取得
false：カウンターパーティトークン以外の情報を取得", "bool", "	false"
   "is_token_both", "No", "true：全てのアクティブなオーダー情報を取得
false：currency_pairやis_tokenに従ったオーダー情報を取得", "bool", "false"

実行例
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "184": {
                "currency_pair": "btc_jpy",
                "action": "ask",
                "amount": 0.03,
                "price": 56000,
                "timestamp": 1402021125
            }
        }
    }

      is_token_bothがtrueの時は下記

    {
       "success": 1,
       "return": {
           "active_orders": {
               "184": {
                   "currency_pair": "btc_jpy",
                   "action": "ask",
                   "amount": 0.03,
                   "price": 56000,
                   "timestamp": 1402021125
               },
               "token_active_orders": {
                   "235": {
                       "currency_pair": "kaori_jpy",
                       "action": "ask",
                       "amount": 0.3,
                       "price": 10,
                       "timestamp": 1402064525
                   }
               }
           }
       }
    }
