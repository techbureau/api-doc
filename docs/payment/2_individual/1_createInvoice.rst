=============================
createInvoice
=============================

* インボイスの作成
決済金額・商品名・通貨などの情報を送信してインボイスを作成し、暗号通貨による決済を開始します。
インボイスを作成すると、決済用のBitcoinまたはMonacoinアドレスが発行され、暗号通貨建ての請求が行なわれます。
インボイスには有効期限（現在３０分としていますが、これは変更になる可能性があります）があり、有効期限内に顧客が決済用のアドレスへ支払を行うことにより、決済が完了します。

パラメータ
==============
.. csv-table::
   :header: "パラメーター", "必須", "詳細", "型", "値または例"
   :widths: 5, 5, 30, 3, 5

   "method", "Yes", "メソッド名", "str", "createInvoice"
   "key", "Yes", "APIキー", "str", "　"
   "md5secret", "Yes(1)", "APIシークレットのmd5。(1)md5またはsha1のどちらかをセット", "str", "　"
   "sha1secret", "Yes(1)", "APIシークレットのsha1。(1)md5またはsha1のどちらかをセット", "str", "　"
   "nonce", "Yes", "APIシークレットのsha1。(1)md5またはsha1のどちらかをセット", "int", "　"
   "speed", "No", "決済完了とみなすスピード。デフォルトはmedium high:0 cofirmation/medium:1 confirmation/low:6 confirmations", "str", "high medium low"
   "notificationUri", "No", "決済完了したタイミングでの通知先URI 事業者様のECサイトシステムに通知を行うためのものになります", "str", "　"
   "notificationMethod", "No", "決済完了したタイミングでの通知先URIへ通知する際に使用されるHTTPメソッド。デフォルトはPOSTになります", "str", "GET または POST"
   "redirectUri", "No", "決済フォームで着金後、ECサイトへ戻るためのリダイレクト先のURI。設定されなかった場合はリダイレクトせず着金後のステータスが表示されます", "str", "　"
   "currency", "Yes", "決済に使用する暗号通貨", "str", "btc または mona"
   "amount", "Yes", "決済金額（日本円）。実際の請求対象金額。1円単位、カンマ無し", "int", "　"
   "subTotal", "No", "小計（日本円）", "int", "　"
   "tax", "No", "消費税（日本円）", "int", "　"
   "regularPrice", "No", "定価（日本円）。割引前の金額", "int", "　"
   "discount", "No", "割引（日本円）。値引き額", "int", "　"
   "merchantName", "No", "店舗名", "str", "　"
   "orderNumber", "No", "注文番号。店舗側での識別用に任意の番号やコードを利用することができます", "str", "　"
   "referenceNumber", "No", "リファレンス番号。店舗側での識別用に任意の番号やコードを利用することができます", "str", "　"
   "itemName", "No", "商品名", "str", "　"
   "buyerId", "No", "利用者ID", "str", "　"
   "buyerName", "No", "利用者名", "str", "　"
   "buyerKana", "No", "利用者ふりがな", "str", "　"
   "buyerZip", "No", "利用者郵便番号", "str", "　"
   "buyerAddr1", "No", "利用者住所１", "str", "　"
   "buyerAddr2", "No", "利用者住所２", "str", "　"
   "buyerAddr3", "No", "利用者住所３", "str", "　"
   "buyerPhone", "No", "利用者電話番号", "str", "　"
   "buyerCellphone", "No", "利用者携帯番号", "str", "　"
   "buyerEmail", "No", "利用者メールアドレス", "str", "　"

|
* *speed（決済スピード）について*
    highとすると、暗号通貨ネットワーク上での送金トランザクションについて、確認前の状態でも、着金次第決済完了とみなします。
    mediumとすると、1件以上の確認が入ったタイミングで決済完了とみなします。これはbitcoinで平均10分、monacoinで平均2分程度になります。
    lowとすると、6件以上の確認が入ったタイミングで決済完了とみなします。これはbitcoinで平均1時間、monacoinで平均12分程度になります。
    highとすると顧客側の送金が完了したタイミングとほぼ同時に着金し、決済完了とみなされますが、万一このトランザクションがネットワーク上で認証されなかった場合、決済が後から取り消しされる場合があります。

* *利用者の氏名・住所などについて*
    利用者の氏名・住所・電話番号などのフィールドについては、送信していただくと決済フォームに表示されます。ただし、利用者IDについては表示されません。 決済フォームはインボイスIDがもれない限りアクセスすることができませんが、インターネット上ではアクセス制限なしに公開される状態になりますので、個人情報保護の観点から、必要でない場合（注文番号などから顧客が関連付けできる場合）は顧客の情報を送信されないことをお勧めします。

|
戻り値
==============
* 成功時のJSON、10800円をBTC決済でリクエストした例
.. code-block:: python

    {
        "success": 1,
        "return": {
            "invoiceId": "d7dd735c-1650-11e5-b412-4437e6999eec",
            "invoiceUri": "https://zaif.jp/invoice/form/d7dd735c-1650-11e5-b412-4437e6999eec",
            "invoiceIframeUri": "https://zaif.jp/invoice/iframe/d7dd735c-1650-11e5-b412-4437e6999eec",
            "created": 1434696690,
            "expired": 1434698490,
            "amount": 10800,
            "currency": "btc",
            "rate": "30012",
            "btc": "0.359856",
            "address": "19yhwoY8ysDNy1J1JBZf6nRBsUfLTe2Lvb",
            "BIP21": "bitcoin:19yhwoY8ysDNy1J1JBZf6nRBsUfLTe2Lvb?amount=0.359856",
            "speed": "high",
            "orderNumber": "<the order number if you sent>"
        }
    }

|
* 成功時のJSON、10000円をMONA決済でリクエストした例
.. code-block:: python

    {
        "success": 1,
        "return": {
            "invoiceId": "d0e521f5-287a-4d24-95d2-ec83a00ce173",
            "invoiceUri": "https://zaif.jp/invoice/form/d0e521f5-287a-4d24-95d2-ec83a00ce173",
            "invoiceIframeUri": "https://zaif.jp/invoice/iframe/d0e521f5-287a-4d24-95d2-ec83a00ce173",
            "created": 1434696670,
            "expired": 1434698470,
            "amount": 10000,
            "currency": "mona",
            "rate": "20.0000",
            "mona": "500.000000",
            "address": "M81ZgKgg16GCQ9a9dGzrtnSWma3dB15HDw",
            "BIP21": "monacoin:M81ZgKgg16GCQ9a9dGzrtnSWma3dB15HDw?amount=500.000000",
            "speed": "medium",
            "orderNumber": "<the order number if you sent>"
        }
    }

|
* returnパラメーター

.. csv-table::
    :header: "キー", "詳細", "型", "値または例"
    :widths: 5, 15, 3, 10

    "invoiceId", "作成したインボイスを識別するためのID", "str", "04e42516-1652-11e5-9eb4-4437e6999eec"
    "invoiceUri", "作成したインボイスに対する支払フォームのURI", "str", "　"
    "invoiceIframeUri", "作成したインボイスに対するiframe版支払フォームのURI", "str", "　"
    "created", "インボイス作成日時。unixtime", "int", "　"
    "expired", "インボイスの有効期限。unixtime", "int", "　"
    "amount", "決済対象金額（送信された金額）", "int", "　"
    "currency", "決済対象の暗号通貨", "str", "btc または mona"
    "rate", "決済時の換算レート", "int", "　"
    "btc", "Bitcoinによる請求額（bitcoinによる決済時のみ）", "int", "　"
    "mona", "Monacoinによる請求額（monacoinによる決済時のみ）", "int", "　"
    "address", "BitcoinまたMonacoinの決済用支払先アドレス", "str", "　"
    "BIP21", "bitcoinまたはmonacoinの支払いURI", "str", "　"
    "speed", "決済スピード（送信されたものまたはデフォルトで適用されたもの", "str", "　"
    "orderNumber", "送信された注文番号（送信された場合のみ）", "str", "　"
    "referenceNumber", "送信されたリファレンス番号（送信された場合のみ）", "str", "　"
    "buyerId", "送信された利用者ID（送信された場合のみ）", "str", "　"

|
決済完了通知(notificationUri)について
==========================================

notificationUriを設定した場合、speedで設定した状態となったタイミングで、決済完了の通知がHTTP(S)で送信されます。

* 送信されるパラメーター

.. csv-table::
    :header: "キー", "詳細", "型", "値または例"
    :widths: 5, 15, 3, 10

    "invoiceId", "作成したインボイスを識別するためのID", "str", "04e42516-1652-11e5-9eb4-4437e6999eec"
    "settled", "決済完了日時。unixtime", "int", "　"
    "amount", "決済対象金額（送信された金額）", "int", "　"
    "btc", "Bitcoinによる請求額（bitcoinによる決済時のみ）", "int", "　"
    "mona", "Monacoinによる請求額（monacoinによる決済時のみ）", "int", "　"
    "address", "BitcoinまたMonacoinの決済用支払先アドレス", "str", "　"
    "orderNumber", "設定された注文番号（送信された場合のみ）", "str", "　"
    "referenceNumber", "設定されたリファレンス番号（送信された場合のみ）", "str", "　"
    "buyerId", "設定された利用者ID（送信された場合のみ）", "str", "　"

|
* notificationMethodにGETを設定した場合は、パラメーターは送信されません
    notificationMethodにGETを設定した場合は、パラメーターは一切送信されません。 notificationMethodにGETを設定する場合、notificationUriに注文を識別できるような工夫をして設定してください

* 通知のエラー時の対応について
    エラー時の再送については準備中です。

|
決済完了時のリダイレクト(redirectUri)について
==================================================

顧客がzaif上の決済フォームを表示したまま送金（支払い）したとき、暗号通貨ネットワーク上で着金を確認したタイミングで自動的にリダイレクトされます。
redirectUriを設定してない場合はリダイレクトされず、こちらのフォームが表示されたままになります。その際、入金ステータスは自動的に更新されます。


Bitcoin建てまたはMonacoin建ての決済
==========================================

円建てではなく、Bitcoin建てまたはMonacoin建てでの決済を行うことができます。
createInvoiceのbillingCurrencyパラメーター（一覧にはないパラメーターです）に"btc"または"mona"を指定して下さい。このときcurrencyパラメーターも同じ暗号通貨を指定する必要があります。
返り値からrateは削除されることに注意してください。
BTCまたはMONAがそのまま決済事業者様のアカウントに精算されますので、決済手数料は完全にゼロ％になりますが、円換算を行う際の相場の変動リスクはそのまま決済事業者様が担うことになりますことにご注意ください。
