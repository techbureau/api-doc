=============================
deposit_history
=============================


入金履歴を取得します。


パラメータ
==============

.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型", "デフォルト"

   "currency", "Yes", "通貨。公開情報APIのcurrenciesで取得できるものが指定できます。", "例)jpy 等", "　"
   "from", "No", "この順番のレコードから取得", "numerical str", "0"
   "count", "No", "取得するレコード数", "numerical", "1000"
   "from_id", "No", "この出金IDのレコードから取得", "numerical", "0"
   "end_id", "No", "この出金IDのレコードまで取得", "numerical", "infinty"
   "order", "No", "ソート順", "ASC (昇順)もしくは DESC (降順)", "DESC"
   "since", "No", "開始タイムスタンプ", "UNIX time", "0"
   "end", "No", "終了タイムスタンプ", "UNIX time", "infinty"

注意: “since”もしくは”end”をセットした場合、”order”は強制的に”ASC”となります。

実行例
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "txid":,
            "funds": {
                "jpy": 15320,
                "btc": 1.392,
                "xem": 100.2,
                "mona": 2600
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "funds", "残高", "dict"
