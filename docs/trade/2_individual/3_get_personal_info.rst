=============================
get_personal_info
=============================


チャットに使用されるニックネームと画像のパスを返します。

パラメータ
==============
なし

実行例
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "ranking_nickname": "ニックネーム",
            "icon_path": "https://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png"
        }
    }

    .. csv-table::
       :header: "キー", "詳細", "型"

       "funds", "残高", "dict"
       "deposit", "余力?", "dict"
       "rights", "APIキーの確認", "dict"
       "trade_count", "総トレード数", "int"
       "open_orders", "アクティブな注文", "int"
       "server_time", "サーバータイム", "int"
