=============================
createInvoice
=============================


決済金額・商品名・通貨などの情報を送信してインボイスを作成し、暗号通貨による決済を開始します。
インボイスを作成すると、決済用のBitcoinまたはMonacoinアドレスが発行され、暗号通貨建ての請求が行なわれます。
インボイスには有効期限（現在３０分としていますが、これは変更になる可能性があります）があり、有効期限内に顧客が決済用のアドレスへ支払を行うことにより、決済が完了します。

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

* *speed（決済スピード）について*
    highとすると、暗号通貨ネットワーク上での送金トランザクションについて、確認前の状態でも、着金次第決済完了とみなします。
    mediumとすると、1件以上の確認が入ったタイミングで決済完了とみなします。これはbitcoinで平均10分、monacoinで平均2分程度になります。
    lowとすると、6件以上の確認が入ったタイミングで決済完了とみなします。これはbitcoinで平均1時間、monacoinで平均12分程度になります。
    highとすると顧客側の送金が完了したタイミングとほぼ同時に着金し、決済完了とみなされますが、万一このトランザクションがネットワーク上で認証されなかった場合、決済が後から取り消しされる場合があります。

* *利用者の氏名・住所などについて*
    利用者の氏名・住所・電話番号などのフィールドについては、送信していただくと決済フォームに表示されます。ただし、利用者IDについては表示されません。 決済フォームはインボイスIDがもれない限りアクセスすることができませんが、インターネット上ではアクセス制限なしに公開される状態になりますので、個人情報保護の観点から、必要でない場合（注文番号などから顧客が関連付けできる場合）は顧客の情報を送信されないことをお勧めします。


実行例
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


決済完了通知(notificationUri)について
==========================================

notificationUriを設定した場合、speedで設定した状態となったタイミングで、決済完了の通知がHTTP(S)で送信されます。

*送信されるパラメーター
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

* notificationMethodにGETを設定した場合は、パラメーターは送信されません
    notificationMethodにGETを設定した場合は、パラメーターは一切送信されません。 notificationMethodにGETを設定する場合、notificationUriに注文を識別できるような工夫をして設定してください

* 通知のエラー時の対応について
    エラー時の再送については準備中です。

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
