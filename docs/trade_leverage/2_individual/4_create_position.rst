=============================
create_position
=============================


レバレッジ取引の注文を行います。

パラメータ
==============

.. csv-table::
   :header: "パラメータ", "必須", "詳細", "型"
   :widths: 5, 5, 10, 10

   "type", "Yes", "marginまたはfutures", "str"
   "group_id", "Yes/No", "type=futuresの場合は必須", "int"
   "currency_pair", "Yes", "(例) btc_jpy", "str(例 btc_jpy)"
   "action", "Yes", "注文の種類", "bid もしくは ask"
   "price", "Yes", "指値注文価格", "numerical"
   "amount", "Yes", "数量(例: 0.3)", "numerical"
   "leverage", "Yes", "レバレッジ(小数点第2位まで有効）", "numerical"
   "limit", "No", "リミット注文価格", "numerical"
   "stop", "No", "ストップ注文価格", "numerical"


| **パラメータ limitについて**
| limitを指定しなかった場合設定済みのリミット注文は取り消されます。継続してリミット注文を出し続けたい場合は毎回セットしてください。
| 設定済みのリミット注文を削除したい場合はlimitパラメータをセットせずAPIを実行してください。
| リミット値（利確のための反対売買の指値）を指定することができます
| リミット値を指定した場合、注文が成立した分だけの数量について、自動的にリミット注文が発行されます

| **パラメータ stopについて**
| stopを指定しなかった場合設定済みのストップ注文は取り消されます。継続してストップ注文を出し続けたい場合は毎回必ずセットしてください。
| 設定済みのストップ値を削除したい場合はstopパラメータをセットせずAPIを実行してください。
| ストップ値（利確のための反対売買の指値）を指定することができます
| ストップ値を指定した場合、設定価格まで下落（あるいは上昇）した場合に成行にて決済を試みます。
| 成行注文のため必ずしも設定価格で決済されることを保証する物ではございません。

| **価格および数量の数値について**
| 下記の単位以外で注文しようとした場合、invalid price parameterまたはinvalid amount parameterというエラーが返されます

  ・価格（priceおよびlimit）
        | btc_jpy : 5円単位
  ・数量（amount）
        | btc_jpy : 0.0001BTC単位



戻り値
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "leverage_id": 22258,
            "timestamp": 1504253833,
            "term_end": 1506845833,
            "price_avg": 118000,
            "amount_done": 0.0001,
            "deposit_jpy": 11.92,
            "funds": {
                "jpy": 325,
                "btc": 1.392,
                "mona": 2600
            }
        }
    }


.. csv-table::
   :header: "キー", "詳細", "型"

   "leverage_id", "レバレッジID。", "int"
   "timestamp", "注文日時", "UNIX_TIMESTAMP"
   "term_end", "注文の有効期限", "UNIX_TIMESTAMP"
   "price_avg", "平均建玉価格", "float"
   "amount_done", "建玉数", "float"
   "deposit_xxx", "実際にデポジットした額(xxxは通貨コード）","float"
   "deposit_price_xxx", "デポジット時計算レート(xxxは通貨コード）","float"
   "funds", "残高", "dict"
