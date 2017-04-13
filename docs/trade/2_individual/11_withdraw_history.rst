=============================
withdraw_history
=============================


出金履歴を取得します。


パラメータ
==============

.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型", "デフォルト"

   "currency", "Yes", "通貨。公開情報APIのcurrenciesで取得できるものが指定できます。", "例)jpy 等", "-"
   "from", "No", "この順番のレコードから取得", "numerical str", "0"
   "count", "No", "取得するレコード数", "	numerical", "1000"
   "from_id", "No", "この出金IDのレコードから取得", "numerical", "0"
   "end_id", "No", "この出金IDのレコードまで取得", "numerical", "infinty"
   "order", "No", "ソート順	", "	ASC (昇順)もしくは DESC (降順)", "DESC"
   "since", "No", "開始タイムスタンプ", "UNIX time", "0"
   "end", "No", "終了タイムスタンプ", "UNIX time", "infinty"

注意: “since”もしくは”end”をセットした場合、”order”は強制的に”ASC”となります。

実行例
==============
.. code-block:: python
    {
        "success":1,
        "return":{
            "3816":{
              "timestamp":1435745065,
              "address":"12qwQ3sPJJAosodSUhSpMds4WfUPBeFEM2",
              "amount":0.001,
              "txid":"64dcf59523379ba282ae8cd61d2e9382c7849afe3a3802c0abb08a60067a159f",
            },
            "3814":{
              "timestamp":1435548083,
              "address":"12qwQ3sPJJAosodSUhSpMds4WfUPBeFEM2",
              "amount":0.001,
              "txid":"7d012cfff6e67a8938f93215367eef4177604459631ea62c85550980dca71819"
            },
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "timestamp", "", "int"
   "address", "出金先アドレス", "str"
   "amount", "取引量", "int"
   "txid", "トランザクションid", "str"
