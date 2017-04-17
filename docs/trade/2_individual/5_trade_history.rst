=============================
trade_history
=============================


ユーザー自身の取引履歴を取得します。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須", "詳細", "型", "デフォルト"
   :widths: 5, 5, 20, 10, 5

   "from", "No", "この順番のレコードから取得", "int", "0"
   "count", "No", "取得するレコード数", "int", "1000"
   "from_id", "No", "このトランザクションIDのレコードから取得", "int", "0"
   "end_id", "No", "このトランザクションIDのレコードまで取得", "int", "infinity"
   "order", "No", "ソート順", "ASC (昇順)もしくは DESC (降順)", "DESC"
   "since", "No", "開始タイムスタンプ", "UNIX time", "0"
   "end", "No", "終了タイムスタンプ", "UNIX time", "infinity"
   "currency_pair", "No", "通貨ペア。指定なしで全ての通貨ペア", "(例) btc_jpy", "全ペア"
   "is_token", "No", "true：カウンターパーティトークンの情報を取得 false：カウンターパーティトークン以外の情報を取得", "bool", "false"


注意:
  ・“since”もしくは”end”をセットした場合、”order”は強制的に”ASC”となります。
  ・“currency_pair”と”is_token”の両方を指定した場合は”currency_pair”が優先されます。両方指定しない場合はカウンターパーティトークン以外の情報を取得します。


戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "182": {
                "currency_pair": "btc_jpy",
                "action": "bid",
                "amount": 0.03,
                "price": 56000,
                "fee": 0,
                "your_action": "ask",
                "bonus": 1.6,
                "timestamp": 1402018713
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "currency_pair", "通貨ペア", "str"
   "action", "bid(買い) or ask(売り)", "str"
   "amount", "数量", "int"
   "price", "価格", "int"
   "fee", "手数料", "int"
   "your_action", "bid or ask", "str"
   "bounus", "マイナス手数料分", "int"
   "timestamp", "タイムスタンプ", "int"
