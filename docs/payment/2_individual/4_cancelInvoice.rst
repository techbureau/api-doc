=============================
cancelInvoice
=============================

* インボイスのキャンセル
作成したインボイスを取消します。
支払が完了していたり既に有効期限が切れている場合はエラーとなります。
部分的に入金されていた場合は、過払いとして処理されます。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須", "詳細", "型", "値または例"

   "method", "Yes", "メソッド名", "str", "getInvoice"
   "key", "Yes", "APIキー", "str", "　"
   "md5secret", "Yes(1)", "APIシークレットのmd5。(1)md5またはsha1のどちらかをセット", "str", "　"
   "sha1secret", "Yes(1)", "APIシークレットのsha1。(1)md5またはsha1のどちらかをセット", "str", "　"
   "nonce", "Yes", "1以上の数、呼び出し毎に増分して送信してください", "int", "　"
   "invoiceId", "Yes", "キャンセルしたいinvoiceId	", "str", "　"


戻り値
==============
* returnパラメーター

.. csv-table::
    :header: "キー", "詳細", "型", "値または例"

    "invoiceId", "作成したインボイスを識別するためのID", "str", "04e42516-1652-11e5-9eb4-4437e6999eec"
    "created", "インボイス作成日時。unixtime", "int", "　"
    "expired", "インボイスの有効期限。unixtime", "int", "　"
    "status", "インボイスの状態", "str", "canceled"
    "settled", "決済完了日時。unixtime", "int", "　"
    "amount", "決済対象金額（送信された金額）", "int", "　"
    "currency", "決済対象の暗号通貨", "str", "btc または mona"
    "rate", "決済時の換算レート", "int", "　"
    "btc", "Bitcoinによる請求額（bitcoinによる決済時のみ）", "int", "　"
    "mona", "Monacoinによる請求額（monacoinによる決済時のみ）", "int", "　"
    "address", "BitcoinまたMonacoinの決済用支払先アドレス", "str", "　"
    "BIP21", "bitcoinまたはmonacoinの支払いURI", "str", "　"
    "speed", "決済スピード（送信されたものまたはデフォルトで適用されたもの", "str", "　"
    "orderNumber", "送信された注文番号", "str", "　"

キャンセル失敗時はエラーが帰るため、成功時のstatusは常に'canceled'となります
