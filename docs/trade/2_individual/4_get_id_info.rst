=============================
get_id_info
=============================


ユーザーIDやメールアドレスといった個人情報を取得します

パラメータ
==============
なし

実行例
==============
.. code-block:: python

    {
        "success": 1,
        "return": {
            "user": {
                "id": "ユーザID",
                "email": "メールアドレス",
                "name": "名前",
                "kana": "名前カナ",
                "certified": true
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "id", "", "dict"
   "email", "still", "dict"
   "name", "APIキー", "dict"
   "kana", "総トレード数", "int"
   "certified", "認証済み", "bool"
