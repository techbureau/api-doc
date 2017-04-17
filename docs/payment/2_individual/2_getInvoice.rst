=============================
getInvoice
=============================


* インボイス情報の取得
作成したインボイスの情報を得ることができます。

|
パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須", "詳細", "型", "値または例"
   :widths: 5, 5, 25, 3, 5

   "method", "Yes", "メソッド名", "str", "getInvoice"
   "key", "Yes", "APIキー", "str", "　"
   "md5secret", "Yes(1)", "APIシークレットのmd5。(1)md5またはsha1のどちらかをセット", "str", "　"
   "sha1secret", "Yes(1)", "APIシークレットのsha1。(1)md5またはsha1のどちらかをセット", "str", "　"
   "nonce", "Yes", "1以上の数、呼び出し毎に増分して送信してください", "int", "　"
   "invoiceId", "Yes", "発行されたinvoiceId", "str", "　"

|
戻り値
==============
* returnパラメーター

.. csv-table::
    :header: "キー", "詳細", "型", "値または例"
    :widths: 5, 20, 3, 10

    "invoiceId", "作成したインボイスを識別するためのID", "str", "04e42516-1652-11e5-9eb4-4437e6999eec"
    "created", "インボイス作成日時。unixtime", "int", "　"
    "expired", "インボイスの有効期限。unixtime", "int", "　"
    "status", "インボイスの状態", "str", "new/paid/confirmed/complete/expired/invalid"
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

|
インボイスの状態(status)
==========================
インボイスには下記のような「状態」があります。
    * new : 作成され、請求が開始された状態
    * paid : 支払先アドレスに対して入金が行なわれ、着金した状態（speed=highの場合の決済完了タイミング）
    * confirmed : 支払先アドレスに対する入金が暗号通貨ネットワーク上で1確認以上された状態（speed=mediumの場合の決済完了タイミング）
    * complete : 支払先アドレスに対する入金が暗号通貨ネットワーク上で6確認以上された状態（speed=lowの場合の決済完了タイミング）
    * expired : 支払先アドレスに対して入金が行なわれず、有効期限が切れた状態
    * invalid : 支払先アドレスに対して入金が開始されたが、なんらかの理由で確認されなかった状態や、入金金額が不足した状態で有効期限が切れた状態
    * canceled : 作成者によりキャンセルされた状態

|
インボイスの状態と他に、決済完了とみなすかどうかについては、インボイス作成時に設定されたspeedに従って下記の項目が対応します。
    * settled: 決済完了日時（unixtime）、speedに応じて決済を完了とみなしたタイミングでセットされます
