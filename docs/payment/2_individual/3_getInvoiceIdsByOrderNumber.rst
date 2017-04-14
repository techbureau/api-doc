=============================
getInvoiceIdsByOrderNumber
=============================

* インボイスの検索
注文番号でインボイスを検索し、インボイスIDを返します。
インボイスの詳細についてはインボイス情報の取得メソッドを使用してください。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須項目", "詳細", "型", "値または例"

   "method", "Yes", "メソッド名", "str", "getInvoice"
   "key", "Yes", "APIキー", "str", "　"
   "md5secret", "Yes(1)", "APIシークレットのmd5。(1)md5またはsha1のどちらかをセット", "str", "　"
   "sha1secret", "Yes(1)", "APIシークレットのsha1。(1)md5またはsha1のどちらかをセット", "str", "　"
   "nonce", "Yes", "1以上の数、呼び出し毎に増分して送信してください", "int", "　"
   "orderNumber", "Yes", "注文番号", "str", "　"


戻り値
==============
* 成功例
.. code-block:: python

    {
        "success": 1,
        "return": {
            "invoideIds": [
                "d0e521f5-287a-4d24-95d2-ec83a00ce173",
                "9e6fdfd8-165a-11e5-998f-4437e6999eec"
            ],
            "counts": 2
        }
    }

* 成功例（検索結果なし）
.. code-block:: python

    {
        "success": 1,
        "return": {
            "invoideIds": null,
            "counts": 0
        }
    }

* returnパラメーター

.. csv-table::
    :header: "キー", "詳細", "型", "値または例"

    "invoiceIdｓ", "検索結果", "dict", "　"
    "counts", "検索結果の件数", "str", "　"
