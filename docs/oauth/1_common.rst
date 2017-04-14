===========================
OAuth認証機能の利用手順
===========================

OAuth認証機能を利用するには
================================
Zaifのアカウント情報を利用したサービス(以下クライアントサービス)を展開する業者(以下クライアント)がOAuth認証機能を利用できるようにするための手順を記述します。

    .. image:: images/oauth_slideshow_1.png

    .. image:: images/oauth_slideshow_2.png

1. *サービス基本情報を登録します*
    Zaifにログインし、『アカウント』→『連携アプリケーション基本設定』から「連携アプリケーションの情報を新しく作成する」ボタンを押下し、サービスの詳細な情報を設定してください。

.. csv-table::
    :header: "項目名", "value例", "補足", "必須"

    "名称", "自動取引BOT設定", "クライアントが各設定を見分けるための名称です。", "Yes"
    "リダイレクトURI", "https://auto.bot.co.jp/zaif_oauth", "認可クリア後、必要なパラメータを受け取るためのリダイレクトURL設定してください。", "No 未設定の場合、後述する認可画面リダイレクトパラメータに指定されるredirect_uriが利用されます。"
    "サービス名称", "自動取引BOT", "サービスの名称を設定してください。", "Yes"
    "サービスイメージURL", "https://auto.bot.co.jp/service_image.png", "サービスのイメージ画像のURLを設定してください。", "No"
    "サービスURL", "https://auto.bot.co.jp/", "サービスのURLを設定してください。", "No"
    "サービス利用規約URL", "https://auto.bot.co.jp/terms", "サービスの利用規約のURLを設定してください。", "No"
    "サービスプライバシーポリシーURL", "https://auto.bot.co.jp/policy", "サービスのプライバシープリシーのURLを設定してください。", "No"


2. *Zaifアカウント認可画面へのリダイレクトを行えるようにします*
    クライアントサービスのログイン画面等に、Zaifアカウント認可画面(https://zaif.jp/oauth)へ必要なパラメータを追加してリダイレクトを行えるようにしてください。

.. csv-table::
    :header: "キー", "value例", "補足", "必須"

    "client_id", "a3823d2a30f24e39980ebe7943b55737", "連携アプリケーション基本情報登録時に発行されるIDを指定してください。", "Yes"
    "response_type", "code", "固定です。", "Yes"
    "scope", "info%20trade", "認可したい機能を半角空白(エンコード時は%20)で区切って指定してください、詳細は下記scope詳細をご確認ください。", "Yes"
    "state", "2a99cc45cef04c358dbc26db880f9d03", "リダイレクトするたびに一意の文字列を指定してください。", "Yes"
    "redirect_uri", "http://your_domain/zaif_redirect", "発行されたcode(後述)を取得するためのリダイレクト先を指定してください。", "No 未指定の場合はサービス基本情報登録時に指定したリダイレクトURLが使用されます"
    "lang", "en", "表示言語を明示的に指定したい場合に指定してください", "No 未指定の場合ブラウザの言語設定を参照して自動で言語情報を切り替えます。"

.. csv-table::
    :header: "名称", "詳細", "補足"

    "info", "データ参照", "　"
    "trade", "通貨のトレード", "　"
    "withdraw", "口座への引き出し", "すべてのクライアントが指定できるわけではありません。詳しくはサポートまでご連絡ください。"

リダイレクトに成功すると、下記のような認証画面が表示されます。

    .. image:: images/oauth_screenshot.png



3. *リダイレクトされた情報を解析します*
    サービス利用ユーザ(以下ユーザ)が認証に成功すると、指定したリダイレクトURLにリクエストが発行されるので、パラメータを解析し、認可処理を行ってください。

.. csv-table::
    :header: "キー", "value例", "詳細"

    "code", "cb533e906a984b0e8ba4efae3af0c7cb", "Zaifが発行した一意の文字列です。後述のトークン発行時に利用します。"
    "state", "2a99cc45cef04c358dbc26db880f9d03", "リダイレクト時に付与したstateパラメータと同値です。成りすまし対策として、必ず同値であるかチェックしてください。"


4. *tokenをリクエストします*
    前述のcodeパラメータを使って、tokenが取得できるWeb APIを実行し、tokenを取得します。なお、戻り値はJSONになります。

    エンドポイント:https://oauth.zaif.jp/v1/token

    メソッド:POST


トークン発行APIパラメータ
=============================

.. csv-table::
    :header: "キー", "value例", "補足", "必須"

    "grant_type", "authorization_code", "固定です。", "Yes"
    "code", "code", "リダイレクトされたcode値を指定してください。", "Yes"
    "client_id", "9r88i445cef04c358dbc26db880f9d03", "アプリケーション基本情報登録時に発行されたクライアントIDを指定してください。", "Yes"
    "client_secret", "2a99cc45cef04c358dbc26db880f9d03", "アプリケーション基本情報登録時に発行されたクライアントシークレットを指定してください。", "Yes"
    "redirect_uri", "http://your_domain/zaif_redirect", "リダイレクトしたいURLを指定してください。", "No 認可画面リダイレクト時に指定している場合必ず同値を指定してください。", "Yes"

トークン発行API戻値
========================

.. csv-table::
    :header: "キー", "value例", "補足"

    "token_type", "bearer", "固定です。"
    "state", "2a99cc45cef04c358dbc26db880f9d03", "リダイレクト時に付与したstateパラメータと同値です。"
    "access_token", "bb12f3de5df2472290ff15331824a9cf", "APIを利用する時に指定するトークンです。"
    "refresh_token", "ef972ad13e484e17abffbfd5dba51750", "利用期限が切れたaccess tokenを再発行するために使用します。"
    "expires_in", "3600", "access tokenの期限です。単位は秒です。"

5. *APIを実行します*
    今までHTTPヘッダにkey、signパラメータを付与して実行していた取引APIですが、取得したtokenを利用すればそれらは必要なくなります。

    発行されたaccess tokenをtokenパラメータとしてリクエスト発行時にHTTPヘッダに付与し、APIを実行して下さい。

6. *access tokenの期限が切れた場合*
    期限が切れたaccess tokenは利用できなくなります。下記tokenの再発行Web APIを利用して、token を再発行して下さい。

    エンドポイント:https://oauth.zaif.jp/v1/refresh_token

    メソッド:POST

トークン再発行APIパラメータ
===========================

.. csv-table::
    :header: "キー", "value例", "補足", "必須"

    "grant_type", "refresh_token", "固定です。", "Yes"
    "refresh_token", "ef972ad13e484e17abffbfd5dba51750", "トークン発行API実行時に取得したrefresh tokenを指定してください。", "Yes"
    "client_id", "9r88i445cef04c358dbc26db880f9d03", "アプリケーション基本情報登録時に発行されたクライアントIDを指定してください。", "Yes"
    "client_secret", "2a99cc45cef04c358dbc26db880f9d03", "アプリケーション基本情報登録時に発行されたクライアントシークレットを指定してください。", "Yes"


トークン再発行API戻値
===========================

.. csv-table::
    :header: "キー", "value例", "補足"

    "token_type", "bearer", "固定です。"
    "access_token", "5a9b1fcfd3e241a6a83f411ade015c18", "APIを利用する時に指定するトークンです。"
    "refresh_token", "0899f2b6c8614bce88934e6561cb47fb", "利用期限が切れたaccess tokenを再発行するために使用します。"
    "expires_in", "3600", "access tokenの期限です。単位は秒です。"


補足
===========================
    ユーザが認証したアプリケーションの情報を削除したい場合は、『アカウント』→『連携アプリケーション一覧』を選択し、削除したいアプリケーション情報の削除ボタンを押下してください。
